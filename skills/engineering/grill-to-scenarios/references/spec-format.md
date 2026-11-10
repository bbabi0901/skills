# Spec format

Short. Past two screens, implementation detail has leaked in where decisions should be.

```markdown
# <feature name>

## Problem
<who, doing what, gets stuck where. A real case>

## Solution
<what changes, from the user's perspective. Not how it is built>

## User stories
1. As a <role>, I want <thing>, so that <reason>.
<only the ones that actually came up; do not invent stories for coverage>

## Decisions
- <module boundaries, interfaces, data formats, external dependencies>

## Risky assumptions
- <assumption>: how to check it: what changes if it is wrong

## Out of scope
- <what is not done>

## Test scenarios
Scenario seam: <module or boundary>
- Given … When … Then …   (one or more per story, at least one failure path)

Human checks: <"none" if there are none>

## Decision Log
Decisions / Rejected alternatives / Open questions (same shape as ticket-format)
```

Slicing into tickets is not part of the spec; it is the next step (`/to-tickets`).
