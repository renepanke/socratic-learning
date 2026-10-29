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
- **Depth levels** — one scale, 0 New to 4 Mastery, for where you stand and where
  you want to get. You place yourself, a question or two checks it, then you pick
  a target. Each level is defined by what you can do, and that is its exit test.
- **Explicit exit** — your own words, plus whatever the chosen level demands (a
  new case, a boundary case, teaching it back).
- **Report card** — at the end, or whenever you stop: per part or section, the
  level reached, the evidence for it, and whether it was independent or only
  with help. Only what you showed counts.
- **Large topics** — "Java programming" or a whole textbook is a curriculum, not a
  session. It gets split into areas (or chapters), with a short placement, a
  target level per area, and one area per session. Progress is kept in
  `learning/<topic>.md` in your working directory; on Claude.ai, without file
  access, you get the progress block to paste into the next session.

`socratic-source` adds a section plan, an extra "point, don't hint" rung, critique
questions, and a running list of weak spots that gets re-asked at the end.

Neither skill is meant for quick lookups, summaries, or debugging under time
pressure — they say so and step aside.

Each skill is self-contained, so either one works on its own.

## Installation

Works with Claude Code and Codex, as a plugin from a marketplace or as plain
skills. Replace `<source>` with a local path to this repo or, once pushed,
`<owner>/socratic-learning`.

### As a plugin

Claude Code:

```bash
claude plugin marketplace add <source>
```

```bash
claude plugin install socratic-learning@socratic-learning
```

Codex:

```bash
codex plugin marketplace add <source>
```

```bash
codex plugin add socratic-learning@socratic-learning
```

### As plain skills (no plugin, no marketplace)

macOS / Linux (also Git Bash or WSL on Windows):

```bash
./install.sh
```

Windows (PowerShell):

```powershell
powershell -ExecutionPolicy Bypass -File .\install.ps1
```

Both copy the skills into `~/.claude/skills/` (Claude Code) and
`~/.agents/skills/` (Codex). Options:

| macOS / Linux | Windows | Effect |
|---|---|---|
| `./install.sh claude` / `codex` | `.\install.ps1 claude` / `codex` | Only one tool |
| `--project DIR` | `-Project DIR` | Into `DIR/.claude/skills` and `DIR/.agents/skills` instead of your home |
| `--link` | `-Link` | Link instead of copy, so edits in this repo apply immediately (Windows falls back to a junction without Developer Mode) |
| `--uninstall` | `-Uninstall` | Remove them again |

Without a script, copy each `skills/<name>/` folder into one of those
directories yourself.

### Claude.ai

```bash
./install.sh zip
```

On Windows: `.\install.ps1 zip`. Builds one zip per skill in `dist/`. Upload
them under Settings → Capabilities → Skills.

## Repository layout

```
.claude-plugin/
  plugin.json        Claude Code plugin manifest
  marketplace.json   Claude Code marketplace (this repo is its own marketplace)
.agents/plugins/
  marketplace.json   Codex marketplace
plugin.json          Portable plugin manifest, used by Codex
skills/
  socratic-concept/SKILL.md
  socratic-source/SKILL.md
install.sh           plain-skill install and zip packaging (macOS/Linux)
install.ps1          same for Windows PowerShell
```

Keep `version` in `plugin.json` and `.claude-plugin/plugin.json` in sync.

## Adding a skill

Create `skills/<name>/SKILL.md` with `name` and `description` frontmatter. The
description decides when the skill triggers — include both the trigger phrases
and the explicit "Do NOT use when" cases.
