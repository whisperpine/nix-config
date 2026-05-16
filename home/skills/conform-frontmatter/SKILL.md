---
description: >
  Ensures markdown frontmatter conforms with personal preferences.
  Use when creating or editing .md files in which frontmatter exists.
name: conform-frontmatter
---

# Conform Frontmatter

- Try to recognize the markdown file. If it's a well-known type (e.g.
  `SKILL.md`, agents or commands definition for coding agents), validate the
  frontmatter attributes.
- For lines in the frontmatter exceeding 80 characters, use the `>` yaml syntax
  to keep lines under 80. For example:

```markdown
---
description: >
  Ensure markdown files conform to rumdl linting rules and personal formatting
  preferences. Use when creating or editing .md files, or when user mentions
  formatting, linting, or rumdl.
---
```
