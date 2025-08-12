#!/bin/sh

# Purpose: git commit all changes and push
# Usage: sh path/to/auto-commit-push.sh
# Dependencies: git
# Date: 2024-09-29
# Author: Yusong

set -e

# The root directory of this project.
project_root=$(git rev-parse --show-toplevel)
# The log file path, where auto commit logs should be kept.
log_file=$project_root/commits.log
# Current UTC time (for example "2024-12-02 16:59 UTC+0").
current_utc=$(date -u +"%Y-%m-%d %H:%M UTC+0")
# Current date and time (for example "2024-09-29 22:40:35+08:00").
current_date_time=$(date --rfc-3339=seconds)

cd "$project_root" || exit

# If there isn't any change.
if [ ! "$(git status -s)" ]; then
  {
    echo
    echo "No changes to commit on $current_date_time"
  } >>"$log_file"
  # In case of local commits ahead of remote branch
  if ! git push; then
    echo "error: git push failed" >>"$log_file"
  fi
  exit 0
fi

git add -A
commit_message="docs(auto): commit on $current_utc"
changed_files=$(git status -s)
git commit -m "$commit_message" -m "$changed_files"

{
  echo
  echo "Commit on $current_date_time"
  echo "Changed files:"
  echo "$changed_files"
} >>"$log_file"

if ! git push; then
  echo "error: git push failed" >>"$log_file"
fi
