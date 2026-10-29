<!-- Shared file. Edit shared/references/writing.md and run tools/sync_shared.py. -->
# Writing style

Every message to the user follows a light form of ASD-STE100 Simplified
Technical English. Plain, short text keeps the user's attention on the question
instead of on the prose around it.

The rules are adapted from the `ste-writing` skill
(github.com/1fc0nfig/ste-writing, MIT, Ege Çelebi and Matyas Cerny), which
builds on github.com/woosal1337/blog by Ege Çelebi. ASD-STE100 is a
specification of ASD. This skill is not affiliated with ASD and is not a
certified ASD-STE100 checker. The standard is free at https://asd-ste100.org.

## Modes

- **Strict** for questions and exit tests: at most 20 words per sentence, one
  question per sentence.
- **Flavored** for feedback, the report card and the progress file: at most 25
  words per sentence, all other rules apply.
- Never applied to code, identifiers, commands, or quotes from the material.

## Rules for every language

- **One name for one thing.** Use the term the user or the material uses, and
  keep it for the whole session.
- **Active voice**, with the actor named: "Terraform reads the state", not "the
  state is read".
- **A verb for an action**: "compare the two plans", not "make a comparison of
  the two plans".
- **No stacked hedges.** Not "it might be worth considering whether". Ask
  directly.
- **No semicolons, no em dash, no en dash** in prose. Use a period, a comma or a
  colon.
- **Lists for parts and steps**: numbered, one item per line.
- **Nothing around the message**: no preamble, no "let's look at", no summary of
  what comes next, no closing remark.

## Extra rules for English

- **The short common word**: start (not begin, initiate), use (not utilize,
  leverage), help (not facilitate), make sure (not ensure), before (not prior
  to), about (not regarding), get (not obtain), show (not demonstrate), also (not
  additionally, furthermore, moreover).
- **No marketing adjectives**: seamless, robust, powerful, elegant, and the like.
- **No phrasal verb where a plain verb exists**: start (not kick off), examine
  (not dive into).
- **No contractions**, and keep the articles: a, an, the.

## Other languages

Apply the same discipline in the user's language: short sentences, active voice,
everyday words, no filler ("es ist wichtig zu beachten, dass"), no noun style
("die Durchführung einer Analyse" becomes "analysieren"). The English word list
does not apply.

## Self-check before sending

1. A sentence over the limit? Split it.
2. A semicolon or a dash in prose? Replace it.
3. Passive voice with a known actor? Make it active.
4. A noun where a verb works? Use the verb.
5. The same thing named two ways? Pick one name.
6. Anything before the feedback or after the question? Delete it.

## The linter

`scripts/ste-lint.py` in this skill checks the mechanical rules for **English**
text. The score is violations per 100 words, and lower is cleaner.

- Use it on the report card and the progress file when you can run Python:
  lint, fix, lint again. Pipe the text in:
  `python3 scripts/ste-lint.py < draft.md` (path relative to this skill).
- Do not lint every chat message. The self-check is enough there.
- Do not chase a score of zero. A quoted term or a proper noun can trip a check
  and still be correct.
- Skip it for other languages. Its word lists and patterns are English only.

The linter fixes the form of a text, not its content. It cannot tell whether a
question is good or a rating is fair.
