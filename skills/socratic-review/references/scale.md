<!-- Shared file. Edit shared/references/scale.md and run tools/sync_shared.py. -->
# The scale

All socratic skills use one scale, 0–4, for where the user stands and where they
want to get. Progress files from every skill use it too, so the numbers must mean
the same thing everywhere.

## Showing it

Show it to the user as exactly one of these blocks, translated into their
language. Same wording every time, so the numbers keep their meaning across
questions, sessions and skills.

For a topic, a skill or a tool:

```
0  New: I know the name at most
1  Overview: I can say what it is and what it is for
2  Working: I can use it in ordinary cases
3  Deep: I know why it works and where it breaks
4  Mastery: I can teach it, critique it, carry it over
```

For material (a paper, a document, a codebase):

```
0  New: I have not read it and do not know the subject
1  Overview: I know roughly what it says and why it is there
2  Working: I can use it and connect it to the rest
3  Deep: I know why it holds, what it assumes, where it breaks
4  Mastery: I can defend it, attack it, and teach it
```

Ask for a number only with the block in the same message — never a bare "1,
level 3".

## Asking where they stand

The block, then the question in one line. For a single topic, also ask for two
sentences on what they know and where it gets shaky. For several areas or
sections, a table they fill in with numbers. Name the first column after what
the rows are: Area, Section or Unit.

```
| # | Area | You now |
|---|---|---|
| 1 | <area> | ? |
| 2 | <area> | ? |

Answer with numbers, e.g. "1=2, 2=1, 3=0". Add a word wherever something is shaky.
```

## Asking for the target

The block again, the level after the check, and a suggested target — so that
agreeing takes one word:

```
| # | Area | Now (checked) | Suggested target |
|---|---|---|---|
| 1 | <area> | 1 | 3 |
| 2 | <area> | 0 | 2 |

Keep the suggestion, or give other numbers.
```

A target of 0 means "skip this one". If the user does not answer, the suggestion
stands — say so in one sentence.
