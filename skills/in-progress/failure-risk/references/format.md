# `.review/failure-risk.md`

```markdown
# Failure risk

Status: draft
Source: .review/criticality.json (confirmed 2026-11-17)

| ID | Feature | Failure | User sees | Who finds out | Reach | Undo | Severity |
|---|---|---|---|---|---|---|---|
| R1 | Buy diagnosis credits (P0) | Purchase verified by the store but the credit is not granted | Paid, no credits | Nobody: the purchase check swallows the error (silent) | One user | Support can grant | S1 |

## Unverified

- R4: could not find where push delivery errors are handled.

## Notes

- R1: the purchase verification function catches the store error and still answers success.
```

- One row per failure. `ID` is stable: keep it when the row is edited, so alert rules can refer to it.
- `Who finds out` names the mechanism (toast, log line, error tracker event) or says "Nobody" and names the function that swallows it. No file paths or line numbers: they go stale.
- `Status` becomes `confirmed <date>` only on the user's word.
