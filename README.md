# Socratic Learning

Skills for Claude that teach by questioning instead of explaining. The goal of
every session is that you can explain the topic **yourself** — tested by a
transfer question at the end, not by a feeling of having understood.

## Skills

| Skill | Use it for | Questions come from |
|---|---|---|
| [`socratic-concept`](skills/socratic-concept/SKILL.md) | Understanding a concept, mechanism or idea ("I want to understand X") | General knowledge |
| [`socratic-source`](skills/socratic-source/SKILL.md) | Working through a specific paper, document, codebase or exam topic ("quiz me on this paper") | The material you provide |
| [`socratic-practice`](skills/socratic-practice/SKILL.md) | Learning by doing: a small exercise you solve yourself, run for real ("give me an exercise") | An exercise card and a check |
| [`socratic-debug`](skills/socratic-debug/SKILL.md) | Practicing bug hunting: observe, hypothesise, test, fix ("give me broken code") | A broken scenario with a real symptom |
| [`socratic-exam`](skills/socratic-exam/SKILL.md) | An exam simulation with no hints, graded honestly afterwards ("mock exam") | The exam's scope and format |
| [`socratic-review`](skills/socratic-review/SKILL.md) | 5 to 15 minutes of repetition on the weak spots that are due ("what is due?") | Your progress files |

The two learning skills, `socratic-concept` and `socratic-source`, share this core:

- **Diagnosis first** — start where your understanding goes vague, not at page one.
- **One question per turn** — prediction, counter-example, purpose, discrimination, boundary.
- **Show, then ask** — questions come with something concrete to work on: code,
  command output, a config diff, data. You predict, read, spot or write, then
  see the real result. For practical topics, exit tests from level 2 up
  include writing code.
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
- **Plain writing** — the tutor's messages, report card and progress file
  follow a light form of Simplified Technical English: short sentences,
  active voice, one name per thing, no filler. A bundled linter checks the
  English report card and progress file.
- **Real output** — where an example can be run safely (a shell, the tool
  installed, local only, in `learning/sandbox/`), the skills run it and show the
  real output. Otherwise they label it as expected output.

`socratic-source` adds a section plan, an extra "point, don't hint" rung, critique
questions, and a running list of weak spots that gets re-asked at the end.

Neither skill is meant for quick lookups, summaries, or debugging under time
pressure — they say so and step aside.

All six skills also share:

- **One scale and one progress file format**, so `socratic-review` and
  `socratic-exam` can pick up what the others leave in `learning/`.
- **Due dates for weak spots** — they come back after 1, 3, 7, 14 and 30 days,
  and drop back to 1 day when they fail again.
- **A learner profile** in `learning/profile.md` — preferences you state once
  ("always with real code", "answer in German") are saved and applied in every
  session.

Each skill is self-contained, so any one of them works on its own.

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
shared/                         source of the files every skill carries
  references/scale.md           the 0–4 scale and how to ask for it
  references/report-card.md     report card format and rating rules
  references/progress-file.md   progress file format and due dates
  references/profile.md         learner profile
  references/running-code.md    when and how to run examples
  references/writing.md         writing style rules and self-check
  scripts/ste-lint.py           style linter (from ste-writing, MIT)
skills/
  socratic-<name>/
    SKILL.md                    core flow, loaded when the skill triggers
    agents/openai.yaml          display name and default prompt for Codex
    references/                 the shared files, plus the skill's own
                                (levels.md, large-topics.md, large-material.md)
    scripts/ste-lint.py         copy of the shared linter
tools/sync_shared.py  copies shared/ into every skill
install.sh           plain-skill install and zip packaging (macOS/Linux)
install.ps1          same for Windows PowerShell
```

Keep `version` in `plugin.json` and `.claude-plugin/plugin.json` in sync.

Each skill is self-contained, so every skill carries its own copy of the files in
`shared/`. Edit them only in `shared/`, then copy them into the skills:

```bash
python3 tools/sync_shared.py
```

`python3 tools/sync_shared.py --check` exits with an error if a copy is missing
or differs. Run it before you commit.

## Adding a skill

Create `skills/<name>/SKILL.md` with `name` and `description` frontmatter. The
description decides when the skill triggers — include both the trigger phrases
and the explicit "Do NOT use when" cases. Add `agents/openai.yaml` for Codex, and
run `tools/sync_shared.py` so the new skill gets the shared files.

## Credits

The writing rules in `shared/references/writing.md` are adapted from
[ste-writing](https://github.com/1fc0nfig/ste-writing) by Ege Çelebi and Matyas
Cerny (MIT). `shared/scripts/ste-lint.py` is copied unchanged from that repository,
with its license notice at the top of the file. ASD-STE100 is a specification of
ASD. This project is not affiliated with ASD.
