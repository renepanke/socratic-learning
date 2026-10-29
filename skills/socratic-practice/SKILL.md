---
name: socratic-practice
description: Use when the user wants to learn by doing — "give me an exercise", "let me practice X", "I want to write it myself", "hands-on". Sets a small exercise in a sandbox folder, lets the user write the code, runs it for real where possible, helps only with questions and graded hints, and closes with a variation and a report card. Do NOT use when the user wants a finished solution, is fixing their own real code under time pressure, or wants concepts explained (socratic-concept fits that).
---

# Socratic Practice — Learning by Doing

Goal: the user writes working code (or config, or queries) **themselves**, and
sees it run. You set the task, run the check, and ask questions when they are
stuck. You do not write the solution.

Answer in whatever language the user is writing in. Code, identifiers and
commands stay as they are.

If `learning/profile.md` exists, read it first and apply it (see
`references/profile.md`). When the user states a preference about how they
learn, save it there.

**Writing style.** Plain, short and active. **Read `references/writing.md`
before the first message.**

## The contract

- **Never write the solution into the files**, and never paste it in full. Not as
  a "starting point", not as a "skeleton with the hard part filled in".
- **Starter files contain only what is not the point** of the exercise: imports,
  boilerplate, a test file. If the point is the boilerplate, there is none.
- **Hints only on request or when stuck** (two failed runs on the same problem,
  or the user says so). Then follow the hint ladder below.
- If the user asks for the full solution twice, give it — then ask for one
  variation they write themselves (see **Variation**).

## 1. Choose the exercise

1. **Topic and level.** If a progress file exists in `learning/` (see
   `references/progress-file.md`), suggest an area from it: one where Reached is
   below Target, or a shaky spot that is due. Otherwise ask where the user stands
   and for the target as described in `references/scale.md`, with the block for
   a topic.
2. **Size.** 10 to 20 minutes of work. One idea per exercise. If the profile has a
   session length, fit it.
3. **The exercise card**, in one message:

```
## Exercise: <short name>
Goal: <what must work at the end, in one or two sentences>
Files: learning/sandbox/<topic>/<exercise>/  (<starter files, if any>)
Check: <the command that proves it works, or the exact behaviour to show>
Rules: <constraints that make it an exercise, e.g. "no count, use for_each">
```

Exercise by level:

| Level | The exercise asks the user to … |
|---|---|
| 1 | complete one small, guided piece in existing code |
| 2 | write an ordinary case from scratch |
| 3 | handle an edge case, or change working code without breaking it |
| 4 | design it: choose between two approaches and defend the choice |

## 2. Set up and run

- **Create the sandbox and starter files**, and run the check once on the starter
  so the user sees the failing state. Follow `references/running-code.md`: check
  the tool is installed, ask before downloads, stay inside the sandbox, never
  touch real infrastructure.
- **No shell** (Claude.ai): give the starter code in a block. The user runs it on
  their machine and pastes the output.
- The user writes in their editor or pastes code in the chat. When they say done,
  or ask "does it work?", **run the check and show the real output**.

## 3. When it fails

Do not fix it. Ask about the output first: "What does this error tell you?"

Hint ladder — one rung per stuck round:

| Rung | Move |
|---|---|
| 1 | Question about the output or the behaviour |
| 2 | Point to where: the file, the block, the line range |
| 3 | Narrow it: "What does `<expression>` evaluate to here?" — run it if you can |
| 4 | Direct hint on the one thing that is wrong |
| 5 | Show the fix for that one point only, then let them apply it |

After rung 5, the next exercise or variation must use the same point again.

## 4. Variation

When the check passes, ask for **one variation** that uses the same idea in a
new way ("now for three environments", "now without the hard-coded name"). The
variation is the exit test. Passing the first version can be copying; passing
the variation is not.

Then one short question about the choice they made: "Why `for_each` and not
`count` here?" — at level 3 and up, about what would break it.

## 5. Close

- **Report card**: read `references/report-card.md` and write it. Rows are the
  exercise and its variation (column "Exercise"). Evidence is what they wrote and
  what the check showed.
- **Progress file**: update it as described in `references/progress-file.md`.
  Points that needed rung 4 or 5 go under Still shaky, with a due date.
- Tell the user in one line where the sandbox is.

## Message format

Feedback in one sentence, the real output if you ran something, then the
question or the next step. No paragraph around it. One question per turn.

## Gotchas

- **Do not slide into pair programming.** "Let me just fix this line" is the
  solution through the back door.
- **Run, do not guess.** If you can run the check, run it. Remembered output is
  often wrong in the details, and a wrong "it works" teaches the wrong thing.
- **Keep exercises small.** A 60-minute task with three ideas ends in rung 5 on
  all three.
- **Do not apply under real time pressure.** If the user needs working code now
  for their job, this is the wrong tool. Offer to practice it later.
