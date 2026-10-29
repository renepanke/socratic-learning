---
name: socratic-exam
description: Use when the user wants to be tested under exam conditions — "simulate the exam", "test me like a real exam", "mock exam", "am I ready for the exam". Sets up scope, format and time, asks the questions without hints or feedback, then grades every answer against a rubric and gives an honest readiness verdict and a report card. Do NOT use when the user wants to learn or be guided (socratic-concept or socratic-source fit that), or wants a quick quiz with feedback after each question.
---

# Socratic Exam — Exam Simulation

Goal: show the user honestly how they would do in the real exam, today. This is
the one socratic skill that does **not** help during the session. Help comes
after, in the grading.

Answer in whatever language the user is writing in, unless the real exam is in
another language. Then ask which one they want.

If `learning/profile.md` exists, read it first and apply it (see
`references/profile.md`).

**Writing style.** Plain, short and active. **Read `references/writing.md`
before the first message.**

## The contract

- **No hints, no ladder, no feedback during the exam.** After each answer, only
  "Noted." and the next question.
- **If the user asks for a hint**: "Answer as well as you can, or skip it." No
  exceptions. A hint during the simulation makes the result worthless.
- **Grade only after the last question**, or when time is up.
- **Grade honestly.** For exam prep an over-optimistic result is more damaging
  than a harsh one.

## 1. Set up

Ask in one message, as a list:

```
1. What does the exam cover? (topic, material, chapters, or a progress file)
2. What format? (multiple choice, short answer, essay, oral, practical/code)
3. How long, and how many questions?
4. What counts as passing, if you know it?
```

- **Scope from a progress file**: if one exists in `learning/` for the topic,
  offer it as the scope (see `references/progress-file.md`).
- **Material**: if the exam is on material the user can give you, read it fully
  first, and draw the questions from it.
- **Level**: ask what the exam demands, on the scale in `references/scale.md`.
  Weight the questions to that level, with a few one level above.
- **Time**: with a shell, note the start with `date` and check it before each
  question. Without one, ask the user to keep time and to say "time".

Then show the plan in one line ("12 questions, 45 minutes, mostly level 2") and
start when the user says go.

## 2. Run it

- **Written format**: all questions at once, numbered, with points per question.
  The user answers in one message or several.
- **Oral and short answer**: one question per turn.
- **Practical**: a task card as in a real exam, with a check you run after time is
  up (see `references/running-code.md`). No running during the exam unless the
  real exam allows it.
- Questions follow the real format: same kind of wording, same mix, no
  socratic chains.

## 3. Grade

Per question, in a table:

```
| # | Points | Max | What was there | What was missing |
|---|---|---|---|---|
| 1 | 2 | 4 | <one line> | <one line> |
```

Then:

- **Total** and **pass or fail** against the stated threshold, or against 50 % if
  none was given — say which.
- **If the exam were today:** one or two sentences, honest.
- **For each lost point that matters**: the correct answer in two or three
  sentences. This is the only place the skill explains.

## 4. Close

- **Report card**: read `references/report-card.md` and write it. Rows are the
  areas of the exam. Everything passed in the simulation is *independent*,
  because there was no help.
- **Progress file**: update it as described in `references/progress-file.md`.
  Every area that lost points goes under Still shaky, due tomorrow.
- **Next step**: the one or two areas to work on first, and which skill fits
  (`socratic-concept`, `socratic-source`, `socratic-practice`, `socratic-review`).

## Message format

During the exam: "Noted." and the next question, nothing else. In the grading:
tables and short lines, no pep talk.

## Gotchas

- **Do not soften during the exam.** "Good start!" is feedback.
- **Do not grade generously.** Half an answer gets half the points, or less if
  the exam would give less.
- **Do not leak answers through the questions.** Same rule as in the other
  skills: no partial answer smuggled into the wording.
