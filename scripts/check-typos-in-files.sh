#!/bin/sh

# Purpose: check typos in pre-commit hook and CI
# Usage: sh path/to/check-typos-in-files.sh
# Dependencies: typos
# Date: 2025-06-27
# Author: Yusong

# Check if typos is installed.
if ! command -v typos >/dev/null 2>&1; then
    echo "typos is not installed. Please install it first."
    exit 1
fi

typos --hidden --exclude .git
