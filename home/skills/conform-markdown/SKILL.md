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

- Use `-` for unordered lists.
- Never use bold (`**text**` or `__text__`).
- No trailing newlines at end of file.
- Never use em dash `—`, replace it with hyphen `-`.
- APA-style heading capitalization: Title Case for all major words.
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
