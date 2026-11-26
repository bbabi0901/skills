---
name: criticality-map
description: Draft a map of the product's features, the code paths behind each, and how much a failure in each one costs the business (P0 to P2), for a person to confirm. Stage 1 of error-grading. Use when the user asks only for a feature criticality or business importance map ("기능별 중요도 지도", "중요도 등급"), or when another skill needs a confirmed `.review/criticality.json`. For the whole cycle through failure grades and alerts, use error-grading instead.
---

# criticality-map

Product spec and code → a graded feature map in `.review/criticality.json`. You draft it. A person decides the grades. Nothing downstream uses the map until that person has confirmed it.

Write no application code.

## 1. Read what the product is for

If `.review/criticality.json` already exists with `"confirmed": null`, it is a draft from an earlier session: read it, skip to step 4, and show it instead of starting over.

Read the planning documents first (the plan or spec, ADRs, `CLAUDE.md`, `REVIEW.md`), then the code layout: routes and screens, API handlers and server functions, migrations, and anything touching payment, authentication, or deletion. If there is no planning document, say so and ask the user what the product must never get wrong before continuing.

## 2. List the features

A feature is something a user does or relies on ("log a watering", "buy credits", "invite a family member"), not a module. For each one, find the paths that implement it and write them as globs. A path may belong to more than one feature.

## 3. Grade each feature

Apply [references/grades.md](references/grades.md). Give each grade a one-line reason grounded in the spec or the code, with a file reference. When the documents and the code disagree about how much a feature matters, record both and do not pick.

## 4. Save the draft, show it, and stop

Write the draft to `.review/criticality.json` in the format in [references/format.md](references/format.md) with `"confirmed": null` before you show anything. The file is the state: a draft that exists only in the conversation is lost when the session ends.

Then print a table: feature, grade, paths, reason. Under it, list every grade you were unsure about as a question. Say which exact word confirms the map. Then stop and wait. The user changes grades, merges or splits features, and answers the questions. Apply their changes to the file and show the table again until they say it is right.

## 5. Confirm

Set `confirmed` to today's date only after the user has said, in this conversation, that the map is confirmed. An instruction to change a grade is not a confirmation. Never set it on your own judgment, and set it back to `null` whenever you change a grade or a path afterwards.

When you change a map that was already confirmed, the documents built on it are out of date. If `.review/failure-risk.md` or `.review/alerts.md` exists, change its `Status:` line to `stale (criticality map changed <date>: <features that changed>)`.

## 6. Hand off

Tell the user:

- Commit the file. Once it is pushed, review-layer treats every `P0` path as high tier, so the review marks changes there as needing a person to review and merge.
- The next stage is failure-risk, which turns the map into failure scenarios. If error-grading called you, it continues from here; otherwise the user can ask for it.
- Re-run this skill when a feature is added or its importance changes.
