---
description: >
  Validates edited files have no LSP errors or warnings, auto-fixes them if
  possible. Use after editing any source code file when an LSP is available.
name: respect-lsp
---

# Respect LSP

Always verify edited files are free of LSP errors/warnings before returning
results to humans.

## Workflow

- After editing a source file, detect the language and LSP.
- Run LSP diagnostics on the edited file(s).
- If errors or warnings found:
  - Attempt auto-fix.
  - Re-run diagnostics to confirm resolution.
- If errors cannot be auto-fixed:
  - Try to manually fix.
  - Re-run diagnostics to confirm resolution.
- If errors cannot be fixed with the steps above:
  - Report the specific errors and their locations.
  - Explain why they cannot be easily resolved.
- Proceed only when file is clean or unfixable errors are reported.
