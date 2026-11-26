# Severity

| Severity | Meaning | Rule of thumb |
|---|---|---|
| `S1` | Someone must know now | A `P0` feature fails in a way that is permanent, reaches many users, or exposes or loses data or money. A `P1` feature fails silently for many users |
| `S2` | Someone must know today | A `P0` feature fails visibly and a retry fixes it. A `P1` feature fails for many users, or fails silently |
| `S3` | Review in a weekly summary | A `P1` feature fails visibly for one user and a retry fixes it. Everything else that was listed |

Rules:

- Silent raises the severity by one step, because nobody will report it for you. It does not make a failure `S1` on its own: a silent `P0` failure that costs no data or money, exposes nothing, reaches one user and heals on retry or restart is `S2`.
- Permanent loss is never below `S2`.
- When unsure between two severities, take the higher one and say why.
