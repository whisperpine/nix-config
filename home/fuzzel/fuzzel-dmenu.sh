#!/usr/bin/env bash

# Purpose: search something and open in the browser
# Usage: sh path/to/fuzzel-dmenu.sh
# Dependencies: fuzzel, xdg-open
# Date: 2025-12-18
# Author: Yusong

set -euo pipefail

# Define search engines.
declare -A engines
engines=(
  # --- search engine --- #
  ["  Google AI"]="https://google.ai/search?q="
  # ["  Google"]="https://www.google.com/search?q="
  ["󰇥  DuckDuckGo"]="https://duckduckgo.com/?&q="
  # ["󰂤  Bing"]="https://www.bing.com/search?q="

  # --- social media --- #
  ["󰗃  YouTube"]="https://www.youtube.com/results?search_query="
  ["  Steam"]="https://store.steampowered.com/search?term="
  ["  Reddit"]="https://www.reddit.com/search/?q="
  ["  Twitter X"]="https://x.com/search?q="

  # --- dictionary --- #
  ["󰺄  Collins Dictionary"]="https://www.collinsdictionary.com/search/?dictCode=english&q="
  ["󰊿  Google Translate"]="https://translate.google.com/?source=osdd&sl=auto&tl=auto&op=translate&text="
  ["󰺄  Urban Dictionary"]="https://www.urbandictionary.com/define.php?term="

  # --- documents --- #
  ["  Nerd Fonts"]="https://www.nerdfonts.com/cheat-sheet?q="
  ["󱄅  Home Manager"]="https://home-manager-options.extranix.com/?release=master&query="
  ["󱄅  NixOS Packages"]="https://search.nixos.org/packages?channel=unstable&query="
  ["󱉟  MDN"]="https://developer.mozilla.org/en-US/search?q="
  ["  Docs.rs"]="https://docs.rs/releases/search?query="
  # ["  TLDR"]="https://tldr.inbrowser.app/search?query="
  # ["  Can I use"]="https://caniuse.com/?search="
  ["󰖬  Wikipedia"]="https://en.wikipedia.org/wiki/Special:Search?search="

  # --- package registry --- #
  ["  PyPI"]="https://pypi.org/search/?q="
  ["󱁢  Terraform"]="https://registry.terraform.io/search/providers?q="
  ["󰡨  Docker Hub"]="https://hub.docker.com/search?q="
  ["  Lib.rs"]="https://lib.rs/search?q="
  ["  Crates.io"]="https://crates.io/search?q="
  ["  Npm"]="https://www.npmjs.com/search?q="

  # --- code bases --- #
  ["  GitHub"]="https://github.com/search?q="
  # ["  GitLab"]="https://gitlab.com/search?search="
  # ["  Codeberg"]="https://codeberg.org/explore/repos?only_show_relevant=true&sort=moststars&q="
)

# Function to check if a command exists.
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Check if fuzzel is installed.
if ! command_exists fuzzel; then
  echo "Error: fuzzel is not installed. Please install it first." >&2
  exit 1
fi

# Check if xdg-open is installed.
if ! command_exists xdg-open; then
  echo "Error: xdg-open is not installed. Please install it first." >&2
  exit 1
fi

# Choose the search engine.
engine_name=$(printf "%s\n" "${!engines[@]}" | fuzzel --dmenu --prompt "Search on: ")
# Exit if no engine is selected.
[[ ! -v engines[$engine_name] ]] && exit

# Type the query.
query=$(fuzzel --dmenu --width 50 --lines 0 --prompt "$engine_name: ")
# Exit if the query is empty.
[ -z "$query" ] && exit
# URL encode the query handling spaces.
encoded_query=$(printf '%s' "$query" | sed 's/ /+/g')

# Open the browser.
xdg-open "${engines[$engine_name]}$encoded_query"
