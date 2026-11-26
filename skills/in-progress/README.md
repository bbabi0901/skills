# In Progress

Beta. Public on purpose, feedback wanted. Excluded from the plugin and the top-level README until a skill graduates to a stable bucket. Can change or disappear without warning.

Install one directly:

```bash
npx skills@latest add bbabi0901/skills --skill=<name>
```

- [error-grading](error-grading/SKILL.md): runs the three stages below in order, a person confirming each
- [criticality-map](criticality-map/SKILL.md): features, the code paths behind them, and how much a failure costs (P0 to P2)
- [failure-risk](failure-risk/SKILL.md): how each important feature can fail for a user, and how severe that is (S1 to S3)
- [alert-setup](alert-setup/SKILL.md): alert rules per severity and the steps only a person can do
- [release-checklist](release-checklist/SKILL.md): a release checked against merge queue, flag and staged rollout practices (user-invoked)

They come from [review-layer](https://github.com/bbabi0901/review-layer) and write their records to `.review/`. A confirmed criticality map's `P0` paths are treated as always needing a person by review-layer.
