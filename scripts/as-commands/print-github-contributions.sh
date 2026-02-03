#!/bin/sh

# Purpose: print your github contributions today
# Usage: sh path/to/print-github-contributions.sh
# Dependencies: gh (github cli)
# Date: 2026-01-14
# Author: Yusong

if ! command -v gh >/dev/null 2>&1; then
  echo "Error: Cannot find 'gh' command. Please install it first."
  exit 1
fi

today=$(date +%Y-%m-%d)

contributions=$(gh api graphql -f query="
  query {
    viewer {
      contributionsCollection(from: \"${today}T00:00:00\", to: \"${today}T23:59:59\") {
        contributionCalendar {
          totalContributions
        }
      }
    }
  }" --jq '.data.viewer.contributionsCollection.contributionCalendar.totalContributions')

echo "My GitHub contributions today ($today): $contributions"
