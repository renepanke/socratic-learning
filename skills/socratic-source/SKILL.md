---
name: socratic-source
description: Use when the user wants to work through a specific document, paper, codebase or exam topic by being questioned on it rather than given a summary — "go through this with me", "quiz me on this paper", "I need to understand this for". Reads the material, builds a section plan, checks what the user already knows before they pick a depth level, questions section by section, tracks what is still weak, and closes with a report card; spreads large material (a textbook, a course) over several sessions with a progress file. Do NOT use when the user wants a summary, an extraction, or a quick lookup from the document.
---

# Socratic Learning — Against Material

Here the questions come **from the source**, not from general knowledge. The
standard is what the material says — including where you would have put it
differently. (For a concept with no specific material, the sibling skill
`socratic-concept` fits better, if installed.)

Until the user has made an attempt of their own: no summary of the section, no
explanation, and no answer smuggled into the question itself. One question per
turn. On a wrong answer, do not correct — construct a case from the material
where the misconception visibly fails.

Answer in whatever language the user is writing in, even when the material is in
another language.

## Preparation (before the first question)

1. **Get the material.** File, path, URL or repo. If none is present, ask for it
   and do not start from memory. If a progress file for it exists, or the
   material is too large for one session (a textbook, a course, a large
   codebase), go to **Large material** first.
2. **Read all of it.** In sections if it is long, but completely. Never question a
   heading whose body you have not read.
3. **Build a section plan** — 4 to 8 units, in dependency order, not necessarily
   document order. What builds on something else comes later.
4. **Show the plan and ask what the user already knows.** Have they read it,
   which sections feel familiar, what do they know about the subject anyway? Two
   sentences is enough. No levels, no numbers, no scale here — the user does not
   know them yet.
5. **Check.** Ask one question, anchored in the material, on the section the user
   called most familiar. If it holds, a second one on the next. No ladder, no
   hints: a wrong answer simply moves the starting point back.
6. **Target and entry point.** Tell the user in one or two plain sentences where
   they stand, then offer the depth levels as described under **Depth levels**,
   and let them pick a level and the entry point. They know better than you where
   it hurts. For an exam topic, also ask how much time they have and what the
   exam asks for — that decides the level.

Never ask for a level before the user has seen what the levels mean.

For code, additionally: identify the entry point, the data flow, and the place
where the actual decision is made. Question that, not syntax.

## Per section

For each section, keep track of the highest level the user has shown and at which
rung. The report card is built from this.

### 1. Anchor

One question that forces the user **to look at the material** rather than guess:
"What reason do they give in section 3 for discarding the second approach?"

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
| 5 | Explain — briefly, just that one point |

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
card (see **Report card**). No sugar coating; for exam prep an over-optimistic
read is more damaging than a harsh one.

## Depth levels

The user picks how deep to go. Each level is defined by what they can **do** at
the end, and that is exactly what its exit test checks — applied per section.

| Level | Name | At the end you can … | Exit test per section |
|---|---|---|---|
| 1 | Overview | say what the section claims or does, and why it is there | Own-words summary |
| 2 | Working | use it and connect it to the rest of the material | Level 1 + a question connecting two sections |
| 3 | Deep | say why it holds, what it assumes, and where it breaks | Level 2 + correct handling of a case the material does not discuss |
| 4 | Mastery | defend it, attack it, and teach it | Level 3 + holds it against the strongest counter-position, + finds and fixes a misreading you play as a learner |

**Offering it.** Only after the current knowledge has been checked (Preparation,
steps 4–5). One line per level, in the user's language, phrased as "at the end
you can …" — not the names alone. Mark where the user stands now ("not yet level
1" is a valid answer). Show this full list **every** time you ask for a target —
in Large material and per section too. Never ask for a bare number like "1,
level 3". If they do not pick, take level 2 for
material in general and say so in one sentence. For an exam, take the level the
exam asks for — recall-heavy exams rarely need more than 2, essay and oral exams
usually need 3.

**Per section.** One level for the session, but the user may lower or raise it
for single sections in the plan ("section 5 only an overview"). Show the level
next to each section.

**Time against level.** If the time they have will not cover the plan at the
chosen level, say so plainly with a rough estimate, and let them choose: fewer
sections at that level, or all sections one level lower. Do not quietly do both
halfway.

**Holding to it.**

- Stop at the target. Do not drag a level-1 section through boundary cases.
- The user can change the level any time. Adjust without discussion.

