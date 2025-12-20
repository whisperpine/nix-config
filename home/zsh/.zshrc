# Purpose: Configures interactive shells, including settings for prompts,
# aliases, keybindings, and plugins.

# When Loaded: Sourced for interactive shells (both login and non-login), but
# not for non-interactive shells or scripts.

# ----- Ctrl+O ----- #
# Ensure the edit-command-line widget is available.
autoload -U edit-command-line
zle -N edit-command-line
# Bind Ctrl+O to the edit the command (which functions like Ctrl+X Ctrl+E).
bindkey '^O' edit-command-line

# ----- Ctrl+P ----- #
# Bind Ctrl+P to the atuin widget.
bindkey '^P' atuin-up-search

# ----- atuin and autosuggestion ----- #
# Make sure it's empty to be later set by atuin.
# shellcheck disable=SC2034
ZSH_AUTOSUGGEST_STRATEGY=()

# ----- Zellij Pane ----- #
_set_zellij_pane_title() {
  # Replace $HOME with ~ in the current directory path.
  local display_path="${PWD/#$HOME/~}"
  # Set terminal title to the directory name.
  echo -n -e "\033]0;${display_path}\007"
}
# `chpwd` is a zsh hook that triggers whenever the working directory changes.
chpwd() {
  _set_zellij_pane_title
}
# Run on shell initialization.
_set_zellij_pane_title
