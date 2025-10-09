# Purpose: Sets environment variables and configurations that should be
# available in all zsh sessions, including interactive, non-interactive, login,
# and non-login shells.

# When Loaded: Sourced at the start of every zsh session, regardless of whether
# it's a login shell, interactive shell, or script.

export PATH="$PATH:$HOME/bin:$HOME/.local/bin:/opt/homebrew/bin:$HOME/.bun/bin"
export PATH="$PATH:/etc/nixos/scripts/as-commands/"