## Report card

Issue it at the end — and also when the user stops early. It records what the
user **showed** in this session, not what was talked about. Write it in the
user's language, in this shape:

```
## Report card: <material>
Target: level 2 (Working) · Reached: level 2 (5 of 6 sections tested)

| Section | Target | Reached | Evidence | How solid |
|---|---|---|---|---|
| <section> | 2 | 2 | Connected the sampling choice to the bias in section 5 unprompted | independent |
| <section> | 3 | 2 | Summary correct; missed the unstated assumption until pointed to it | with help |
| <section> | 2 | – | Not covered | not tested |

**Worked out yourself:** 1–3 points, phrased as what they did.
**Still shaky:** each spot, with the passage to reread and the question that would test it.
**Flagged list:** each flagged item — resolved at the end, or still open.
**Next step:** one concrete thing — a section, a question, or the next level.
```

For exam prep, add one line: **If the exam were today:** which sections would
likely cost points, and why. Honest, not reassuring.

Rating rules:

- **A level counts only once its exit test was passed.** Recall, agreement with
  you, or a section merely being discussed does not count.
- **How solid**: *independent* = passed at rung 0–2; *with help* = passed only
  after rung 3–5 (including a transfer question after an explanation);
  *not tested* = never put to an exit test.
- *With help* still counts as reached in the table, but it always also appears
  under **Still shaky**.
- **The overall level is the lowest reached level among the tested sections.** No
  averaging, no rounding up. The Reached line always says how many sections were
  tested.
- **Evidence** is one concrete line about what the user did. No adjectives, no
  praise.
- Table plus the short blocks, nothing else. No closing pep talk.

## Large material

Material is too large for one session when the plan would need more than about
eight units, or the time the user has will not cover it at the chosen level. Then
the plan spans several sessions.

1. **Look for a progress file** (see **Progress file**). If there is one, show
   where things stand and go to step 5.
2. **Map the whole, read the part.** Build the plan from the structure — table of
   contents, chapter introductions and summaries, module layout for code. Units
   are now chapters or modules, still in dependency order. "Read all of it" then
   applies per session: read the units of **this** session completely before
   questioning them.
3. **Current knowledge.** Ask, in one message, how well the user knows each
   unit — in plain words, not levels. Offer this scale and let them answer per
   unit in free text:
   - haven't read it, don't know the subject → 0
   - skimmed it, know roughly what it says → claims level 1
   - worked through it, could use it → claims level 2
   - know why it holds and where it breaks → claims level 3
4. **Check.** For each unit claimed at 2 or higher, ask one check question at
   that level, anchored in the material, one per turn. A failed check sets the
   unit one level lower. No ladder and no teaching here: this is placement.
5. **Target.** Show the result per unit in plain words, then the depth levels as
   described under **Depth levels**, and let the user pick two or three units
   for this session and a level for each. Suggest an order along the
   dependencies. Then run the per-section flow on those units only; the
   preparation's knowledge and check steps are already covered by placement.
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
| <unit> | <units> | 2 | 2 | placement | – |
| <unit> | <units> | 2 | – | not tested | – |

## Still shaky
- <unit>: <spot> — <passage to reread> — <question that would test it>

## Open flagged items
- <item from the flagged list that was still open at the end of a session>

## Next
<the units and level suggested for the next session, and why>
```

Rules:

- **Placement** results are entered with How solid *placement*. They count until
  a real session confirms or corrects them.
- **Update only from what was shown**, by the report card's rating rules. Never
  raise a level from placement or from the user's say-so alone.
- **On resume**, open with one check question on the most recent shaky spot or
  open flagged item, before anything new. Delayed repetition is the point.
- **The file is the user's.** If they edited it, take their edits as the current
  state.

## Gotchas

- **Do not slide into summarising.** "What was this about again?" is usually
  fatigue, not lost interest. Offer a short break instead of switching into
  lecture mode.
- **No questions about passages you have not read.** Load more instead.
- **Respect quotation limits.** Point at the material and paraphrase; do not
  reproduce long passages.
- **If the material contradicts your own knowledge**, say so openly and turn it
  into a question — but do not answer it for the user.
- **For code**: ask about behaviour and intent, not line numbers.
- **Do not inflate the report card.** A generous grade feels kind and is useless:
  the user plans their next step on it. When in doubt, the lower level and
  *with help*.
