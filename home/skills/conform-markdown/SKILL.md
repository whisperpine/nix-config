---
description: >
  Ensures markdown files conform to rumdl linting rules and personal formatting
  preferences. Use when creating or editing .md files, or when user mentions
  formatting, linting, or rumdl.
name: conform-markdown
---

# Conform Markdown

Ensure markdown files comply with rumdl linting rules and personal preferences.

## Personal Preferences

These override rumdl defaults where they conflict:

- Never use bold (`**text**` or `__text__`).
- Never use em dash `—`, replace it with hyphen `-`.
- AGAIN: NEVER USE EM DASH `—`, replace it with hyphen `-`.
- All list items end with `.`, except standalone terms or bare links.
- For list items spanning multiple lines, indent continuation lines with spaces
  so that these lines start from the same column. For example:

```markdown
- This is the first line of the list item.
  This is the second line of the list item.
- Another list item.

1. This is the first line.
   This is the second line.
   This is the Third line.
2. Another list item.
```

## Workflow

When creating or editing a markdown file:

1. Check whether the file is already excluded in `.rumdl.toml` under `exclude`.
   If so, skip linting entirely.
2. Run `rumdl fmt --config 'MD013.reflow=true' <file>` to auto-format.
3. Run `rumdl check --fix <file>` to auto-fix linting warnings.
4. Run `rumdl check <file>` again to verify no warnings remain.
5. If warnings persist, fix them manually and re-run step 4.
6. If the file is from external sources and should not be linted,
   add a glob to `exclude` in `.rumdl.toml`.

## Configuration

Respect `.rumdl.toml` at the repo root if present.
It may configure enabled/disabled rules, exclusions, and rule-level settings.

## GitHub Issue and PR

GitHub's Markdown renderer diverges from CommonMark on line breaks: consecutive
lines without a blank line between them are rendered as separate lines (unlike
standard Markdown where they are joined). Therefore, do NOT hard-wrap long lines
in issue/PR descriptions or comments. Let each paragraph stay a single long line.

```text
// Standard CommonMark: renders as one joined line
This is the first line.
This is the second line.

// GitHub: renders as two separate lines
This is the first line.
This is the second line.
```
