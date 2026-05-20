---
description: >
  Writes commit messages following the Conventional Commits specification. Use
  when writing a commit message or when user mentions commit message, commit,
  or conventional commits.
name: conventional-commits
---

# Conventional Commits

## Format

```text
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

## Rules

- Consider only what's currently *staged*.
  If there isn't a staged file, stop here with an error to inform humans.

## Workflow

1. Check for cocogitto: If the repository has a `cog.toml` at the root,
   read it to determine allowed commit types and scopes.
2. Pick a type from `cog.toml` (or standard types if no `cog.toml`).
3. Pick a scope (optional): Use a scope from `cog.toml` if one applies.
   If no scope in `cog.toml` is appropriate, omit the scope entirely.
4. Write the description: Imperative mood, lowercase, no period at end.
   Keep under 72 characters if possible.
5. Add body (optional): Explain what and why, not how.
   Wrap at 72 characters.
6. Add footer (optional): Reference issues with `Closes #123`, `Fixes
   #456`, or note breaking changes with `BREAKING CHANGE:`.

## Cocogitto

- Scopes from `cog.toml` are preferred but not required.
  If no scope matches, omit it.
- Types must match exactly what's in `cog.toml` `[commit_types]` (case-sensitive).
- Scopes in `cog.toml` declared in `scopes` are the only valid scopes.
- If `cog.toml` marks a type as disabled (empty `{}`), do not use it.
