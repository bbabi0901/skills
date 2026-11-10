---
name: grill-to-scenarios
description: Grill an idea, request, bug, or issue into a ticket or story-based spec with Given/When/Then test scenarios, and leave the decisions on record.
disable-model-invocation: true
---

# grill-to-scenarios

Grilling → sizing → record → test scenarios, in one conversation. When it ends, one record remains that an implementer can start writing tests from without asking a question.

Decisions live in the record, not in the conversation. The **Decision Log** at the end of every record is the context that survives after the conversation is gone.

Write no code and no test code. This skill ends at scenario sentences; red → green belongs to the implementation step (`/tdd` or the repo's own procedure).

## 0. Find the repo's conventions

The repo decides where the record goes and what shape it takes. Read the following; any convention you find overrides this skill's defaults.

- `AGENTS.md`, `CLAUDE.md`: working procedures, document map
- `docs/agents/*.md`: issue tracker and domain doc locations set by a setup skill (for example `/setup-matt-pocock-skills`)
- `.github/ISSUE_TEMPLATE/`: issue fields
- Spec folders (`docs/spec/`, `docs/specs/`, ...), ADR folders (`docs/adr/`, `docs/decisions/`, ...), glossaries (`GLOSSARY.md`, `CONTEXT.md`), requirements docs

Report what you found in three lines: where tickets go, where specs go, what the test naming rule is. If there is no convention, use the defaults: GitHub issues when the repo is on GitHub, otherwise `docs/stories/<slug>.md`.

## 1. Facts first

If the input is an issue number, read the body and every comment. Read the related code, requirements docs, ADRs, and any gotcha notes, then summarize in five lines or fewer. **Never ask what you can learn by reading.**

## 2. Grilling

Rules:

- One question at a time. Never bundle several.
- Every question carries a recommended answer and a one-line reason.
- Find facts yourself; ask the user only for decisions.
- Follow the order of decisions. An earlier decision changes the later question.
- When the user's words disagree with the code or docs, point it out on the spot.
- Create or edit no files before agreement.

Walk the branches in this order:

1. **Problem**: who, doing what, gets stuck where. At least one real case. If there is none, ask whether to proceed marked "no case".
2. **Success**: what the user sees or does differently once it is solved.
3. **Out of scope**: what this round does not do.
4. **Failure paths**: which of empty result, permission error, network failure, bad input can happen, and what should show then.
5. **Riskiest assumption**: the one thing that changes the plan if wrong, and how to check it.

When no decision is left to ask, show the decision list (numbered, one line each) and the open questions. Do not move to step 3 until the user confirms.

## 3. Sizing

Judge against the table in [references/sizing.md](references/sizing.md) and show the recommended size with each criterion's verdict as a table. **The user decides the size.**

- Ticket-sized → 4-A
- Spec-sized → 4-B
- An assumption still needs checking first → propose one spike ticket before anything else (its deliverable is a decision, not a feature).

## 4. Record

- **4-A Ticket**: [references/ticket-format.md](references/ticket-format.md)
- **4-B Spec**: [references/spec-format.md](references/spec-format.md). Write the problem as stories, cut vertical slices, and make one ticket per slice.

Conventions found in step 0 (template fields, location, numbering) win over the format files. Show the draft, get approval, then publish. Propose an ADR only for a decision that is hard to reverse, surprising without context, and had a real alternative.

## 5. Test scenarios

Following [references/scenario-format.md](references/scenario-format.md), write Given/When/Then for every acceptance criterion and attach them to the record. For a spec, attach them to each slice ticket.

- At least one failure path.
- The scenario sentence becomes the test name verbatim.
- Pick one scenario seam (the outermost boundary the test can sit at).
- Steps a human must check on a real screen or environment go in a separate list.

## 6. Finish

Print the record's location (issue number or file path) and the next step in one line. Example: `Next: /tdd #42`, or the repo's implementation procedure.

## Never

- Code, test code, branches, commits
- Filling a case-less request with guesses
- Deciding on the user's behalf
