# Purpose: Configures interactive shells, including settings for prompts,
# aliases, keybindings, and plugins.

# When Loaded: Sourced for interactive shells (both login and non-login), but
# not for non-interactive shells or scripts.

# Environment variable PATH.
export PATH="$PATH:$HOME/bin:$HOME/.local/bin"
export PATH="$PATH:/etc/nixos/scripts/"

# # shellcheck disable=SC1094
# source /nix/store/g4mn0iswaaf4hsyssx10n489q9whhl28-blesh-0.4.0-devel3/share/blesh/ble.sh
# # shellcheck disable=1091
# source "$(nix eval --raw nixpkgs#blesh)/share/blesh/ble.sh"

# ----- Zellij Pane ----- #
# Keep last 2 path components if path is long.
_short_path() {
  local path="$1"
  if [[ "$path" =~ (.+/)?([^/]+/[^/]+)$ ]]; then
    echo "${BASH_REMATCH[2]}"
  else
    echo "$path"
  fi
}
_set_zellij_pane_title() {
  local display_path
  # Replace $HOME with ~ in the current directory path.
  display_path="$(_short_path "${PWD/#$HOME/~}")"
  # Set terminal title to the directory name.
  echo -n -e "\033]0;${display_path}\007"
}
PROMPT_COMMAND="_set_zellij_pane_title${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
