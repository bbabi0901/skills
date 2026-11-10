# Ticket format

If the repo has an issue template, its fields come first. Append any of the sections below that the template lacks to the end of the body.

```markdown
## Problem
<who, doing what, gets stuck where. One real case in one line>

## Change
<the change from the user's perspective, one or two sentences. The result, not the implementation>

## Acceptance criteria
- [ ] <a sentence that can be judged true or false>
- [ ] <failure path>

## Out of scope
- <what this round does not do>

## Test scenarios
Scenario seam: <module or boundary>
- Given … When … Then …
- Given … When … Then …   (failure path)

Human checks: <"none" if there are none>

## Decision Log
Decisions:
1. <what the grilling settled>
Rejected alternatives:
- <alternative>: <why it was rejected>
Open questions:
- <"none" if there are none>
```

Rules:

- No file paths and no code snippets. They go stale fast. Exception: something a prototype produced that is more precise than prose (a state table, a type shape).
- The title is the outcome from the user's perspective. Not "fix the aggregation function" but "empty months show as 0 in the monthly trend".
