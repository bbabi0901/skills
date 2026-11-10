# Ticket format

```markdown
## Problem
<who, doing what, gets stuck where. One real case in one line>

## What to build
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
- <alternative>: <why>
Open questions:
- <"none" if there are none>
```

- No file paths and no code snippets; they go stale. Exception: a prototype's output that is more precise than prose (a state table, a type shape).
- The title is the outcome from the user's perspective: not "fix the aggregation function" but "empty months show as 0 in the monthly trend".
