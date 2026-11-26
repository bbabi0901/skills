---
name: alert-setup
description: Turn a confirmed failure-risk document into alert rules per severity (what signal, who is told, how fast) and a list of the steps only a person can do, for a person to confirm and carry out. Stage 3 of error-grading. Use when the user asks only for alert or notification rules by error severity ("에러 등급별 알림 설정", "알림 규칙"). For the whole cycle, use error-grading instead.
---

# alert-setup

Confirmed failure-risk document → `.review/alerts.md`: which signal raises which alert, to whom, how fast. You draft the rules and the to-do list. A person decides the channels and does everything that touches an external service.

Do not create accounts, set secrets, or change settings in any external service. Do not change application code unless the user asks in step 5.

## 1. Check the precondition

Read `.review/failure-risk.md`. If it is missing or its status is not `confirmed`, call the Skill tool with "failure-risk" and continue here only once the user has confirmed that document. If they do not confirm it, stop.

If `.review/alerts.md` already exists, do not start over. With `Status: stale`, redo only the rules for the failure IDs named in the status line and show what changed. With `Status: draft`, resume at step 5. With `Status: confirmed`, ask the user what they want changed.

## 2. Find what the project can already observe

Look for an error tracker SDK, structured logging, platform logs (hosting, database, edge functions, app store crash reports), and uptime or health checks. Report what exists with file references. If there is nothing, say so and ask the user which tool they want to use, with one recommendation and why. Do not assume one.

## 3. Ask how the user wants to be told

Ask, and wait for answers:

- Where should an `S1` reach you (push notification, phone, a chat channel), and at what hours?
- Is a daily digest acceptable for `S2`, and a weekly one for `S3`?
- Who else, if anyone, should receive each severity?

## 4. Draft the rules

For every failure in the document, name the signal that would reveal it: an error event, a log query, a metric crossing a threshold, or a scheduled check that compares two sources (for example purchases the store reports against credits granted). A silent failure has no signal yet: say what has to be emitted and where, citing the line.

Write `.review/alerts.md` with `Status: draft` before you show anything, so the draft survives the session:

- A routing table: severity, channel, response time, recipient.
- A rule per failure ID: signal, threshold, severity, whether the signal exists today.
- **Human steps**: everything only the user can do (create the project in the tracker, add the keys as secrets, connect the notification channel, set the rules in the tracker's UI), as a checklist in order.
- **Code changes needed**: the places where a signal must be added, as a list. Not done.

## 5. Show the draft and stop

Print the routing table, the rules whose signal does not exist yet, and the human steps. Say which exact word confirms the rules. Stop and wait. Apply the user's changes. If they ask you to add the missing signals in code, do that as ordinary code work in this repository, with its tests. Change the status to `confirmed <date>` only after the user has said the rules are confirmed. An instruction to change a rule is not a confirmation.

## 6. Hand off

Tell the user which human steps remain, and that an incident which no rule caught should be added to `.review/failure-risk.md` and to the "Incidents" section of `REVIEW.md`, with the layer that should have caught it.
