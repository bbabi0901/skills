# Test scenario format

## Sentence rules

- **One scenario = one behaviour.** If the Then has two or more "and"s, split it.
- **Given is concrete.** Not "there are reviews" but "reviews exist only in March and May, none in April".
- **When is one action.** One user action or one call.
- **Then is visible from outside.** Screen, return value, stored value, request sent. Never whether an internal function was called.
- The sentence becomes the test name verbatim: `it('Given … When … Then …')`. If the repo has its own naming rule, follow that.

## Failure path checklist

For every acceptance criterion, pick at least one that applies.

- Empty result (0 records)
- Permission or auth failure (401, 403, expired session)
- Network failure, timeout, rate limit (429)
- Bad input, boundary values (max length, 0, negative)
- External response shape changed (missing field, parse failure)
- Concurrent runs, double click

## Picking the scenario seam

The test seam is the single outermost boundary where the behaviour can be observed. Prefer an existing test file or boundary. If two are needed, write one line on why one is not enough.

## Human checks

Anything an automated test cannot see (a real screen, a real external service, a login session) goes in a separate step list. Example: "reopen the same product; the result shows immediately with no loading indicator".

## Example

```
Scenario seam: monthly trend aggregation module

- Given reviews exist only in March and May When the monthly trend is built Then April is included as 0
- Given only the last two months of reviews were collected When the monthly trend is built Then only two months are included and the collection period shows as 2 months
- Given only reviews without dates exist When the monthly trend is built Then "No date information" shows instead of the trend   (failure path)

Human checks:
- Open a product with few reviews and confirm empty months show as 0 in the monthly trend
```
