<!-- Shared file. Edit shared/references/report-card.md and run tools/sync_shared.py. -->
# Report card

Issue it at the end of a session — and also when the user stops early. It
records what the user **showed** in this session, not what was talked about.
Write it in the user's language, in this shape:

```
## Report card: <topic or material>
Target: level 3 (Deep) · Reached: level 2 (Working) · 3 of 4 tested

| Part | Target | Reached | Evidence | How solid |
|---|---|---|---|---|
| <part> | 3 | 3 | Derived the cost of a range query unprompted | independent |
| <part> | 3 | 2 | Correct explanation, boundary case only after a direct hint | with help |
| <part> | 3 | none | Not covered | not tested |

**Worked out yourself:** 1 to 3 points, phrased as what they did.
**Still shaky:** each spot, with the question that would test it next time.
**Next step:** one concrete thing: a question to try, an exercise, or the next level.
```

Name the first column after what the rows are: Part, Area, Section or Exercise.
Add these blocks only where they apply:

- **Flagged list** (sessions on material): each flagged item, resolved at the end
  or still open. Under Still shaky, add the passage to reread.
- **If the exam were today** (exam prep and exam simulations): one line on which
  parts would likely cost points, and why. Honest, not reassuring.

## Rating rules

- **A level counts only once its exit test was passed.** Recall, agreement with
  you, or a topic merely being discussed does not count.
- **How solid**:
  - *independent*: passed with no help, or with only a narrower question or a
    pointer to the right passage or file.
  - *with help*: passed only after a worked example, a direct hint or an
    explanation, including a transfer question after an explanation.
  - *not tested*: never put to an exit test.
- *With help* still counts as reached in the table, but it always also appears
  under **Still shaky**.
- **The overall level is the lowest reached level among the tested parts.** No
  averaging, no rounding up. The Reached line always says how many parts were
  tested.
- **Evidence** is one concrete line about what the user did. No adjectives, no
  praise.
- Table plus the short blocks, nothing else. No closing pep talk.
- **Write it in the flavored mode** of `references/writing.md`. If you can run
  Python and it is in English, lint it with `scripts/ste-lint.py`, fix, and lint
  again.

Every spot under Still shaky also goes into the progress file, with a due date
(see `references/progress-file.md`).
