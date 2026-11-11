# Skills

[![skills.sh](https://skills.sh/b/bbabi0901/skills)](https://skills.sh/bbabi0901/skills)

Agent skills that carry decisions across sessions.

Most skill flows assume the current conversation is shared memory: grill here, write the spec there, and the reasoning in between evaporates when the session ends. These skills end by leaving a record (a ticket, a spec, a Decision Log) that a fresh context can pick up without asking a question.

They are built on top of [mattpocock/skills](https://github.com/mattpocock/skills) and need it installed. What they use from it:

| Skill | How |
|---|---|
| `grilling` | called with the Skill tool |
| `to-spec`, `to-tickets` | publish the record; this skill hands the conversation to them |
| `tdd` | the step after that |

Checked against mattpocock/skills v1.3.2. Install that repo first and run `/setup-matt-pocock-skills` in your project.

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

It publishes nothing itself. It ends with the acceptance criteria and Decision Log finished in the conversation and tells you which Matt skill to run to publish them.

## Reference

Skills split on one axis: who can invoke them. **User-invoked** skills are reachable only when you type them; they orchestrate. **Model-invoked** skills can be reached by you or by the agent when the task fits; they hold reusable discipline.

### Engineering

**User-invoked**

- **[grill-to-scenarios](./skills/engineering/grill-to-scenarios/SKILL.md)**: Grill a request, size it (ticket or spec), and write its acceptance criteria as Given/When/Then scenarios plus a Decision Log, ready for `/to-spec` or `/to-tickets` to publish.

  ```
  grilling → sizing (ticket / spec) → acceptance criteria + Decision Log → /to-tickets  or  /to-spec → /to-tickets → /tdd
  ```

  What it adds between `/grill-me` and `/to-spec`: a sizing call the user makes, acceptance criteria written as Given/When/Then scenarios, and a Decision Log (decisions, rejected alternatives, open questions) that goes into the record.

### In progress

Beta skills live in [`skills/in-progress/`](./skills/in-progress/README.md). They are not in the plugin.

## Adding a skill

See [CONTRIBUTING.md](./CONTRIBUTING.md). Start from [`_template/`](./_template).

## License

[MIT](./LICENSE)
