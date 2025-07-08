#!/bin/sh

# Purpose: convert CJK punctuations to ASCII ones
# Usage: sh path/to/punctuation-cjk-to-ascii.sh
# Date: 2025-06-26
# Author: Yusong

if [ $# -ne 1 ]; then
    echo "Usage: $0 FILE"
    exit 1
fi

filepath="$1"

backup_path="${filepath}.bak"
if [ -e "$backup_path" ]; then
    echo "Error: file or directory '$backup_path' exists."
    echo "Hints: consider deleting '$backup_path' and try again."
    exit 1
fi
cp "$filepath" "$backup_path"
echo "Input file has been copied to '${backup_path}'."

# shellcheck disable=SC1111
sed -i "s/“/ \"/g" "$filepath"
# shellcheck disable=SC1111
sed -i "s/”/\" /g" "$filepath"
sed -i "s/「/ \"/g" "$filepath"
sed -i "s/」/\" /g" "$filepath"
sed -i "s/。/. /g" "$filepath"
sed -i "s/，/, /g" "$filepath"
sed -i "s/（/ (/g" "$filepath"
sed -i "s/）/) /g" "$filepath"
sed -i "s/【/ (/g" "$filepath"
sed -i "s/】/) /g" "$filepath"
sed -i "s/：/: /g" "$filepath"
sed -i "s/；/. /g" "$filepath"
sed -i "s/？/? /g" "$filepath"
sed -i "s/！/! /g" "$filepath"
sed -i "s/、/, /g" "$filepath"
sed -i "s/《/ \"/g" "$filepath"
sed -i "s/》/\" /g" "$filepath"
sed -i "s/〈/ \"/g" "$filepath"
sed -i "s/〉/\" /g" "$filepath"
