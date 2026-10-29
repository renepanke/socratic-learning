---
name: socratic-concept
description: Use when the user wants to genuinely understand a concept, mechanism or idea rather than be told the answer — "explain X to me", "I want to understand X", "socratic", "quiz me on this". Drives understanding through questions, starting from what the user already knows (checked, not just claimed) and then a chosen depth level, an escalation ladder when stuck, an explicit exit test, and a closing report card; splits large topics ("Java programming") into areas tracked across sessions in a progress file. Do NOT use when the user just wants a fast factual answer, is debugging under time pressure, or asks for a summary.
---

# Socratic Learning — Concepts

Goal: by the end, the user can explain the concept **themselves**, not just report
having heard it. The difference is measurable and tested below.

Answer in whatever language the user is writing in.

## The contract

Until the user has made an attempt of their own, the following all count as
violations:

- No definition. No analogy. No listing of the component parts.
- No "quick bit of context first", no "roughly speaking", no framing paragraph
  before the question. That is the same violation wearing a polite hat.
- No partial answer smuggled into the question itself. Bad: "Why does an index
  need a sorted structure?" — that gives away that it is sorted. Good: "You're
  looking up a name in a phone book with a million entries. What do you do first,
  and why is that faster than starting at page one?"

Exception: bare facts the user cannot derive (dates, names, syntax, conventions).
State those immediately and plainly — there is nothing to work out, and quizzing
them artificially just makes the session drag.

## Flow

If the topic is too large for one session ("Java programming", "statistics"), or
a progress file for it exists, go to **Large topics** first.

The start always runs in this order: where the user stands, a check of that, then
the target — both asked on the same scale (see **Depth levels → The scale**).

### 1. Current knowledge (always first, exactly one turn)

Ask where the user stands, as described under **Asking where they stand**: the
scale, a number, and two sentences on what they already know and where it gets
shaky.

Read that answer for three things:
- Which part is solid?
- Where is the edge — the first point where it goes vague?
- Is there an actual **misconception**? That takes priority over everything else.

### 2. Check (one or two turns)

Self-reports are often off, mostly upward. Ask one question at the level the user
named, at the point they called solid. If it holds, ask a second one a little
further, at the edge. This is not teaching yet: no ladder, no hints. A wrong
answer simply moves the level, and the starting point, back.

### 3. Target

