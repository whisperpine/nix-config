#!/bin/sh

# Purpose: batch-convert PNG and JPG files to WebP
# Usage: sh path/to/convert-to-webp.sh
# Dependencies: ffmpeg
# Date: 2025-04-29
# Author: Yusong

set -e

# Check if ffmpeg is installed.
if ! command -v ffmpeg >/dev/null 2>&1; then
  echo "ffmpeg is not installed. Please install it first."
  exit 1
fi

# Flag to track if any files were found.
found_files=0

# Loop through all PNG and JPG files in the current directory.
for file in *.png *.jpg *.jpeg *.PNG *.JPG *.JPEG; do
  # Check if any PNG or JPG files exist.
  if [ -f "$file" ]; then
    found_files=1
    # Get the filename without the extension.
    base_name="${file%.*}"
    # Convert to WebP.
    ffmpeg -i "$file" "${base_name}.webp"
  fi
done

# Check if no file was found.
if [ "$found_files" -eq 0 ]; then
  echo "No PNG or JPG files found in the current directory."
  exit 0
fi
