#!/bin/sh

# Purpose: convert single file markdown to PDF
# Usage: sh path/to/markdown-to-pdf.sh FILE.md
# Dependencies: pandoc, pandoc-ext-diagram, mermaid-cli
# Date: 2026-10-01
# Author: Yusong

if ! command -v pandoc >/dev/null 2>&1; then
  echo "Error: Cannot find 'pandoc' command. Please install it first."
  exit 1
fi

if ! command -v mmdc >/dev/null 2>&1; then
  echo "Error: Cannot find 'mmdc' command. Please install it first."
  exit 1
fi

convert() {
  filename="$(basename "$1" ".md")"
  pandoc \
    -L "$(nix build nixpkgs#pandoc-ext-diagram --no-link --print-out-paths)/diagram.lua" \
    -V geometry:a4paper,margin=1in \
    -o "$filename".pdf \
    "$filename".md
}

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 FILE.md"
  exit 1
fi

convert "$1"
