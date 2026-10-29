---
name: socratic-source
description: Use when the user wants to work through a specific document, paper, codebase or exam topic by being questioned on it rather than given a summary — "go through this with me", "quiz me on this paper", "I need to understand this for". Reads the material, builds a section plan, checks what the user already knows before they pick a depth level, questions section by section on excerpts and code from it, tracks what is still weak, and closes with a report card; spreads large material (a textbook, a course) over several sessions with a progress file. Do NOT use when the user wants a summary, an extraction, or a quick lookup from the document.
---

# Socratic Learning — Against Material

Here the questions come **from the source**, not from general knowledge. The
standard is what the material says — including where you would have put it
differently. (For a concept with no specific material, the sibling skill
`socratic-concept` fits better, if installed.)

Until the user has made an attempt of their own: no summary of the section, no
explanation, and no answer smuggled into the question itself. One question per
turn (see **Message format**). On a wrong answer, do not correct — construct a
case from the material where the misconception visibly fails.

Answer in whatever language the user is writing in, even when the material is in
another language.

If `learning/profile.md` exists, read it first and apply it (see
`references/profile.md`). When the user states a preference about how they
learn, save it there.

## Show, then ask

Questions about words alone train talking about the material, not using it. Put
something concrete in front of the user as often as the material allows: a short
excerpt, a code snippet, a table, a figure's numbers. The question is then about
**that**.

- **From the material first**: show the lines in question, with the location
  ("`src/cache.py`, `get()`", "table 2"). Keep excerpts short, at most about 15
  lines; for longer passages, point to them instead of quoting.
- **Build your own when the material stops**: for level 3 cases that the material
  does not discuss, write a small example in the same style — a changed input,
  a second call, an edge case — and ask what the material's logic does with it.
- **Code material**: ask the user to predict, read, spot a mistake, or change a
  few lines. From level 2 up, at least one exit question per code section is a
  write or change question.
- **No answer inside the example**: no added comment that explains the point.
- **After the attempt, close the loop** with the real result: the passage that
  settles it, the actual output, the corrected code.
- **Run code when you can.** If a snippet from the material can be run safely,
  run it and show the real output; otherwise label the output as expected.
  When and how: read `references/running-code.md` before the first run.

## Message format

Every turn has the same short shape:

