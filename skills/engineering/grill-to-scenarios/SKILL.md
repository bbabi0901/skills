---
name: grill-to-scenarios
description: Grill a request, size it (ticket or spec), and write Given/When/Then scenarios plus a Decision Log, ready for /to-spec or /to-tickets to publish.
disable-model-invocation: true
---

# grill-to-scenarios

Grilling → sizing → scenarios and Decision Log, then hand the conversation to `/to-spec` or `/to-tickets` to publish. It fills the gap between `/grill-me` and `/to-spec`: a sizing call the user makes, a test scenario for every acceptance criterion, and a Decision Log so the next session starts from the record, not the chat.

Write no code and no test code, and publish nothing yourself. This skill ends with two finished sections in the conversation; the publishing skills carry them into the record.

## 1. Facts first

If the input is an issue number, fetch it and read the full body and comments. Read the related code, the project's domain glossary, and ADRs in the area, then summarize in five lines or fewer.

## 2. Grilling

Call the Skill tool with "grilling". Seed the design tree with these branches, in this order:

1. **Problem**: who, doing what, gets stuck where. At least one real case; if none, ask whether to proceed marked "no case".
2. **Success**: what the user sees or does differently once it is solved.
3. **Out of scope**: what this round does not do.
4. **Failure paths**: which of empty result, permission error, network failure, bad input can happen, and what should show then.
5. **Riskiest assumption**: the one thing that changes the plan if wrong, and how to check it.

Keep a running list of decisions, rejected alternatives, and open questions as the rounds settle.

## 3. Sizing

Judge against [references/sizing.md](references/sizing.md) and show the recommended size with each criterion's verdict as a table. The user decides.

## 4. Scenarios and Decision Log

Following [references/scenario-format.md](references/scenario-format.md), write Given/When/Then for every acceptance criterion: at least one failure path, one scenario seam, and a separate list of steps only a human can check.

Then print these two sections, finished, in the conversation:

```markdown
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

No file paths and no code snippets in either; they go stale.

## 5. Hand off

Tell the user what to run next, and that the two sections above go into the record verbatim:

- **Ticket-sized**: `/to-tickets`. One ticket; both sections go in its body under the acceptance criteria.
- **Spec-sized**: `/to-spec`, then `/to-tickets #<n>`. Scenarios go under Testing Decisions, the Decision Log under Further Notes.
- **Assumption to check first**: `/to-tickets` with one spike ticket whose acceptance criterion is the decision itself.

After that, `/tdd`.

## Never

- Code, test code, branches, commits
- Publishing a ticket or spec yourself
- Filling a case-less request with guesses
- Deciding size or scope on the user's behalf
