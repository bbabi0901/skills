---
name: grill-to-scenarios
description: Grill a request into a sized record (ticket or spec) with Given/When/Then scenarios and a Decision Log, so the next session starts from the record, not the chat.
disable-model-invocation: true
---

# grill-to-scenarios

Grilling → sizing → record → test scenarios, in one conversation. What remains is one record an implementer can start writing tests from without asking a question, and a **Decision Log** that outlives the conversation.

Write no code and no test code. This skill ends at scenario sentences; red → green is `/tdd`'s job.

The issue tracker and domain doc layout should have been provided to you (`docs/agents/*.md`). If not, tell the user to run `/setup-matt-pocock-skills`.

## 1. Facts first

If the input is an issue number, fetch it and read the full body and comments. Read the related code, the project's domain glossary, and ADRs in the area, then summarize in five lines or fewer. Never ask what you can learn by reading.

## 2. Grilling

Call the Skill tool with "grilling". Seed the design tree with these branches, in this order:

1. **Problem**: who, doing what, gets stuck where. At least one real case; if none, ask whether to proceed marked "no case".
2. **Success**: what the user sees or does differently once it is solved.
3. **Out of scope**: what this round does not do.
4. **Failure paths**: which of empty result, permission error, network failure, bad input can happen, and what should show then.
5. **Riskiest assumption**: the one thing that changes the plan if wrong, and how to check it.

Keep a running list of decisions, rejected alternatives, and open questions as the rounds settle: that list becomes the Decision Log.

## 3. Sizing

Judge against [references/sizing.md](references/sizing.md) and show the recommended size with each criterion's verdict as a table. The user decides.

- Ticket-sized → 4-A
- Spec-sized → 4-B
- An assumption still needs checking → propose one spike ticket first (its deliverable is a decision, not a feature).

## 4. Record

- **4-A Ticket**: write one ticket in the shape of [references/ticket-format.md](references/ticket-format.md).
- **4-B Spec**: write the spec in the shape of [references/spec-format.md](references/spec-format.md). Do not slice it into tickets here; `/to-tickets` owns slicing.

The repo's issue template fields, if any, come first; append the sections the template lacks. Show the draft, get approval, then publish to the configured tracker.

## 5. Test scenarios

Following [references/scenario-format.md](references/scenario-format.md), write Given/When/Then for every acceptance criterion and put them in the record before publishing.

- At least one failure path.
- The scenario sentence is the test name, verbatim.
- One scenario seam: the outermost boundary the test can sit at.
- Steps only a human can check go in a separate list.

## 6. Finish

Print the record's location and the next step in one line:

- Ticket: `Next: /tdd #<n>`
- Spec: `Next: /to-tickets #<n>`

## Never

- Code, test code, branches, commits
- Filling a case-less request with guesses
- Deciding size or scope on the user's behalf