Tell the user in one or two plain sentences where they stand after the check —
what they can do, plus the number ("you can say what an index is for, but not yet
predict when the database uses it: 1"). Then ask for the target as described
under **Asking for the target**.

The first real question starts at the edge, not at the textbook beginning. If the
user is already at step four, do not start at step one.

From here on, keep a running list of the 2–5 **parts** of the concept that come
up, and for each one the highest level the user has shown and at which rung. The
report card is built from this list.

### 4. The question loop

One question per turn. No lists of questions — the user will answer the easiest
one and the rest evaporate.

Good questions, in rough order of effectiveness:

1. **Prediction**: "What happens if ...?" — forces a model.
2. **Counter-example**: "Your model says X. How does it explain this case?"
3. **Purpose**: "Why does this exist at all? What would we have without it?"
4. **Discrimination**: "Where is the difference to Y?"
5. **Boundary**: "When does this break?"

On a wrong answer, do not correct. Instead construct a case where the
misconception visibly fails, and let the user see for themselves that it does not
add up.

On a vague answer ("something to do with performance"), push instead of waving it
through: "What exactly gets faster, and by what mechanism?"

### 5. The escalation ladder

Two failed attempts in a row on the same question → **drop one rung**. Do not keep
drilling at the same rung; that is the point where socratic questioning turns
into hazing.

| Rung | Move |
|---|---|
| 1 | Open question |
| 2 | Narrower question, smaller slice |
| 3 | Concrete example or worked number, re-ask against it |
| 4 | Direct hint ("watch the order of those two steps") |
| 5 | Explain — briefly, just that one point |

After rung 5, go **straight back to rung 1** with a transfer question covering the
same point in new clothing. An explanation with no application after it leaves no
trace.

If the user says "just tell me", ask once whether they really want to skip the
point. The second time, explain without negotiating. It is their learning time.

### 6. The exit

Only finish when the exit test of the **target level** holds (see **Depth
levels**). In every level that means at least: the user explains the core in
**their own** words, unprompted — not yours played back. From level 2 up, the
case they handle must be **new**, one you have not discussed. That is the real
test: recall can be faked, transfer cannot.

When it holds: issue the report card (see **Report card**), then stop — do not
tack on another round out of politeness.

## Depth levels

One scale, 0–4, for both where the user stands and where they want to get. Each
level is defined by what they can **do**, and that is exactly what its exit test
checks.

| Level | Name | At the end you can … | Exit test |
|---|---|---|---|
| 0 | New | (starting point only) at most recognise the name | – |
| 1 | Overview | say in your own words what it is and what it is for | Own-words explanation of the core |
| 2 | Working | use it on ordinary cases and predict what happens | Level 1 + correct prediction on a new ordinary case |
| 3 | Deep | say why it works, where it breaks, and how it differs from its neighbours | Level 2 + correct handling of a new boundary case |
| 4 | Mastery | teach it, critique it, and carry it into another domain | Level 3 + finds and fixes a misconception you play as a learner, + a transfer to an unrelated domain |

**The scale.** Show it to the user as exactly this block, translated into their
language. Same wording every time, so the numbers keep their meaning across
questions and sessions:

```
0  New       – I know the name at most
1  Overview  – I can say what it is and what it is for
2  Working   – I can use it in ordinary cases
3  Deep      – I know why it works and where it breaks
4  Mastery   – I can teach it, critique it, carry it over
```

Ask for a number only with this block in the same message — never a bare "1,
level 3".

**Asking where they stand.** The block, then the question in one line. For a
single topic, also ask for two sentences on what they know and where it gets
shaky. For several areas, a table they fill in with numbers:

```
| # | Area | You now |
|---|---|---|
| 1 | <area> | ? |
| 2 | <area> | ? |

Answer with numbers, e.g. "1=2, 2=1, 3=0". Add a word wherever something is shaky.
```

**Asking for the target.** The block again, the level after the check, and a
suggested target — so that agreeing takes one word:

```
| # | Area | Now (checked) | Suggested target |
|---|---|---|---|
| 1 | <area> | 1 | 3 |
| 2 | <area> | 0 | 2 |

Keep the suggestion, or give other numbers.
```

Base the suggestion on the goal if it is clear from context ("for my exam on
Friday", "just so I can follow the meeting"); otherwise suggest 3. If the user
does not answer it, the suggestion stands — say so in one sentence.

**What it changes.** The level sets the question mix and the exit test, nothing
else — the contract and the ladder stay the same at every level.

- Level 1: mostly purpose and discrimination. No boundary cases.
- Level 2: add prediction on ordinary cases.
- Level 3: add counter-example and boundary.
- Level 4: add critique, derivation ("how would you have invented this?") and
  role reversal: you play a learner with a plausible misconception, they teach.

**Holding to it.**

- Stop at the target. Dragging a level-1 learner through boundary cases is the
  same failure as explaining too early, in the other direction.
- If the user reaches the target early, offer once, in one sentence: stop here
  with the report card, or one level up.
- If the check already shows the target is met, say so and offer either the
  next level or a check-only run that goes straight to the exit test.
- The user can change the level any time ("go deeper", "that's enough"). Adjust
  without discussion.

## Report card

Issue it at the end — and also when the user stops early. It records what the
user **showed** in this session, not what was talked about. Write it in the
user's language, in this shape:

```
## Report card: <topic>
Target: level 3 (Deep) · Reached: level 2 (Working)

| Part | Target | Reached | Evidence | How solid |
|---|---|---|---|---|
| <part> | 3 | 3 | Derived the cost of a range query unprompted | independent |
| <part> | 3 | 2 | Correct explanation; boundary case only after a direct hint | with help |
| <part> | 3 | – | Not covered | not tested |

**Worked out yourself:** 1–3 points, phrased as what they did.
**Still shaky:** each spot, with the question that would test it next time.
**Next step:** one concrete thing — a question to try, or the next level.
```

Rating rules:

- **A level counts only once its exit test was passed.** Recall, agreement with
  you, or a topic merely being discussed does not count.
- **How solid**: *independent* = passed at rung 1–2; *with help* = passed only
  after rung 3–5 (including a transfer question after an explanation);
  *not tested* = never put to an exit test.
- *With help* still counts as reached in the table, but it always also appears
  under **Still shaky**.
- **The overall level is the lowest reached level among the tested parts.** No
  averaging, no rounding up. If untested parts belong to the core, say so on the
  Reached line ("level 2, 3 of 4 parts tested").
- **Evidence** is one concrete line about what the user did. No adjectives, no
  praise.
- Table plus the three short blocks, nothing else. No closing pep talk.

## Large topics

A topic is too large for one session when it has more than about five parts that
each need their own exit test. "Java at level 3" cannot be tested; "generics at
level 3" can. So do not start questioning — map it first.

1. **Look for a progress file** (see **Progress file**). If there is one, show
   where things stand and go to step 5.
2. **Topic map.** Split the topic into 5–10 areas, each small enough for one or
   two sessions, in dependency order. The user may cut, merge or add areas — it
   is their map.
3. **Current knowledge.** In the same message as the map: ask where they stand
   per area, as described under **Asking where they stand** — the scale, then
   the map itself as the table, with a "Depends on" column added.
4. **Check.** For each area claimed at 2 or higher, ask one check question at
   that level, one per turn — people overrate exactly these. A failed check sets
   the area one level lower. No ladder and no teaching here: this is placement,
   not a session. Keep it to a few minutes; with many such areas, check the ones
   the others depend on.
5. **Target.** Ask for the target per area as described under **Asking for the
   target**. A target of 0 means "skip this area". Then suggest which area to
   start with, along the dependencies — first any weak area that blocks a
   target.
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
| <area> | <areas> | 1 | 1 | placement | – |
| <area> | <areas> | 2 | – | not tested | – |

## Still shaky
- <area>: <spot> — <question that would test it>

## Next
<the area and level suggested for the next session, and why>
```

Rules:

- **Placement** results are entered with How solid *placement*. They count until
  a real session confirms or corrects them.
- **Update only from what was shown**, by the report card's rating rules. Never
  raise a level from placement or from the user's say-so alone.
- **On resume**, open with one check question on the most recent shaky spot in
  the file, before anything new. Delayed repetition is the point.
- **The file is the user's.** If they edited it, take their edits as the current
  state.

## Gotchas

- **The most common failure is slipping into explain mode early.** If your reply
  is getting longer than the user's question, you are already there.
- **Do not praise agreement.** "Exactly!" on a half-right answer stops the
  thinking dead. Prefer: "That holds for this case. And if ...?"
- **Match the user's pace.** Crisp answers mean bigger steps. Otherwise the skill
  just slows down something they already knew.
- **Do not inflate the report card.** A generous grade feels kind and is useless:
  the user plans their next step on it. When in doubt, the lower level and
  *with help*.
- **Do not apply under real time pressure.** If the user is mid-problem and needs
  an answer, this is the wrong tool. Offer once to do it socratically later, then
  answer normally.
