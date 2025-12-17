#!/usr/bin/env bash

# Define search engines.
declare -A engines
engines=(
  ["Google"]="https://www.google.com/search?q="
  ["GitHub"]="https://github.com/search?q="
  ["YouTube"]="https://www.youtube.com/results?search_query="
  ["Docs.rs"]="https://docs.rs/releases/search?query="
  ["Collins Dictionary"]="https://www.collinsdictionary.com/search/?dictCode=english&q="
  ["PyPI"]="https://pypi.org/search/?q="
  ["Home Manager"]="https://home-manager-options.extranix.com/?query="
  ["NixOS Packages"]="https://search.nixos.org/packages?query="
  ["Google Translate"]="https://translate.google.com/?source=osdd&sl=auto&tl=auto&op=translate&text="
  # ["GitLab"]="https://gitlab.com/search?search="
  # ["lib.rs"]="https://lib.rs/search?q="
  # ["crates.io"]="https://crates.io/search?q="
  # ["tldr"]="https://tldr.inbrowser.app/search?query="
  # ["Can I use"]="https://caniuse.com/?search="
  # ["X"]="https://x.com/search?q="
)

# Choose the search engine.
engine_name=$(printf "%s\n" "${!engines[@]}" | fuzzel --dmenu --prompt "Search on: ")
[ -z "$engine_name" ] && exit

# Type the query.
query=$(fuzzel --dmenu --width 50 --lines 0 --prompt "$engine_name: ")
[ -z "$query" ] && exit

# Open the browser.
xdg-open "${engines[$engine_name]}$query"
