#!/bin/sh

# Purpose: convert single file markdown to PDF
# Usage: sh path/to/markdown-to-pdf.sh FILE.md
# Dependencies: pandoc, mermaid-cli, ffmpeg, librsvg, texlive
# Date: 2026-10-01
# Author: Yusong

# Note: The PDF engine and fonts can be overridden via environment variables.
# e.g. `MARKDOWN_PDF_MAIN_FONT="Sarasa Gothic SC" markdown-to-pdf.sh README.md`.

set -e

# PDF engine and fonts. XeLaTeX is required for fontspec.
pdf_engine="${MARKDOWN_PDF_ENGINE:-xelatex}"
main_font="${MARKDOWN_PDF_MAIN_FONT:-Libertinus Serif}" # alternative: e.g. "Sarasa Gothic SC"
sans_font="${MARKDOWN_PDF_SANS_FONT:-$main_font}"
mono_font="${MARKDOWN_PDF_MONO_FONT:-Cascadia Code}"
# Font size, e.g. "11pt" or "14". The `article` class only accepts 10pt,
# 11pt and 12pt; any other size uses the KOMA-Script `scrartcl` class.
font_size="${MARKDOWN_PDF_FONT_SIZE:-12pt}"
case "$font_size" in
*pt) ;;
*) font_size="${font_size}pt" ;;
esac
documentclass="article"
case "$font_size" in
10pt | 11pt | 12pt) ;;
*) documentclass="scrartcl" ;;
esac

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
check_if_installed "$pdf_engine"

# Ensures that there's exactly one positional parameter.
if [ "$#" -ne 1 ]; then
  echo "Usage: $(readlink -f "$0") FILE.md"
  exit 1
fi

if [ ! -e "$1" ]; then
  echo "Error: File doesn't exist: '$1'."
  exit 1
fi

input_dir=$(dirname "$1")
input_file=$(basename "$1")
output="${input_file%.md}.pdf"
script_dir="$(dirname "$(readlink -f "$0")")"

echo "Generating a PDF file from '$input_dir/$input_file'..."

# LaTeX cannot embed WebP images, so convert them to PNG on the fly.
tmpdir=$(mktemp -d)
trap 'rm -rf "$tmpdir"' EXIT

cd "$input_dir"

# Note: WEBP_TO_PNG_TMPDIR is used by "webp-to-png.lua".
WEBP_TO_PNG_TMPDIR="$tmpdir" pandoc \
  -L "$script_dir/markdown-to-pdf/webp-to-png.lua" \
  -L "$script_dir/markdown-to-pdf/diagram.lua" \
  -V geometry:a4paper,margin=1in \
  --pdf-engine "$pdf_engine" \
  -V "mainfont=$main_font" \
  -V "sansfont=$sans_font" \
  -V "monofont=$mono_font" \
  -V "documentclass=$documentclass" \
  -V "fontsize=$font_size" \
  -o "$output" \
  "$input_file"

echo "Completed with the output file: '$input_dir/$output'."
