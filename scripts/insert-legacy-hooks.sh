#!/bin/sh

# Purpose: Insert legacy git hooks to prek-managed ones
# Usage: sh path/to/prepend-legacy-hooks.sh
# Dependencies: []
# Date: 2026-01-23
# Author: Yusong

# The root directory of this project.
project_root=$(git rev-parse --show-toplevel)

# Insert legacy git hooks to prek-managed ones.
for legacy_hook in "${project_root}"/.git/hooks/*.legacy; do
  # The content of the legacy hook after shebang.
  content=$(awk '$NL > 0 {print $0}' "$legacy_hook")
  # The filepath of the hook managed by prek_hook.
  prek_hook="${legacy_hook%.*}"
  # Create a tempfile to be used by the sed command below.
  tempfile=$(mktemp)
  # Add contents to the tempfile file.
  {
    printf "\n# ---------- copied from ./%s ---------- #\n" "$(basename "$legacy_hook")"
    echo "$content"
    printf "# ---------- copied from ./%s ---------- #\n\n" "$(basename "$legacy_hook")"
  } >"$tempfile"
  # Insert after the 1st line (shebang) of the hook managed by prek.
  sed -i "1r ${tempfile}" "$prek_hook"
  # Remove the tempfile.
  rm "$tempfile"
done
