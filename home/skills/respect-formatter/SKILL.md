---
description: >
  Auto-formats edited files using the project's formatter. Use after editing
  any source code file when a formatter is available.
name: respect-formatter
---

# Respect Formatter

Always auto-format edited files before returning results to humans.

## Workflow

- After editing a source file, detect the language and formatter.
- Run the formatter on the edited file(s).
- If warnings are emitted alongside formatting:
  - Output any warnings that remain.
- Proceed only when file is formatted or unfixable issues are reported.
