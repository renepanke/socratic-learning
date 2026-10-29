# Large material

Material is too large for one session when the plan would need more than about
eight units, or the time the user has will not cover it at the chosen level. Then
the plan spans several sessions.

1. **Look for a progress file** (see **Progress file** below). If there is one, show
   where things stand and go to step 5.
2. **Map the whole, read the part.** Build the plan from the structure — table of
   contents, chapter introductions and summaries, module layout for code. Units
   are now chapters or modules, still in dependency order. "Read all of it" then
   applies per session: read the units of **this** session completely before
   questioning them.
3. **Current knowledge.** In the same message as the plan: ask where they stand
   per unit, as described in `references/levels.md` (Asking where they stand) —
   the scale, then the plan itself as the table, with a "Depends on" column
   added.
4. **Check.** For each unit claimed at 2 or higher, ask one check question at
   that level, anchored in the material, one per turn. A failed check sets the
   unit one level lower. No ladder and no teaching here: this is placement.
5. **Target.** Ask for the target per unit as described in
   `references/levels.md` (Asking for the target), and suggest two or three
   units for this session, along the dependencies. Then run the per-section flow
   on those units only; the preparation's knowledge and check steps are already
   covered by placement.
6. **End of session.** Report card for this session's units, then update the
   progress file.

Never question a unit from memory of an earlier session — read it again.

## Progress file

Large material spans several sessions. The progress file carries the state
between them, in the user's language.

**Where.** With file access (Claude Code, Codex): `learning/<material>.md` in the
current working directory, with the material as a short kebab-case name. Read it
at the start, update it at the end, and tell the user the path once when you
create it. Without file access (Claude.ai): output the same content as a block at
the end of the session and ask the user to paste it in next time.

```
# Progress: <material>
Material: <path, URL or title, so it can be loaded again>
Updated: <date>

| Unit | Depends on | Target | Reached | How solid | Last session |
|---|---|---|---|---|---|
| <unit> | <units> | 3 | 2 | with help | <date> |
| <unit> | <units> | 2 | 2 | placement | none |
| <unit> | <units> | 2 | none | not tested | none |

## Still shaky
- <unit>: <spot>. Reread: <passage>. Test: <question that would test it>

## Open flagged items
- <item from the flagged list that was still open at the end of a session>

## Next
<the units and level suggested for the next session, and why>
```

Rules:

- **Placement** results are entered with How solid *placement*. They count until
  a real session confirms or corrects them.
- **Update only from what was shown**, by the rating rules in
  `references/report-card.md`. Never raise a level from placement or from the
  user's say-so alone.
- **On resume**, open with one check question on the most recent shaky spot or
  open flagged item, before anything new. Delayed repetition is the point.
- **Write it in the flavored mode** of `references/writing.md`, and lint it
  like the report card.
- **The file is the user's.** If they edited it, take their edits as the current
  state.
