---
name: release-checklist
description: Check a release against the merge-queue, feature-flag and staged-rollout practices before it ships, and report what passes, what fails and what only a person can answer. Deploys nothing.
disable-model-invocation: true
---

# release-checklist

What is about to ship → a checklist with evidence. This is the release half of the review layer: it does not review code, and it does not deploy, publish, or submit anything.

## 1. Find what is being released

Find the last release (a tag, a build number in the release notes, or ask the user) and list the commits and changed paths since then.

## 2. Run the checks

For each item report `pass`, `fail`, or `unknown`, with the command output or file reference that shows it. `unknown` is a question for the user, not a pass.

1. **Integrated state is green.** The branch contains the remote main branch, and the project's checks pass on that state (`review checks`, or the commands in `CLAUDE.md`).
2. **No review debt.** The pull request has no unresolved review thread, and every thread resolved without a fix has a reason a person would accept.
3. **Risky changes can be switched off.** For each changed path that is `P0` in `.review/criticality.json`: is the new behavior behind a flag that can be turned off without a new release, and does it default to off when the flag cannot be read? If there is no flag, is that a decision the user made?
4. **Someone used it first.** Has this build been used internally (a test build on a real device, a preview deployment) on the changed features? Ask the user; do not infer it.
5. **The rollout is staged.** Is there a plan to reach a small group before everyone (a release channel, a phased store rollout, a preview before production)? Name it.
6. **Undoing it is written down.** For this release, what is the rollback (flag off, previous build, revert and redeploy), how long does it take, and is any step irreversible (a migration, a store submission)?
7. **Someone is watching afterwards.** Who looks at errors after release, where, and for how long? If `.review/alerts.md` exists, are its `S1` rules in place?

## 3. Report and stop

Print the checklist as a table, then the `fail` and `unknown` items as the list of things to settle before shipping. Do not ship, tag, or submit anything yourself, and do not mark an item `pass` on the user's behalf.
