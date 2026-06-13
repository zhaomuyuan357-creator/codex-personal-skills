---
name: session-closeout
description: Standardizes end-of-session project wrap-up for coding and knowledge-work threads. Use when the user is ending a work session, preparing handoff, asking to update project memory, deciding whether to commit/push, or asking for a resume prompt for the next conversation.
---

# Session Closeout

## Purpose

Use this skill at the end of a work session to leave the project in a clean, resumable state without over-updating documents or pushing code blindly.

## Core Rules

- Do not assume code should always be committed or pushed.
- Update short-term memory first; update long-term guidance only when it truly changed.
- Prefer concise, high-signal handoff notes over verbose journals.
- Preserve the user's existing project conventions for handoff files and progress logs.

## Closeout Workflow

1. Inspect the current workspace state.
   Check git status, changed files, and the project's existing memory or handoff documents.

2. Decide whether code is ready for commit.
   Commit only if the work is intentional, coherent, and the user asked for it or clearly expects it.

3. Decide whether push is appropriate.
   Push only if a remote workflow exists, the branch is suitable, and there is no obvious reason to hold changes locally.

4. Summarize the session.
   Capture:
   - what was completed
   - what is still in progress
   - current blockers or risks
   - the most important next step

5. Update project memory.
   Prefer the project's short-term operational memory first, such as:
   - progress logs
   - handoff notes
   - task trackers
   - checkpoint docs

6. Update long-term instructions only if needed.
   Update files like `AGENTS.md`, contributor guides, or workflow instructions only when one of these changed:
   - resume procedure
   - current phase/stage judgment
   - stable working rules
   - important repo-specific cautions

7. Generate a resume prompt for the next chat.
   The prompt should let a new conversation pick up quickly with:
   - what to read first
   - the current baseline
   - the active task
   - the main caution points
   - the next step

8. Report the closeout result to the user.
   Explicitly state:
   - whether code was committed
   - whether code was pushed
   - which memory files were updated
   - whether long-term instructions were updated
   - the resume prompt

## Decision Guide

### Commit

Commit when:

- the work forms a meaningful checkpoint
- the changes are understandable as one unit
- the user asked for a repo checkpoint or is ending the session

Do not commit when:

- the work is half-broken or exploratory with no clear checkpoint
- unrelated changes are mixed together and not yet separated

### Push

Push when:

- the user asked for push
- the branch is intended to sync upstream now
- the repo state appears safe to share

Do not push when:

- there is no configured remote
- the branch is clearly local-only or experimental
- the user asked only for a local checkpoint

### Memory Updates

Always prefer:

- current progress
- current blockers
- exact next step

Avoid:

- rewriting the whole project history
- duplicating the same notes across many files without a reason

## Output Template

Use this structure in the final response:

```text
Closeout summary:
- Commit: [done / not done]
- Push: [done / not done]
- Updated memory: [files]
- Updated long-term instructions: [files or none]

Current status:
- Completed:
- In progress:
- Blockers or risks:
- Next priority:

Resume prompt for next chat:
[paste-ready prompt]
```

## Trigger Examples

- "Do a session closeout."
- "Wrap up this project for today."
- "Update handoff and give me a resume prompt."
- "Check whether this should be committed and pushed, then sync project memory."
