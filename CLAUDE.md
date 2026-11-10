Skills are organized into bucket folders under `skills/`:

- `engineering/`: code work
- `productivity/`: non-code workflow tools (create the folder with the first skill)
- `in-progress/`: beta: public on purpose, feedback wanted, not shipped in the plugin
- `deprecated/`: no longer used

Every skill in a **promoted** bucket (`engineering/`, `productivity/`) must have an entry in the top-level `README.md`, its bucket `README.md`, and `.claude-plugin/plugin.json`'s `skills` array (the plugin ships exactly the promoted set). Skills in `in-progress/` and `deprecated/` appear in none of those.

Each skill entry links the skill name to its `SKILL.md`. Promoted bucket `README.md`s and the top-level `README.md` group entries into **User-invoked** and **Model-invoked**; non-promoted buckets use a flat list.

Every `SKILL.md` is either user-invoked (`disable-model-invocation: true` plus `policy.allow_implicit_invocation: false` in `agents/openai.yaml`; its `description` is human-facing, no trigger lists) or model-invoked (omit both; its `description` carries rich trigger phrasing). A skill is user-invoked in both harnesses or neither.

Dependencies between skills are explicit Skill tool calls (`Call the Skill tool with "name"`), one skill per call, never `../other-skill/FILE.md` cross-references. Only model-invoked skills can be called this way; a user-invoked precondition is phrased as "tell the user to run `/name`".

Supporting material a skill reads at a specific step lives in `references/` beside its `SKILL.md`, and `SKILL.md` links to it by relative path at the step that needs it. Keep `SKILL.md` to the flow; move formats, tables, and checklists into `references/`.

Run `claude plugin validate .` after touching anything in `.claude-plugin/` (the only accepted warning is the missing icon).

To (re)link skills into the local harness skill directories, run `scripts/link-skills.sh` (add `--all` to include `in-progress/`). Re-run after adding, removing, or renaming a skill.

New skills start from `_template/`. The checklist is in `CONTRIBUTING.md`.

No em-dashes anywhere in this repo's prose. Rewrite the sentence with a comma, colon, period, parentheses, or a conjunction.

Every skill that dispatches a subagent says to start it with a fresh context window.
