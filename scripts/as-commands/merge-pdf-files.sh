#!/usr/bin/env bash

# Purpose: merge PDF files into one with normalized width
# Usage: bash path/to/merge-pdf-files.sh OUTPUT.pdf INPUT1.pdf [INPUT2.pdf ...]
# Dependencies: qpdf, gs (ghostscript)
# Date: 2026-09-07
# Author: Yusong

set -euo pipefail

if [[ $# -lt 2 ]]; then
  echo "Usage: merge-pdf-files.sh OUTPUT.pdf INPUT1.pdf [INPUT2.pdf ...]"
  exit 1
fi

if ! command -v qpdf >/dev/null 2>&1; then
  echo "Error: Cannot find 'qpdf' command. Please install it first."
  exit 1
fi

if ! command -v gs >/dev/null 2>&1; then
  echo "Error: Cannot find 'gs' command. Please install 'ghostscript' first."
  exit 1
fi

output=$1
shift

tmpdir=$(mktemp -d)
trap 'rm -rf "$tmpdir"' EXIT

normalized=()

for i in "$@"; do
  out="$tmpdir/$(printf '%04d' "${#normalized[@]}").pdf"

  gs \
    -q \
    -sDEVICE=pdfwrite \
    -dNOPAUSE \
    -dBATCH \
    -sPAPERSIZE=a4 \
    -dFIXEDMEDIA \
    -dPDFFitPage \
    -sOutputFile="$out" \
    "$i"

  normalized+=("$out")
done

qpdf --empty --pages "${normalized[@]}" -- "$output"

echo "Created: $output"