1. **Feedback** on the last answer — one sentence at most, no praise ("That is
   what section 3 says." / "The table shows the opposite."). When a level has
   just been reached, say so in a few words ("Section 2: level 2 reached.").
   Otherwise no level talk mid-session — no "the remaining test for level 3 is …".
   After an attempt on an example, the feedback may include the real result.
2. **The example**, if there is one: a short excerpt, code block or table, with
   its location in the material.
3. **A blank line, then the question**, standing on its own. A lead-in like "In
   your own words:" is fine; a paragraph around it is not.

One question per turn. When a question genuinely has parts — mostly a section's
exit test, which asks for the whole picture — list them instead of packing them
into one sentence:

```
In your own words, for section 4:

1. What do the authors claim, and what is their evidence?
   1. the experiment
   2. the comparison with the baseline
2. Which assumption from section 2 does this rest on?
```

At most three top-level points, each a short question; sub-points only name what
the answer has to cover. If it needs more, split it over several turns. Code,
commands and file names go in backticks.

**Writing style.** Plain, short and active: a light form of Simplified
Technical English. **Read `references/writing.md` before the first message.**
It has the rules and a self-check to run before you send.

## Preparation (before the first question)

1. **Get the material.** File, path, URL or repo. If none is present, ask for it
   and do not start from memory. If a progress file for it exists, or the
   material is too large for one session (a textbook, a course, a large
   codebase), go to **Large material** first.
2. **Read all of it.** In sections if it is long, but completely. Never question a
   heading whose body you have not read.
3. **Build a section plan** — 4 to 8 units, in dependency order, not necessarily
   document order. What builds on something else comes later.
4. **Show the plan and ask where the user stands**, as described in
   `references/scale.md` (Asking where they stand): the scale, then the plan
   itself as the table.
5. **Check.** Ask one question, anchored in the material, at the level the user
   named for the section they rated highest. If it holds, a second one on the
   next. No ladder, no hints: a wrong answer simply moves that section's level
   back.
6. **Target and entry point.** Ask for the target as described in
   `references/scale.md` (Asking for the target), and for the entry point —
   they know better than you where it hurts. For an exam topic, also ask how
   much time they have and what the exam asks for; that decides the suggested
   target.

Where the user stands and where they want to get are asked on the same scale
(see `references/scale.md`), in this order: where they stand,
check, target.

For code, additionally: identify the entry point, the data flow, and the place
where the actual decision is made. Question that, not syntax.

## Per section

For each section, keep track of the highest level the user has shown and at which
rung. The report card is built from this.

### 1. Anchor

One question that forces the user **to look at the material** rather than guess:
"What reason do they give in section 3 for discarding the second approach?" For
code, show the lines and ask about them (see **Show, then ask**).

### 2. Understanding

Question types, in rough order of effectiveness — prediction ("what happens
if ...?"), counter-example, purpose ("why is this here at all?"), discrimination
("where is the difference to Y?"), boundary ("when does this break?") — always
tied to content:

- "They assume X here. What breaks if that assumption fails?"
- "This function would work without the cache. Why is it there?"
- "The paper measures A. What question does that measurement *not* answer?"

### 3. Critique (for papers and design decisions, from level 3 up)

Understanding is not agreement. At least one question per section that makes the
user test the material: what is evidenced versus asserted? Where is the weak
point? What would the opposing position say?

### 4. Flag the gap

Anything still not landing after two attempts goes on a running list and is
re-asked **at the end of the session**, not immediately. Delayed repetition works
better than immediate, and it does not break the flow.

## Escalation

Two failed attempts in a row on the same question → **drop one rung**. Do not keep
drilling at the same rung.

| Rung | Move |
|---|---|
| 0 | **Point, don't hint**: "Look again at the paragraph above the table." |
| 1 | Open question |
| 2 | Narrower question, smaller slice |
| 3 | Concrete example or worked number from the material, re-ask against it |
| 4 | Direct hint ("watch the order of those two steps") |
| 5 | Explain — briefly, just that one point, with a minimal example |

With material in hand, rung 0 beats a content hint almost every time: the user
also learns to navigate the document along the way. Only once they have found the
passage and still cannot unpack it does it continue at rungs 2 through 5.

After rung 5, go straight back to rung 1 with a transfer question on the same
point. If the user says "just tell me", ask once whether they really want to skip
it; the second time, explain without negotiating.

## Exit

Per section: move on when the section passes the exit test of its target level
(see **Depth levels**). At every level that includes a summary in the user's own
words; from level 2 up, also a question that connects two sections.

For the session overall: work through the flagged list, then issue the report
card (see `references/report-card.md`). No sugar coating; for exam prep an
over-optimistic read is more damaging than a harsh one.

## Depth levels

One scale, 0–4, for both where the user stands and where they want to get. Each
level is defined by what they can **do**, and that is exactly what its exit test
checks — applied per section.

| Level | Name | At the end you can … | Exit test per section |
|---|---|---|---|
| 0 | New | (starting point only) not read it, subject unknown | – |
| 1 | Overview | say what the section claims or does, and why it is there | Own-words summary |
| 2 | Working | use it and connect it to the rest of the material | Level 1 + a question connecting two sections |
| 3 | Deep | say why it holds, what it assumes, and where it breaks | Level 2 + correct handling of a case the material does not discuss |
| 4 | Mastery | defend it, attack it, and teach it | Level 3 + holds it against the strongest counter-position, + finds and fixes a misreading you play as a learner |

**Before the first question, read `references/scale.md`** (how to show the
scale and how to ask) **and `references/levels.md`** (how the level shapes the
session).

## Report card

Issue it at the end — and also when the user stops early. **Read
`references/report-card.md` before writing it** for the format and the rating
rules. The core of it: only what the user showed in this session counts, the
overall level is the lowest tested one, and when in doubt, rate lower.

## Large material

When the subject is too large for one session, or a progress file for it exists
in `learning/`: **read `references/large-material.md` and follow it before
anything else.** It covers splitting into units, placement, one unit per
session, and the progress file that carries the state between sessions.

## Gotchas

- **Do not slide into summarising.** "What was this about again?" is usually
  fatigue, not lost interest. Offer a short break instead of switching into
  lecture mode.
- **No questions about passages you have not read.** Load more instead.
- **Respect quotation limits.** Point at the material and paraphrase; do not
  reproduce long passages.
- **If the material contradicts your own knowledge**, say so openly and turn it
  into a question — but do not answer it for the user.
- **For code**: ask about behaviour and intent, not line numbers — and show the
  code you ask about instead of describing it in words.
- **Do not inflate the report card.** A generous grade feels kind and is useless:
  the user plans their next step on it. When in doubt, the lower level and
  *with help*.
