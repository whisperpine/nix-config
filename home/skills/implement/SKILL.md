---
description: Implement a piece of work based on a PRD or set of issues.
disable-model-invocation: true
name: implement
---

# Implement

Implement the work described by the user in the PRD or issues.

Use /tdd where possible, at pre-agreed seams.

Run typechecking regularly, single test files regularly,
and the full test suite once at the end.

Make implementations on a new branch and create a dedicated pull request if
there isn't one, otherwise commit your work to the current branch which should
be a feature branch already.

Do not add labels to the pull request, since labels are added to issues already.
No need to duplicate. Just make issue labels the single source of truth.
The same is true for milestones - do not set the milestone for pull requests.

When writing or editing the PR's description do not duplicate those already
existing in the issue. Do not include changes in detail (a short summary is OK),
since the code diff reveals all details and is the single source of truth. Keep
PR's description concise. Treat it as part of the commit message. Assume that
the PR will be squash merged with PR title and description as the commit message.

Once done, use /review to review the work.
