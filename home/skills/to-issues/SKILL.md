---
description: >
  Break a plan, spec, or PRD into independently-grabbable issues on the project
  issue tracker using tracer-bullet vertical slices.
disable-model-invocation: true
name: to-issues
---

# To Issues

Break a plan into independently-grabbable issues using vertical slices (tracer bullets).

The issue tracker and triage label vocabulary should have been provided to you:

- `docs/agents/issue-tracker.md`
- `docs/agents/triage-labels.md`
- `docs/agents/domain.md`

If not, stop here and ask humans to do so.

## Process

### 1. Gather Context

Work from whatever is already in the conversation context. If the user passes an
issue reference (issue number, URL, or path) as an argument, fetch it from the
issue tracker and read its full body and comments.

### 2. Explore the Codebase (Optional)

If you have not already explored the codebase, do so to understand the current
state of the code. Issue titles and descriptions should use the project's domain
glossary vocabulary, and respect ADRs in the area you're touching.

### 3. Draft Vertical Slices

Break the plan into *tracer bullet* issues. Each issue is a thin vertical
slice that cuts through ALL integration layers end-to-end, NOT a horizontal
slice of one layer.

Slices may be 'HITL' or 'AFK'. HITL slices require human interaction, such as an
architectural decision or a design review. AFK slices can be implemented and
merged without human interaction. Prefer AFK over HITL where possible.

<vertical-slice-rules>
- Each slice delivers a narrow but COMPLETE path through every layer
  (schema, API, UI, tests).
- A completed slice is demoable or verifiable on its own.
- Prefer many thin slices over few thick ones.
</vertical-slice-rules>

### 4. Quiz the User

Present the proposed breakdown as a numbered list. For each slice, show:

- Title: short descriptive name.
- Type: HITL / AFK.
- Blocked by: which other slices (if any) must complete first.
- User stories covered: which user stories this addresses
  (if the source material has them).

Ask the user:

- Does the granularity feel right? (too coarse / too fine)
- Are the dependency relationships correct?
- Should any slices be merged or split further?
- Are the correct slices marked as HITL and AFK?

Iterate until the user approves the breakdown.

### 5. Publish the Issues to the Issue Tracker

For each approved slice, publish a new issue to the issue tracker. Use the issue
body template below. These issues are considered ready for AFK agents, so
publish them with the correct triage label unless instructed otherwise.

Issue titles must conform to the `/conform-issue-title` skill.

Publish issues in dependency order (blockers first) so you can reference real
issue identifiers in the "Blocked by" field.

If there're relationships (parent, sub issues, blocking, blocked by), show them
with the `Relationships` feature of github issues if github is the issue tracker.
A PRD should always be the parent of vertical slices.

<issue-template>

## Introduction

One-line introduction.

## What to Build

A concise description of this vertical slice. Describe the end-to-end behavior,
not layer-by-layer implementation.

Avoid specific file paths or code snippets - they go stale fast. Exception: if a
prototype produced a snippet that encodes a decision more precisely than prose
can (state machine, reducer, schema, type shape), inline it here and note
briefly that it came from a prototype. Trim to the decision-rich parts - not a
working demo, just the important bits.

</issue-template>

Do NOT close or modify any parent issue.
