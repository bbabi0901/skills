# `.review/criticality.json`

```json
{
  "confirmed": null,
  "features": [
    {
      "name": "Buy diagnosis credits",
      "grade": "P0",
      "paths": ["apps/mobile/src/lib/iap.ts", "supabase/functions/verify-purchase/**"],
      "why": "Money changes hands; a wrong grant or a missed grant is a refund or a complaint (PLAN R-41)"
    }
  ]
}
```

- `confirmed`: `null` while it is a draft, an ISO date (`"2026-11-17"`) once a person has confirmed it. review-layer ignores the map while this is `null`.
- `grade`: `P0`, `P1` or `P2`.
- `paths`: globs relative to the repository root.
- `why`: one line a reviewer can check against the spec or the code.
