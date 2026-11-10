# Contributing

This is a personal skills repo. Issues and PRs are welcome, but the bar is: does the skill leave something behind that survives the conversation (a record, a file, a decision)? If it only shapes the current chat, it probably belongs somewhere else.

## Adding a new skill

1. **Pick the bucket.** `in-progress/` until it has been run end to end on a real repo at least once; then `engineering/` or `productivity/`.
2. **Copy the template.** `cp -r _template skills/<bucket>/<skill-name>`. The folder name is the skill name: lowercase, hyphens, and it should say where the skill starts and where it ends (`grill-to-scenarios`, not `planning-helper`).
3. **Fill `SKILL.md`.**
   - `name` equals the folder name.
   - Decide invocation. User-invoked: add `disable-model-invocation: true` and write a one-line human-facing `description`. Model-invoked: omit the flag and write a `description` with trigger phrasing ("Use when the user wants..., mentions..., asks for...").
   - Keep `SKILL.md` to the flow: numbered steps, what to read, what to ask, what to produce, what never to do.
   - Anything the agent needs only at one step (a format, a criteria table, a checklist, an example) goes in `references/<topic>.md`, linked from that step.
4. **Fill `agents/openai.yaml`.** `display_name` and `short_description`; keep the `policy` block only for user-invoked skills.
5. **Run it once for real.** On an actual repo, with a small input, from the first step to the last. Check that it never asked something it could have read, and that the thing it left behind is usable by someone who was not in the conversation.
6. **Register it** (promoted buckets only):
   - the bucket `README.md`, under User-invoked or Model-invoked
   - the top-level `README.md`, same grouping
   - `.claude-plugin/plugin.json` `skills` array
   - then `claude plugin validate .`
7. **Link it locally.** `scripts/link-skills.sh`.

## Promoting from `in-progress/`

`git mv skills/in-progress/<name> skills/<bucket>/<name>`, then do step 6 and 7. Remove its line from `skills/in-progress/README.md`.

## Writing rules

- English in `SKILL.md` and `references/`.
- No em-dashes. No file paths or code snippets in the records a skill produces; they go stale.
- One question at a time when a skill interviews the user, each with a recommended answer.
