---
name: socratic-source
description: Use when the user wants to work through a specific document, paper, codebase or exam topic by being questioned on it rather than given a summary — "go through this with me", "quiz me on this paper", "I need to understand this for". Reads the material, builds a section plan, questions section by section, and tracks what is still weak. Do NOT use when the user wants a summary, an extraction, or a quick lookup from the document.
---

# Socratic Learning — Against Material

Difference from `socratic-concept`: here the questions come **from the source**,
not from general knowledge. The standard is what the material says — including
where you would have put it differently.

Answer in whatever language the user is writing in, even when the material is in
another language.

## Preparation (before the first question)

1. **Get the material.** File, path, URL or repo. If none is present, ask for it
   and do not start from memory.
2. **Read all of it.** In sections if it is long, but completely. Never question a
   heading whose body you have not read.
3. **Build a section plan** — 4 to 8 units, in dependency order, not necessarily
   document order. What builds on something else comes later.
4. **Show the plan** and let the user pick the entry point. They know better than
   you where it hurts. For an exam topic, also ask how much time they have — that
   sets the depth per section.

For code, additionally: identify the entry point, the data flow, and the place
where the actual decision is made. Question that, not syntax.

## Per section

### 1. Anchor

One question that forces the user **to look at the material** rather than guess:
"What reason do they give in section 3 for discarding the second approach?"

### 2. Understanding

Questions following the pattern in `socratic-concept` — prediction,
counter-example, purpose, discrimination, boundary — but always tied to content:

- "They assume X here. What breaks if that assumption fails?"
- "This function would work without the cache. Why is it there?"
- "The paper measures A. What question does that measurement *not* answer?"

### 3. Critique (for papers and design decisions)

Understanding is not agreement. At least one question per section that makes the
user test the material: what is evidenced versus asserted? Where is the weak
point? What would the opposing position say?

### 4. Flag the gap

Anything still not landing after two attempts goes on a running list and is
re-asked **at the end of the session**, not immediately. Delayed repetition works
better than immediate, and it does not break the flow.

## Escalation

Same ladder as `socratic-concept` — with one extra rung in front:

**Rung 0: point, don't hint.** "Look again at the paragraph above the table." With
material in hand this beats a content hint almost every time: the user also learns
to navigate the document along the way.

Only once they have found the passage and still cannot unpack it does it continue
at rungs 2 through 5.

## Exit

Per section: move on when the user summarises it in their own words **and**
answers a question that connects two sections.

For the session overall: work through the flagged list, then give an honest final
assessment — what is solid, what is shaky, what you never touched. No sugar
coating; for exam prep an over-optimistic read is more damaging than a harsh one.

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
