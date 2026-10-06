#!/bin/sh

# Purpose: convert single file markdown to PDF
# Usage: sh path/to/markdown-to-pdf.sh FILE.md
# Dependencies: pandoc, pandoc-ext-diagram, mermaid-cli, ffmpeg, librsvg
# Date: 2026-10-01
# Author: Yusong

set -e

check_if_installed() {
  cmd="$1"
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "Error: Cannot find '$cmd' command. Please install it first."
    exit 1
  fi
}

check_if_installed pandoc
check_if_installed mmdc
check_if_installed rsvg-convert
check_if_installed ffmpeg

# Ensures that there's exactly one positional parameter.
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 FILE.md"
  exit 1
fi

input_dir=$(dirname "$1")
input_file=$(basename "$1")
output="${input_file%.md}.pdf"

# LaTeX cannot embed WebP images, so convert them to PNG on the fly.
tmpdir=$(mktemp -d)
trap 'rm -rf "$tmpdir"' EXIT

cat >"$tmpdir/webp-to-png.lua" <<'LUA'
local tmpdir = assert(os.getenv("WEBP_TO_PNG_TMPDIR"))
local counter = 0

local function to_png(src)
  if not src:lower():match("%.webp$") then
    return nil
  end
  counter = counter + 1
  local out = string.format("%s/%d.png", tmpdir, counter)
  pandoc.pipe("ffmpeg", { "-y", "-loglevel", "error", "-i", src, out }, "")
  return out
end

function Image(img)
  local out = to_png(img.src)
  if out then
    img.src = out
    return img
  end
end
LUA

echo "Generating a PDF file from '$input_dir/$input_file'..."

cd "$input_dir"
WEBP_TO_PNG_TMPDIR="$tmpdir" pandoc \
  -L "$tmpdir/webp-to-png.lua" \
  -L "$(nix build nixpkgs#pandoc-ext-diagram --no-link --print-out-paths)/diagram.lua" \
  -V geometry:a4paper,margin=1in \
  -o "$output" \
  "$input_file"

echo "Completed with the output file: '$input_dir/$output'."
