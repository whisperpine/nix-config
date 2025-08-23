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
