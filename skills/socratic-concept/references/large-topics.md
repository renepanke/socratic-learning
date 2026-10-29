# Large topics

A topic is too large for one session when it has more than about five parts that
each need their own exit test. "Java at level 3" cannot be tested; "generics at
level 3" can. So do not start questioning — map it first.

1. **Look for a progress file** (see **Progress file** below). If there is one, show
   where things stand and go to step 5.
2. **Topic map.** Split the topic into 5–10 areas, each small enough for one or
   two sessions, in dependency order. The user may cut, merge or add areas — it
   is their map.
3. **Current knowledge.** In the same message as the map: ask where they stand
   per area, as described in `references/levels.md` (Asking where they stand) —
   the scale, then the map itself as the table, with a "Depends on" column
   added.
4. **Check.** For each area claimed at 2 or higher, ask one check question at
   that level, one per turn — people overrate exactly these. A failed check sets
   the area one level lower. No ladder and no teaching here: this is placement,
   not a session. Keep it to a few minutes; with many such areas, check the ones
   the others depend on.
5. **Target.** Ask for the target per area as described in
   `references/levels.md` (Asking for the target). A target of 0 means "skip
   this area". Then suggest which area to start with, along the dependencies —
   first any weak area that blocks a target.
6. **One area per session.** Run the normal flow on **one** area. Keep its steps
   1–3 short: placement already answered most of them, so one sentence on what
   is known and one check question at the edge are enough. That area's parts are
   the rows of its report card.
7. **End of session.** Report card for the area as usual, then update the
   progress file.

One area done properly beats three touched. Do not cover several areas in one
session to get through the map faster.

## Progress file

Large topics span several sessions. The progress file carries the state between
them, in the user's language.

**Where.** With file access (Claude Code, Codex): `learning/<topic>.md` in the
current working directory, with the topic as a short kebab-case name. Read it at
the start, update it at the end, and tell the user the path once when you create
it. Without file access (Claude.ai): output the same content as a block at the
end of the session and ask the user to paste it in next time.

```
# Progress: <topic>
Updated: <date>

| Area | Depends on | Target | Reached | How solid | Last session |
|---|---|---|---|---|---|
| <area> | <areas> | 3 | 2 | with help | <date> |
| <area> | <areas> | 1 | 1 | placement | none |
| <area> | <areas> | 2 | none | not tested | none |

## Still shaky
- <area>: <spot>. Test: <question that would test it>

## Next
<the area and level suggested for the next session, and why>
```

Rules:

- **Placement** results are entered with How solid *placement*. They count until
  a real session confirms or corrects them.
- **Update only from what was shown**, by the rating rules in
  `references/report-card.md`. Never raise a level from placement or from the
  user's say-so alone.
- **On resume**, open with one check question on the most recent shaky spot in
  the file, before anything new. Delayed repetition is the point.
- **Write it in the flavored mode** of `references/writing.md`, and lint it
  like the report card.
- **The file is the user's.** If they edited it, take their edits as the current
  state.
