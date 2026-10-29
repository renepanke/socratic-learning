<!-- Shared file. Edit shared/references/progress-file.md and run tools/sync_shared.py. -->
# Progress file

A progress file carries the state of one topic or one piece of material between
sessions and between skills. Every socratic skill reads and writes the same
format, so `socratic-review` can pick up what the others leave behind.

## Where

- **With file access** (Claude Code, Codex): `learning/<name>.md` in the current
  working directory, with the topic or material as a short kebab-case name. Read
  it at the start, update it at the end, and tell the user the path once when you
  create it.
- **Without file access** (Claude.ai): output the same content as a block at the
  end of the session and ask the user to paste it in next time.

Write it in the user's language.

## Format

```
# Progress: <topic or material>
Material: <path, URL or title, so it can be loaded again (only for material)>
Updated: <date>

| Area | Depends on | Target | Reached | How solid | Last session |
|---|---|---|---|---|---|
| <area> | <areas> | 3 | 2 | with help | <date> |
| <area> | <areas> | 1 | 1 | placement | none |
| <area> | <areas> | 2 | none | not tested | none |

## Still shaky

| Area | Spot | Test question | Due | Interval |
|---|---|---|---|---|
| <area> | <spot> | <question that would test it> | <date> | 1 |

## Open flagged items
- <item still open at the end of a session (only for material)>

## Next
<the area and level suggested for the next session, and why>
```

Name the first column of the first table after what the rows are: Area, Section
or Unit. Leave out the lines and blocks marked "only for material" for a topic.
All dates are absolute (`2026-10-29`), never "tomorrow".

## Due dates for shaky spots

Shaky spots are re-asked on a growing interval, in days: **1, 3, 7, 14, 30**.

- **New spot**: interval 1, due the day after the session.
- **Re-asked and passed independently**: move to the next interval and set the
  new due date. Passed at interval 30: remove the spot. It is solid now.
- **Re-asked and failed, or passed only with help**: back to interval 1.
- **Due, but not asked this session**: leave it. It stays due.

## Rules

- **Placement** results are entered with How solid *placement*. They count until
  a real session confirms or corrects them.
- **Update only from what was shown**, by the rating rules in
  `references/report-card.md`. Never raise a level from placement or from the
  user's say-so alone.
- **On resume**, open with one check question on the most overdue shaky spot,
  before anything new.
- **Write it in the flavored mode** of `references/writing.md`, and lint it like
  the report card.
- **The file is the user's.** If they edited it, take their edits as the current
  state.
