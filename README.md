# Socratic Learning

Skills for Claude that teach by questioning instead of explaining. The goal of
every session is that you can explain the topic **yourself** — tested by a
transfer question at the end, not by a feeling of having understood.

## Skills

| Skill | Use it for | Questions come from |
|---|---|---|
| [`socratic-concept`](skills/socratic-concept/SKILL.md) | Understanding a concept, mechanism or idea ("I want to understand X") | General knowledge |
| [`socratic-source`](skills/socratic-source/SKILL.md) | Working through a specific paper, document, codebase or exam topic ("quiz me on this paper") | The material you provide |

Both share the same core:

- **Diagnosis first** — start where your understanding goes vague, not at page one.
- **One question per turn** — prediction, counter-example, purpose, discrimination, boundary.
- **Escalation ladder** — two failed attempts drop one rung, down to a short
  explanation, followed immediately by a transfer question.
- **Explicit exit** — your own words plus a new boundary case you handle correctly.

`socratic-source` adds a section plan, an extra "point, don't hint" rung, critique
questions, and a running list of weak spots that gets re-asked at the end.

Neither skill is meant for quick lookups, summaries, or debugging under time
pressure — they say so and step aside.

## Installation

### Claude Code (as a plugin)

```bash
claude plugin marketplace add /path/to/socratic-learning
```

```bash
claude plugin install socratic-learning@socratic-learning
```

Or from GitHub once pushed: `claude plugin marketplace add <owner>/socratic-learning`.

### Claude Code (plain skills)

Copy or symlink the skill folders into `~/.claude/skills/` (personal) or
`.claude/skills/` (per project):

```bash
cp -R skills/* ~/.claude/skills/
```

### Claude.ai

Zip a single skill folder (e.g. `skills/socratic-concept/`) and upload it under
Settings → Capabilities → Skills.

## Repository layout

```
.claude-plugin/
  plugin.json        plugin manifest
  marketplace.json   lets this repo act as its own marketplace
skills/
  socratic-concept/SKILL.md
  socratic-source/SKILL.md
```

## Adding a skill

Create `skills/<name>/SKILL.md` with `name` and `description` frontmatter. The
description decides when the skill triggers — include both the trigger phrases
and the explicit "Do NOT use when" cases.
