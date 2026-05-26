# Issue Tracker: GitHub

Issues and PRDs for this repo live as GitHub issues.
Use the `gh` CLI for all operations.

## Conventions

Use these commands as a reference or template:

```sh
# Create an issue. Use a heredoc for multi-line bodies.
gh issue create --title "..." --body "..."

# Read an issue, filtering comments by `jq` and also fetching labels.
gh issue view NUMBER --comments

# List issues with appropriate `--label` and `--state` filters..
gh issue list --state open \
  --json number,title,body,labels,comments \
  --jq '[.[] | {number, title, body, labels: [.labels[].name], comments: [.comments[].body]}]'

# Comment on an issue.
gh issue comment NUMBER --body "..."

# Apply labels.
gh issue edit NUMBER --add-label "..."
# Remove labels.
gh issue edit NUMBER --remove-label "..."

# Close an issue.
gh issue close NUMBER --comment "..."
```

Infer the repo from `git remote -v` -
`gh` does this automatically when run inside a clone.

## When a Skill Says "`publish to the issue tracker`"

Create a GitHub issue.

## When a Skill Says "`fetch the relevant ticket`"

Run `gh issue view <number> --comments`.
