#!/usr/bin/env bash

# Define search engines.
declare -A engines
engines=(
  # --- search engine --- #
  ["  Google"]="https://www.google.com/search?q="
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

  # --- documents --- #
  ["  Nerd Fonts"]="https://www.nerdfonts.com/cheat-sheet?q="
  ["󱄅  Home Manager"]="https://home-manager-options.extranix.com/?query="
  ["󱄅  NixOS Packages"]="https://search.nixos.org/packages?query="
  ["󱉟  MDN"]="https://developer.mozilla.org/en-US/search?q="
  ["  Docs.rs"]="https://docs.rs/releases/search?query="
  # ["  tldr"]="https://tldr.inbrowser.app/search?query="
  # ["  Can I use"]="https://caniuse.com/?search="

  # --- package registry --- #
  ["  PyPI"]="https://pypi.org/search/?q="
  ["󰡨  Docker Hub"]="https://hub.docker.com/search?q="
  ["  lib.rs"]="https://lib.rs/search?q="
  ["  crates.io"]="https://crates.io/search?q="
  ["  npm"]="https://www.npmjs.com/search?q="

  # --- code bases --- #
  ["  GitHub"]="https://github.com/search?q="
  # ["  GitLab"]="https://gitlab.com/search?search="
  # ["  Codeberg"]="https://codeberg.org/explore/repos?only_show_relevant=true&sort=moststars&q="
)

# Choose the search engine.
engine_name=$(printf "%s\n" "${!engines[@]}" | fuzzel --dmenu --prompt "Search on: ")
[ -z "$engine_name" ] && exit

# Type the query.
query=$(fuzzel --dmenu --width 50 --lines 0 --prompt "$engine_name: ")
[ -z "$query" ] && exit

# Open the browser.
xdg-open "${engines[$engine_name]}$query"
