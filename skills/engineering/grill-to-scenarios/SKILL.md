---
name: grill-to-scenarios
description: Grill a request, size it (ticket or spec), and write its acceptance criteria as Given/When/Then scenarios plus a Decision Log, ready for /to-spec or /to-tickets to publish.
disable-model-invocation: true
---

# grill-to-scenarios

Grilling → sizing → acceptance criteria and Decision Log, then hand the conversation to `/to-spec` or `/to-tickets` to publish. It fills the gap between `/grill-me` and `/to-spec`: a sizing call the user makes, acceptance criteria written as Given/When/Then scenarios, and a Decision Log so the next session starts from the record, not the chat.

Write no code and no test code, and publish nothing yourself. This skill ends with two finished sections in the conversation; the publishing skills carry them into the record.

## 1. Facts first

If the input is an issue number, fetch it and read the full body and comments. Read the related code, the project's domain glossary, and ADRs in the area before the first question.

## 2. Grilling

Call the Skill tool with "grilling". Seed the design tree with these branches, in this order:

1. **Problem**: who, doing what, gets stuck where. At least one real case; if none, ask whether to proceed marked "no case".
2. **Success**: what the user sees or does differently once it is solved.
3. **Out of scope**: what this round does not do.
4. **Failure paths**: which of empty result, permission error, network failure, bad input can happen, and what should show then.
5. **Riskiest assumption**: the one thing that changes the plan if wrong, and how to check it.

Keep a running list of decisions, rejected alternatives, and open questions as the rounds settle. An assumption the user accepted without checking is an open question.

## 3. Sizing

Judge against [references/sizing.md](references/sizing.md) and show the recommended size with each criterion's verdict as a table. Then stop and wait for the user to pick the size.

## 4. Acceptance criteria and Decision Log

Following [references/output-format.md](references/output-format.md), write the acceptance criteria as Given/When/Then scenarios, at least one of them a failure path, and list separately the steps only a human can check. Then print the two sections, finished, in the conversation.

## 5. Hand off

Tell the user what to run next, and that the two sections go into the record verbatim, each scenario listed once:

- **Ticket-sized**: `/to-tickets`. One ticket; the scenarios are its acceptance criteria, with Human checks and the Decision Log after them.
- **Spec-sized**: `/to-spec`, then `/to-tickets #<n>`. The acceptance criteria go under Testing Decisions, the Decision Log under Further Notes.

After that, `/tdd`.

## Never

- Code, test code, branches, commits
- Publishing a ticket or spec yourself
- Filling a case-less request with guesses
- Deciding size or scope on the user's behalf
