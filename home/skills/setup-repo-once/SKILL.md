---
description: >
  Configure this repo for the engineering skills - set up its issue tracker,
  triage label vocabulary, and domain doc layout. Run once before first use of
  the other skills depending on the output of this skill.
disable-model-invocation: true
name: setup-repo-once
---

# Setup Repo Once

Scaffold the per-repo configuration that skills assume:

- Issue tracker - where issues live (GitHub by default).
- Triage labels - the strings used for the canonical triage roles.
- Domain docs - where `CONTEXT.md` and ADRs live,
  and the consumer rules for reading them.

This is a prompt-driven skill, not a deterministic script.
Explore, present what you found, confirm with the user, then write.

The Process is written below.

## 1. Explore

Look at the current repo to understand its starting state.
Read whatever exists; don't assume:

- `git remote -v` and `.git/config` - is this a GitHub repo? Which one?
- `AGENTS.md` and `CLAUDE.md` at the repo root - does either exist?
  Is there already an `## Agent skills` section in either?
- `CONTEXT.md` and `CONTEXT-MAP.md` at the repo root.
- `docs/agents/` - does this skill's prior output already exist?
- `docs/adr/` and any `src/*/docs/adr/` directories.

## 2. Present Findings and Ask

Summarise what's present and what's missing. Then walk the user through the
three decisions *one at a time* - present a section, get the user's answer, then
move to the next. Don't dump all three at once.

Assume the user does not know what these terms mean. Each section starts with a
short explainer (what it is, why these skills need it, what changes if they pick
differently). Then show the choices and the default.

### Section `A` - Issue Tracker

> Explainer: The "issue tracker" is where issues live for this repo. Skills like
> `to-issues`, `triage`, `to-prd` read from and write to it - they need to know
> whether to call `gh issue create`, or follow some other workflow you describe.
> Pick the place you actually track work for this repo.

Default posture: these skills were designed for GitHub. If a `git remote` points
at GitHub, propose that. Otherwise (or if the user prefers), offer:

- GitHub - issues live in the repo's GitHub Issues (uses the `gh` CLI).
- Other (Jira, Linear, etc.) - ask the user to describe the workflow in one
  paragraph; the skill will record it as freeform prose.

### Section `B` - Triage Label Vocabulary

> Explainer: When the `triage` skill processes an incoming issue, it moves it
> through a state machine - needs triage, needs info, ready for an agent to pick
> up, ready for a human, or won't fix. To do that, it needs to apply labels that
> match strings *you've actually configured*. If your repo already uses
> different label names (e.g. `bug:triage` instead of `s-needs-triage`), map
> them here so the skill applies the right ones instead of creating duplicates.

The five canonical roles:

- `s-needs-triage` - maintainer needs to evaluate.
- `s-needs-info` - not fully specified, waiting for more info.
- `s-for-agent` - fully specified (an agent can pick it up with no human context).
- `s-for-human` - needs human implementation.
- `s-wontfix` - will not be actioned.

Default: Each role's string equals its name.
Ask the user if they want to override any.

### Section `C` - Domain Docs

> Explainer: Some skills (`tdd`) read a `CONTEXT.md` file to learn the project's
> domain language, and `docs/adr/` for past architectural decisions. They need
> to know whether the repo has one global context or multiple (e.g. a monorepo
> with separate frontend/backend contexts) so they look in the right place.

Confirm the layout:

- Single-context - one `CONTEXT.md` + `docs/adr/` at the repo root.
  Most repos are this.
- Multi-context - `CONTEXT-MAP.md` at the root pointing to per-context
  `CONTEXT.md` files (typically a monorepo).

## 3. Confirm and Edit

Show the user a draft of:

- The `## Agent skills` block to add to whichever of `CLAUDE.md` / `AGENTS.md`
  is being edited (see step 4 for selection rules).
- The contents of:
  - `docs/agents/issue-tracker.md`
  - `docs/agents/triage-labels.md`
  - `docs/agents/domain.md`

Let them edit before writing.

## 4. Write

Pick the file to edit:

- If `CLAUDE.md` exists, edit it.
- Else if `AGENTS.md` exists, edit it.
- If neither exists, ask the user which one to create - don't pick for them.

Never create `AGENTS.md` when `CLAUDE.md` already exists (or vice versa) -
always edit the one that's already there.

If an `## Agent skills` block already exists in the chosen file, update its
contents in-place rather than appending a duplicate. Don't overwrite user edits
to the surrounding sections.

The block:

```markdown
## Agent skills

### Issue tracker

[one-line summary of where issues are tracked]. See `docs/agents/issue-tracker.md`.

### Triage labels

[one-line summary of the label vocabulary]. See `docs/agents/triage-labels.md`.

### Domain docs

[one-line summary of layout - "single-context" or "multi-context"]. See `docs/agents/domain.md`.
```

Then write the three docs files using the seed templates in this skill folder as
a starting point:

- [issue-tracker-github.md](./issue-tracker-github.md) - GitHub issue tracker.
- [triage-labels.md](./triage-labels.md) - label mapping.
- [domain.md](./domain.md) - domain doc consumer rules + layout.

For "other" issue trackers, write `docs/agents/issue-tracker.md` from scratch
using the user's description.

## 5. Done

Tell the user the setup is complete and which engineering skills will now read
from these files. Mention they can edit `docs/agents/*.md` directly later -
re-running this skill is only necessary if they want to switch issue trackers or
restart from scratch.
