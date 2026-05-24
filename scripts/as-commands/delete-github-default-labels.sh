#!/usr/bin/env bash

# Purpose: delete all default labels of github issues
# Usage: bash path/to/delete-github-default-labels.sh
# Dependencies: gh
# Date: 2026-05-24
# Author: Yusong

if ! command -v gh >/dev/null 2>&1; then
  echo "Error: Cannot find 'gh' command. Please install it first."
  exit 1
fi

default_labels=(
  "bug"
  "documentation"
  "duplicate"
  "enhancement"
  "good first issue"
  "help wanted"
  "invalid"
  "question"
  "wontfix"
)

# Prints all default labels that will be deleted (if exist).
printf "Labels: "
printf "%s, " "${default_labels[@]}" | sed "s/, $/./"
echo

function ask() {
  printf "%s (y/n): " "$1"
  read -r resp
  [ -z "$resp" ] || [ "$resp" = "y" ]
}

# Requires the user's confirmation.
repo_name=$(gh repo view --json nameWithOwner --jq ".nameWithOwner")
if ! ask "Confirm to delete all default issue labels of this repo ($repo_name)?"; then
  echo "Info: Nothing changed."
  exit 0
fi

# Fetches existing labels.
declare -a existing_labels=()
while read -r label; do
  existing_labels+=("$label")
done < <(gh label list --json name --jq ".[] | .name")

# Removes existing labels which are one of the default labels.
for label in "${default_labels[@]}"; do
  for l in "${existing_labels[@]}"; do
    if [ "$label" = "$l" ]; then
      gh label delete --yes "$label"
      break
    fi
  done
done
