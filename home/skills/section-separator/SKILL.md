---
description: >
  Formats section separator comments in source files. Use when writing or
  editing comments that may function as section separators.
name: section-separator
---

# Section Separator

Ensure section separator comments follow a consistent three-line format with
dashes aligned to the label length.

## Format

Each section separator consists of three commented lines:

- A top line of dashes.
- A middle line with the label.
- A bottom line of dashes.

The dashes must be vertically aligned, in other words, the top and bottom lines
have the same number of dashes as the length of the label in the middle line.

### Examples

```rust
// --------------------- //
// test_xxx - happy path
// --------------------- //
```

```toml
# ---------------- #
# dev-dependencies
# ---------------- #
```

```python
# ---------------- #
# helper functions
# ---------------- #
```

```c
// --------- //
// main loop
// --------- //
```

## Workflow

When writing or encountering a section separator comment:

1. Check the label (middle line) and count its characters.
2. Write top and bottom lines with the same number of dashes, wrapped in the
   file's comment syntax.
3. The top and bottom lines must match each other exactly in length.
