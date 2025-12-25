#!/bin/sh

# Purpose: search an English word in Collins Dictionary
# Usage: sh path/to/fuzzel-dict.sh
# Dependencies: fuzzel
# Date: 2025-12-26
# Author: Yusong

# Type the query.
query=$(fuzzel --dmenu --width 50 --lines 0 --prompt "󰺄  Collins Dictionary: ")

# Make sure the query isn't empty.
[ -z "$query" ] && exit

# Open the browser.
xdg-open "https://www.collinsdictionary.com/search/?dictCode=english&q=$query"
