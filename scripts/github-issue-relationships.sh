#!/bin/sh

# Purpose: get the relationship of the given github issue
# Usage: sh path/to/github-issue-relationships.sh ISSUE_NUMBER
# Dependencies: gh, jq
# Date: 2026-05-27
# Author: Yusong

# Note: Advanced issue support of `gh` is on the way.
# This script will be no longer useful after these implementations:
# https://github.com/cli/cli/issues/13120
# https://github.com/cli/cli/pull/13057

set -e

if ! command -v gh >/dev/null 2>&1; then
  echo "Error: Cannot find 'gh' command. Please install it first."
  exit 1
fi

if ! command -v jq >/dev/null 2>&1; then
  echo "Error: Cannot find 'jq' command. Please install it first."
  exit 1
fi

issue_number=$1

if [ -z "$issue_number" ]; then
  echo "Error: The first parameter (ISSUE_NUMBER) is empty."
  echo "Usage: sh github-issue-relationships.sh ISSUE_NUMBER"
  exit 1
fi

gh api graphql -F owner='{owner}' -F repo='{repo}' -f query="
  query(\$owner: String!, \$repo: String!) {
    repository(owner: \$owner, name: \$repo) {
      issue(number: $issue_number) {
        title

        parent {
          number
          title
        }

        subIssues(first: 20) {
          nodes {
            number
            title
            state
          }
        }

        blocking(first: 20) {
          nodes {
            number
            title
            state
          }
        }

        blockedBy(first: 20) {
          nodes {
            number
            title
            state
          }
        }

        closedByPullRequestsReferences(first: 10) {
          nodes {
            number
            title
          }
        }
      }
    }
  }
" | jq ".data.repository.issue"
