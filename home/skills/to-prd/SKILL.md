---
description: >
  Turn the current conversation into a PRD and publish it to the project issue
  tracker - no interview, just synthesis of what you've already discussed.
disable-model-invocation: true
name: to-prd
---

# To PRD

This skill takes the current conversation context and codebase understanding and
produces a PRD. Do NOT interview the user - just synthesize what you already know.

The issue tracker and triage label vocabulary should have been provided to you:

- `docs/agents/issue-tracker.md`
- `docs/agents/triage-labels.md`
- `docs/agents/domain.md`

If not, stop here and ask humans to do so.

## Process

1. Explore the repo to understand the current state of the codebase, if you
   haven't already. Use the project's domain glossary vocabulary throughout the
   PRD, and respect any ADRs in the area you're touching.

2. Sketch out the major modules you will need to build or modify to complete the
   implementation. Actively look for opportunities to extract deep modules that
   can be tested in isolation.

A deep module (as opposed to a shallow module) is one which encapsulates a lot
of functionality in a simple, testable interface which rarely changes.

Check with the user that these modules match their expectations. Check with the
user which modules they want tests written for.

3. Write the PRD using the template below, then publish it to the project issue
   tracker. The issue title must start with `[PRD]` followed by a lowercase
   description (acronyms and proper terms keep their casing). Example:
   `[PRD] forex cash balances as positions`.
   Apply the `s-needs-triage` triage label - no need for additional triage.

<prd-template>

## Problem Statement

The problem that the user is facing, from the user's perspective.

## Solution

The solution to the problem, from the user's perspective.

## User Stories

A LONG, numbered list of user stories.
Each user story should be in the format of:

- As an <actor>, I want a <feature>, so that <benefit>.

<user-story-example>
- As a mobile bank customer, I want to see balance on my accounts, so that I
   can make better informed decisions about my spending.
</user-story-example>

This list of user stories should be extremely extensive and cover all aspects of
the feature.

## Implementation Decisions

A list of implementation decisions that were made. This can include:

- The modules that will be built/modified.
- The interfaces of those modules that will be modified.
- Technical clarifications from the developer.
- Architectural decisions.
- Schema changes.
- API contracts.
- Specific interactions.

Do NOT include specific file paths or code snippets.
They may end up being outdated very quickly.

Exception: if a prototype produced a snippet that encodes a decision more
precisely than prose can (state machine, reducer, schema, type shape), inline it
within the relevant decision and note briefly that it came from a prototype.
Trim to the decision-rich parts - not a working demo, just the important bits.

## Testing Decisions

A list of testing decisions that were made. Include:

- A description of what makes a good test
  (only test external behavior, not implementation details).
- Which modules will be tested.
- Prior art for the tests (i.e. similar types of tests in the codebase).

## Out of Scope

A description of the things that are out of scope for this PRD.

## Further Notes

Any further notes about the feature.

</prd-template>
