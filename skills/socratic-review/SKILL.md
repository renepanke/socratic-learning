---
name: socratic-review
description: Use when the user wants a short repetition of what they learned before — "review", "what is due", "quick revision", "repeat my weak spots", "5 minutes of practice". Reads the progress files in learning/, asks the shaky spots that are due, with fresh variations rather than the same question, updates the due dates, and ends with a short summary. Do NOT use for learning something new (socratic-concept or socratic-source fit that) or for a full exam simulation (socratic-exam).
---

# Socratic Review — Spaced Repetition

Goal: in 5 to 15 minutes, re-test the spots that are due, so they stick. No new
material. The spots come from the progress files that the other socratic skills
write.

Answer in whatever language the user is writing in.

If `learning/profile.md` exists, read it first and apply it (see
`references/profile.md`).

**Writing style.** Plain, short and active. **Read `references/writing.md`
before the first message.**

## 1. Collect what is due

1. **Read the progress files** in `learning/` (see
   `references/progress-file.md`). Without file access, ask the user to paste
   their progress block.
2. **Collect the shaky spots** with Due on or before today. Sort them: most
   overdue first, then spots that block a target (an area others depend on).
3. **Size**: about one spot per two minutes. Ask how much time the user has, or
   use the profile's session length. Default: 5 spots.
4. **Show the list** in one message, and start unless the user changes it:

```
Due today: 5 of 8
| # | Topic | Area | Spot | Overdue |
|---|---|---|---|---|
| 1 | terraform | State | when a rename forces a replacement | 2 days |
```

**Nothing due**: say so, show the next due date, and offer to review the nearest
spots early. An early review that passes does not move the interval.

## 2. Ask

For each spot, one question per turn:

- **Use a variation, not the stored question.** Same point, new case. The stored
  question may have been memorised.
- **Make it concrete**: for practical topics, a small code block or output to work
  on. Run it after the attempt if you can (see `references/running-code.md`).
- **Short ladder**: if the answer fails, one narrower question. If that fails
  too, explain the point in two or three sentences with a minimal example, then
  one transfer question.
- **Feedback** in one sentence, then the next spot. No long explanations when it
  passes.

## 3. Update

After each spot, apply the due-date rules in `references/progress-file.md`:

- passed independently: next interval
- passed after the narrower question: same as independent (it is a pointer, not
  help)
- passed only after the explanation, or failed: back to interval 1

Write the changes into the progress files at the end, and tell the user which
files changed.

## 4. Close

A short summary, not a full report card:

```
| # | Spot | Result | Next due |
|---|---|---|---|
| 1 | <spot> | solid | <date> (7 days) |
| 2 | <spot> | again | <date> (1 day) |
```

Plus one line: the area that keeps coming back, if any, and which skill would
fix it at the root (`socratic-concept`, `socratic-practice`).

## Message format

Feedback in one sentence, then the next question. No paragraph around it. One
question per turn.

## Gotchas

- **Do not teach new material.** A spot that fails twice in a row needs a real
  session, not a longer review. Say so and move on.
- **Do not reuse the exact stored question.** Then the review tests memory of the
  question, not the point.
- **Keep it short.** Review works because it is cheap. A 40-minute review is a
  session.
