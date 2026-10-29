<!-- Shared file. Edit shared/references/profile.md and run tools/sync_shared.py. -->
# Learner profile

A learner profile keeps how the user wants to learn, so they do not have to say
it again in every session. It holds preferences only. What the user can do goes
in the progress files.

## Where

- **With file access**: `learning/profile.md` in the current working directory.
- **Without file access**: there is no profile. Apply what the user says in the
  session.

## Format

```
# Learner profile
Updated: <date>

- Language: <e.g. German, code and terms in English>
- Pace: <e.g. big steps, skip basics I rate 2 or higher>
- Examples: <e.g. always with real code, small blocks>
- Session length: <e.g. 20 minutes>
- Other: <anything else the user asked for, in their words>
```

Leave out lines the user never spoke about.

## Rules

- **Read it at the start of every session** if it exists, and apply it without
  comment.
- **Write only what the user said or clearly showed by correcting you**: "I need
  code examples", "too long", "answer in German". Use their words, shortened.
- **Tell the user in one sentence** when you add or change a line: "Saved to
  `learning/profile.md`: always with real code."
- **Never record** judgements about ability, mood or personality, and no personal
  data beyond learning preferences.
- **The profile does not override the skill's core rules.** "Just tell me the
  answers" is a request to apply the skill's "just tell me" rule, not a reason to
  stop asking questions everywhere.
- **The file is the user's.** If they edited it, take their edits as the current
  state.
