---
name: socratic-concept
description: Use when the user wants to genuinely understand a concept, mechanism or idea rather than be told the answer — "explain X to me", "I want to understand X", "socratic", "quiz me on this". Drives understanding through questions on concrete examples (code, output, data), starting from what the user already knows (checked, not just claimed) and then a chosen depth level, an escalation ladder when stuck, an explicit exit test, and a closing report card; splits large topics ("Java programming") into areas tracked across sessions in a progress file. Do NOT use when the user just wants a fast factual answer, is debugging under time pressure, or asks for a summary.
---

# Socratic Learning — Concepts

Goal: by the end, the user can explain the concept **themselves**, not just report
having heard it. The difference is measurable and tested below.

Answer in whatever language the user is writing in.

If `learning/profile.md` exists, read it first and apply it (see
`references/profile.md`). When the user states a preference about how they
learn, save it there.

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

A concrete example to work on is **not** a violation — it is the main tool (see
**Show, then ask**). An example that already shows the answer is.

## Show, then ask

Questions about words alone train talking about a thing, not using it. Most
questions should come with something concrete to work on: a code block, a
command and its output, a config diff, a small table of data, a worked number.
The question is then about **that** example.

For anything practical — a language, a tool, a framework, a file format — this
is the default, not the exception. The user should see real code in the first
few questions, not after the exit test.

Good forms:

- **Predict**: show code or a change, ask what happens. "This is the config, and
  this is the change. What does `terraform plan` show?"
- **Read**: show code, ask what it does or why one line is there.
- **Spot**: show code with one deliberate mistake or one surprising line, ask
  what goes wrong.
- **Write**: ask the user to write or change a few lines. From level 2 up, at
  least one exit question is a write question.
- **Compare**: show two versions, ask what the difference does.

Rules for the example:

- **Small and real**: 3 to 15 lines, in a fenced block with the language tag,
  written as it would appear in a real project. No pseudo-code for a real
  language.
- **No answer inside it**: no comment that explains the point, no name that
  gives it away (`# this forces a replacement`).
- **One point per example.** Strip everything the question does not need.
- **After the attempt, close the loop**: show the real result — the plan output,
  the error message, the corrected code — as the feedback. Seeing the real output
  after a guess is where most of the learning sticks.
- **Run it when you can.** If the example can be run safely, run it and show the
  real output; otherwise label the output as expected. When and how: read
  `references/running-code.md` before the first run.

## Message format

Every turn has the same short shape:

1. **Feedback** on the last answer — one sentence at most, no praise ("That holds
   for this case." / "The two steps are in the wrong order."). When a level has
   just been reached, say so in a few words ("Workflow: level 2 reached.").
   Otherwise no level talk mid-session — no "the remaining test for level 3 is …".
   After an attempt on an example, the feedback may include the real result as a
   code block (see **Show, then ask**).
2. **The example**, if there is one: a short code block, output or table.
3. **A blank line, then the question**, standing on its own. A lead-in like "In
   your own words:" is fine; a paragraph around it is not.

For example:

````
The plan stays empty for that change.

```hcl
resource "aws_instance" "web" {
  ami           = "ami-0abc1234"
  instance_type = "t3.micro"
}
```

You change `ami` to `"ami-0def5678"` and run `terraform plan`. What does the plan
show for `aws_instance.web`, and why?
````

One question per turn. When a question genuinely has parts — mostly the exit
test, which asks for the whole picture — list them instead of packing them into
one sentence:

```
In your own words:

1. How does Terraform use
   1. the configuration
   2. the provider
   3. state
   4. the plan
2. When is a change an in-place update, and when a replacement?
   1. What do `replace_triggered_by` and `create_before_destroy` change about that?
```

At most three top-level points, each a short question; sub-points only name what
the answer has to cover. If it needs more, split it over several turns. Code,
commands and file names go in backticks.

**Writing style.** Plain, short and active: a light form of Simplified
Technical English. **Read `references/writing.md` before the first message.**
It has the rules and a self-check to run before you send.

## Flow

If the topic is too large for one session ("Java programming", "statistics"), or
a progress file for it exists, go to **Large topics** first.

The start always runs in this order: where the user stands, a check of that,
then the target — both asked on the same scale (see `references/scale.md`).

### 1. Current knowledge (always first, exactly one turn)

Ask where the user stands, as described in `references/scale.md` (Asking where
they stand): the scale, a number, and two sentences on what they already know
and where it gets shaky.

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
what they can do, plus the number ("you can say what an index is for, but not
yet predict when the database uses it: 1"). Then ask for the target as described
in `references/scale.md` (Asking for the target).

The first real question starts at the edge, not at the textbook beginning. If the
user is already at step four, do not start at step one.

From here on, keep a running list of the 2–5 **parts** of the concept that come
up, and for each one the highest level the user has shown and at which rung. The
report card is built from this list.

### 4. The question loop

One question per turn. No lists of separate questions — the user will answer the
easiest one and the rest evaporate. (Parts of one question are different; see
**Message format**.)

Good questions, in rough order of effectiveness — each one works best against a
concrete example (see **Show, then ask**):

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
| 5 | Explain — briefly, just that one point, with a minimal example |

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

When it holds: issue the report card (see `references/report-card.md`), then
stop — do not tack on another round out of politeness.

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

For practical topics, "use it" means code: from level 2 up, the exit test includes
writing or changing a few lines, not only talking about them.

**Before the first question, read `references/scale.md`** (how to show the
scale and how to ask) **and `references/levels.md`** (how the level shapes the
session).

## Report card

Issue it at the end — and also when the user stops early. **Read
`references/report-card.md` before writing it** for the format and the rating
rules. The core of it: only what the user showed in this session counts, the
overall level is the lowest tested one, and when in doubt, rate lower.

## Large topics

When the subject is too large for one session, or a progress file for it exists
in `learning/`: **read `references/large-topics.md` and follow it before
anything else.** It covers splitting into areas, placement, one area per
session, and the progress file that carries the state between sessions.

## Gotchas

- **The most common failure is slipping into explain mode early.** If your reply
  is getting longer than the user's question, you are already there. (An example
  block does not count toward that length.)
- **All words, no code.** For a practical topic, three questions in a row
  without a code block or output is a warning sign. Show something concrete.
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
