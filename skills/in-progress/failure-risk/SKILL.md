---
name: failure-risk
description: Turn a confirmed criticality map into a document of how each important feature can fail for a user, whether anyone would notice, and how severe that is (S1 to S3), for a person to confirm. Stage 2 of error-grading. Use when the user asks only for failure scenarios or a failure risk document ("실패 위험도", "사용자 실패 시나리오"), or when another skill needs a confirmed `.review/failure-risk.md`. For the whole cycle, use error-grading instead.
---

# failure-risk

Confirmed criticality map + code → `.review/failure-risk.md`: the ways users can be failed, graded. You draft it. A person confirms the grades.

Write no application code.

## 1. Check the precondition

Read `.review/criticality.json`. If it is missing or `confirmed` is `null`, call the Skill tool with "criticality-map" and continue here only once the user has confirmed the map. If they do not confirm it, stop.

If `.review/failure-risk.md` already exists, do not start over. With `Status: stale`, re-trace only the features named in the status line, keep every existing ID, and show what changed. With `Status: draft`, resume at step 4. With `Status: confirmed`, ask the user what they want changed.

## 2. Trace each P0 and P1 feature

For each feature, follow the code from the user's action to the result and list what can go wrong from the user's side: the action fails, it succeeds partly, it succeeds with wrong data, it never finishes, or it does something the user did not ask for. Skip `P2` features unless the user asks for them.

For every failure, establish from the code, with a file and line:

- **What the user sees**: an error message, a blank or stale screen, nothing at all, or a wrong result that looks right.
- **Who finds out**: is the error shown, logged, sent to an error tracker, or swallowed (an empty catch, a default value, an ignored return)? A failure nobody is told about is silent.
- **How far it reaches**: one action, one user, or every user.
- **Whether it can be undone**: retry fixes it, support can fix it, or the loss is permanent.

If you dispatch subagents to trace features in parallel, start each one with a fresh context window. Give each one a single feature, or a few features that share the same code path (a purchase, the function that verifies it, and the screen that starts it). Ask for file and line evidence and for unverified suspicions to be listed separately.

## 3. Check the evidence and grade

A subagent's report is a claim, not a finding. Before grading, open the cited lines yourself for every failure that would be `S1` and confirm the code does what the row says. Move a row you cannot confirm to "unverified". Say in the draft which rows you checked and which you took from a subagent unchecked.

Merge rows that describe the same failure from two features. Then apply [references/severity.md](references/severity.md). Mark every failure you could not fully trace as "unverified" with what is missing, and do not grade it lower for that.

## 4. Save the draft, show it, and stop

Write the draft to `.review/failure-risk.md` in the format in [references/format.md](references/format.md) with `Status: draft` before you show anything. The file is the state: a draft that exists only in the conversation is lost when the session ends.

Then show the draft. Print every `S1` row. For `S2` and `S3`, print the count and the few that matter most, and point to the file for the rest: a table of dozens of rows is not read. List the unverified ones and every grade you were unsure about as questions. Say which exact word confirms the document. Then stop and wait. The user corrects severities and adds failures they know from experience (support messages, past incidents). Apply the changes to the file and show it again until they say it is right.

## 5. Confirm

Change the status to `Status: confirmed <date>` only after the user has said, in this conversation, that the document is confirmed. An instruction to change a severity is not a confirmation.

When you change a document that was already confirmed and `.review/alerts.md` exists, change that file's `Status:` line to `stale (failure risk changed <date>: <IDs that changed>)`.

## 6. Hand off

Tell the user:

- Silent `S1` and `S2` failures are the ones to fix or instrument first; list them.
- The next stage is alert-setup, which decides who gets told about each severity and how. If error-grading called you, it continues from here; otherwise the user can ask for it.
- Re-run this skill after the criticality map changes or after an incident reveals a failure that is not in the document.
