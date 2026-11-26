# Grades

Grade by what a failure costs, not by how complicated the code is.

| Grade | A failure here | Examples |
|---|---|---|
| `P0` | Loses money or user data, shows one user's data to another, locks users out, or cannot be undone | Payment and purchase verification, authentication, access rules, account or data deletion, migrations |
| `P1` | Stops the user from doing the main job of the product, but nothing is lost and a fix restores it | The core create and read flows, sync, notifications the product promises |
| `P2` | Is an annoyance the user can work around | Settings, cosmetic screens, onboarding copy, admin conveniences |

Rules:

- When unsure between two grades, take the higher one and list it as a question.
- A feature is `P0` if any part of it is. Split the feature if only one path deserves it.
- Infrastructure that every feature depends on (database schema, CI and release workflows, the review configuration itself) is `P0`.
