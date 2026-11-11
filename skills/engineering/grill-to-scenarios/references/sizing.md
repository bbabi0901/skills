# Sizing criteria

## Ticket-sized: when all of these hold

| Criterion | Question to check |
|---|---|
| One behaviour | Is there one user-visible change (one bug counts)? |
| 3 ACs or fewer | Do the acceptance criteria fit in three lines? |
| One seam | Is there one boundary to hang the tests on? |
| No new contract | No new module, public interface, API, or data format? |
| Easy to reverse | Is it cheap to change later? |
| One session | Can a fresh context implement and verify it in one go? |

## Spec-sized: when any of these holds

| Signal | Example |
|---|---|
| Two or more independently demoable behaviours | "add a filter to the list" and "export the filtered result" |
| New contract | new API endpoint, response field, storage format, message format |
| Crosses two or more boundaries | client + server + external API |
| Hard-to-reverse decision | storage choice, permission model, external service dependency |
| Assumption to check first | external API limits, whether the data exists, performance |
| Spans sessions | cannot finish today, someone else may pick it up |

## Grey areas

- **Wide refactor** (mechanical like a rename, but with a large blast radius): spec. `/to-tickets` knows how to sequence it.
- **Exactly one ticket criterion fails**: show that criterion to the user and ask whether to shrink the scope into a ticket or go spec.

## Display format

```
Recommended: ticket-sized
| Criterion | Holds | Evidence |
| One behaviour | ✓ | only the monthly trend display changes |
| No new contract | ✓ | internal change to the aggregation function |
| ... |
```
