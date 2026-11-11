# Output format

## Scenario rules

- **One scenario = one behaviour.** If the Then has two or more "and"s, split it.
- **Given is concrete.** Not "there are reviews" but "reviews exist only in March and May, none in April".
- **When is one action.** One user action or one call.
- **Then is visible from outside.** Screen, return value, stored value, request sent. Never whether an internal function was called.

## Failure path checklist

Pick at least one that applies.

- Empty result (0 records)
- Permission or auth failure (401, 403, expired session)
- Network failure, timeout, rate limit (429)
- Bad input, boundary values (max length, 0, negative)
- External response shape changed (missing field, parse failure)
- Concurrent runs, double click

## Human checks

Anything an automated test cannot see (a real screen, a real external service, a login session) goes in a separate step list. Example: "reopen the same product; the result shows immediately with no loading indicator".

## The two sections

Print these two, in this order. No file paths and no code snippets in either; they go stale.

```markdown
## Acceptance criteria
- Given reviews exist only in March and May When the monthly trend is built Then April is included as 0
- Given only reviews without dates exist When the monthly trend is built Then "No date information" shows instead of the trend   (failure path)
Human checks:
- Open a product with few reviews and confirm empty months show as 0 in the monthly trend   ("none" if there are none)

## Decision Log
Decisions:
1. <what the grilling settled>
Rejected alternatives:
- <alternative>: <why>
Open questions:
- <unchecked assumptions go here; "none" if there are none>
```
