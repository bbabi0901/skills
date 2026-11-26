---
name: error-grading
description: Run the whole error grading cycle for a project, one stage at a time with a person confirming each: feature criticality map, then user failure scenarios with severity, then alert rules per severity. Use when the user asks to grade or classify errors and document them, to map which failures matter most, or to set up error severity levels ("에러별 등급 나눠서 문서화", "에러 등급 체계", "장애 등급", "실패 위험도 정리", "어떤 에러가 중요한지 정리"). Resumes from the first stage that is not confirmed.
---

# error-grading

One request, three stages, a person in the loop at each one. This skill owns the order and the stops. The work of each stage lives in its own skill, which this one calls:

| Stage | Skill | Produces | Confirmed when |
|---|---|---|---|
| 1 | criticality-map | `.review/criticality.json` | `confirmed` holds a date |
| 2 | failure-risk | `.review/failure-risk.md` | `Status: confirmed <date>` |
| 3 | alert-setup | `.review/alerts.md` | `Status: confirmed <date>` |

The files are the state. Nothing about progress lives in the conversation, so a new session picks up where the last one stopped.

Write no application code. Never mark a stage confirmed yourself, and never run two stages without a stop between them.

## 1. Read the state

Read the three files and print one line per stage: `confirmed <date>`, `draft`, `stale (<reason>)`, or `not started`. A stage whose earlier stage is not confirmed counts as not ready, whatever its own file says.

## 2. Pick the stage

Take the first stage that is not confirmed. Tell the user which stage you are starting and why. If all three are confirmed, say so, ask what changed in the product since, and stop unless they name something to revisit.

## 3. Run it

Call the Skill tool with that stage's skill name, one skill per call. The stage skill drafts, shows the draft, and waits for the user. Do not answer its questions on the user's behalf, and do not shorten its stop.

## 4. Stop between stages

When the stage ends, read its file again.

- **Confirmed**: tell the user what this unlocks (after stage 1, `P0` paths become high tier in review-layer once the file is pushed). Then ask whether to go on to the next stage now or stop here. Stopping after any stage is a complete outcome. Go back to step 2 only on a yes.
- **Not confirmed**: stop. Say what is still open and that asking for error grading again resumes from this stage.

## 5. Close

When the user stops or stage 3 is confirmed, print the state lines from step 1 again, the files to commit, and the steps only a person can do that are still open (from `.review/alerts.md`, if it exists).
