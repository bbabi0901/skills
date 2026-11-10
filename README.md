# Skills

[![skills.sh](https://skills.sh/b/bbabi0901/skills)](https://skills.sh/bbabi0901/skills)

Agent skills that carry decisions across sessions.

Most skill flows assume the current conversation is shared memory: grill here, write the spec there, and the reasoning in between evaporates when the session ends. These skills end by leaving a record (a ticket, a spec, a Decision Log) that a fresh context can pick up without asking a question.

They follow the conventions of [mattpocock/skills](https://github.com/mattpocock/skills) and sit next to those skills well, but do not depend on them.

## Installation

A plugin updates itself. [skills.sh](https://skills.sh/bbabi0901/skills) copies editable files into your project. Pick one per agent.

<details>
<summary><strong>Claude Code</strong></summary>

```bash
claude plugin marketplace add bbabi0901/skills
claude plugin install bbabi0901-skills@bbabi0901
```

</details>

<details>
<summary><strong>Codex</strong></summary>

```bash
codex plugin marketplace add bbabi0901/skills
codex plugin add bbabi0901-skills@bbabi0901
```

</details>

<details>
<summary><strong>Any other agent, or editable files</strong></summary>

```bash
npx skills@latest add bbabi0901/skills
```

To update, run `npx skills@latest update`.

</details>

<details>
<summary><strong>Manual</strong></summary>

```bash
# everywhere
cp -r skills/engineering/grill-to-scenarios ~/.claude/skills/

# one repo, shared with the team through git
cp -r skills/engineering/grill-to-scenarios <repo>/.claude/skills/
```

</details>

## Usage

```
/grill-to-scenarios empty months are missing from the monthly trend on the review tab, so the axis is skewed
/grill-to-scenarios #42
```

The skill reads the repo's conventions first (`AGENTS.md`, `CLAUDE.md`, `docs/agents/*.md`, issue templates, spec and ADR folders) and follows them. Without conventions it writes to GitHub issues, or to `docs/stories/<slug>.md`. A repo configured with `/setup-matt-pocock-skills` is used as is.

## Reference

Skills split on one axis: who can invoke them. **User-invoked** skills are reachable only when you type them; they orchestrate. **Model-invoked** skills can be reached by you or by the agent when the task fits; they hold reusable discipline.

### Engineering

**User-invoked**

- **[grill-to-scenarios](./skills/engineering/grill-to-scenarios/SKILL.md)**: Grill an idea, request, bug, or issue into a ticket or story-based spec with Given/When/Then test scenarios, and leave the decisions on record.

  ```
  grilling → sizing (ticket / spec) → record (ticket / story-based spec) → test scenarios (Given/When/Then)
  ```

  Ends at scenario sentences. No code, no test code, no branches, no commits: `/tdd` or the repo's own procedure takes over.

### In progress

Beta skills live in [`skills/in-progress/`](./skills/in-progress/README.md). They are not in the plugin.

## Adding a skill

See [CONTRIBUTING.md](./CONTRIBUTING.md). Start from [`_template/`](./_template).

## License

[MIT](./LICENSE)
