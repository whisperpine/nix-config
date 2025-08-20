# Environment variable PATH.
export PATH="$PATH:$HOME/bin:$HOME/.local/bin"
export PATH="$PATH:/etc/nixos/scripts/"

# Configurations that only work in interactive mode.
if [[ $- == *i* ]]; then
  # Bind a shortcut `ctrl+o`.
  bind '"\C-o": edit-and-execute-command'
fi

# # shellcheck disable=SC1094
# source /nix/store/g4mn0iswaaf4hsyssx10n489q9whhl28-blesh-0.4.0-devel3/share/blesh/ble.sh
# # shellcheck disable=1091
# source "$(nix eval --raw nixpkgs#blesh)/share/blesh/ble.sh"

# --------------------
# Zellij Integration
# --------------------

# Keep last 2 path components if path is long.
_short_path() {
  local path="$1"
  if [[ "$path" =~ (.+/)?([^/]+/[^/]+)$ ]]; then
    echo "${BASH_REMATCH[2]}"
  else
    echo "$path"
  fi
}

# Function to update Zellij pane title.
_zellij_update_pane_title() {
  if [[ -n "$ZELLIJ_SESSION_NAME" ]]; then
    local dir branch title

    dir="$(_short_path "$PWD")"

    # get git branch if in repo
    if branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null); then
      title="${dir}:${branch}"
    else
      title="$dir"
    fi

    # rename only if changed
    if [[ "$title" != "$_ZELLIJ_LAST_TITLE" ]]; then
      zellij action rename-pane "$title" 2>/dev/null
      _ZELLIJ_LAST_TITLE="$title"
    fi
  fi
}

# Hook into prompt.
PROMPT_COMMAND="_zellij_update_pane_title${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
