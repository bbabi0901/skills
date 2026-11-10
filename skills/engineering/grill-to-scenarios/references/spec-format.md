# Spec format

The goal is a short spec. If it runs past two screens, implementation detail has leaked in where decisions should be.

```markdown
# <feature name>

## Problem
<who, doing what, gets stuck where. A real case>

## Solution (user's perspective)
<what changes. Not how it is built>

## Stories
1. As a <role>, I want <thing>, so that <reason>.
<3 to 7, only the ones that actually came up. Do not invent stories for coverage>

## Decisions
- <module boundaries, interfaces, data formats, external dependencies, anything settled>

## Out of scope
- <what is not done>

## Risky assumptions
- <assumption>: how to check it: what changes if it is wrong

## Slices
| # | Slice (a result the user can see) | Blocked by |
|---|---|---|
| 1 | … | none |
| 2 | … | 1 |

## Decision Log
Decisions / Rejected alternatives / Open questions (same shape as ticket-format)
```

Slicing rules:

- Each slice cuts thinly through every layer and can be demoed on its own. Not one layer (server only, screen only).
- Sized so a fresh context can implement and verify it in one go.
- If preparatory cleanup (a refactor) is needed, it is slice 1.
- Show the slice list and have the user confirm size, order, and blocking edges.
- Once approved, make one ticket per slice using ticket-format, and write the spec's location and "Blocked by: #N" on each ticket.
