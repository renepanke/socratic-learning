<!-- Shared file. Edit shared/references/running-code.md and run tools/sync_shared.py. -->
# Running code

When an example can be run, show its real output instead of writing the output
from memory. Remembered output looks right and is often wrong in the details.
Run it only where it is safe and quick. Otherwise say plainly that the output is
expected, not real.

## When to run

All of these must hold:

- You have a shell (Claude Code, Codex). Claude.ai and plain chat: never.
- The tool is already installed. Check with `<tool> --version` once. Do not
  install anything without asking first.
- It runs locally: no real accounts, no cloud resources, no production data, no
  credentials.
- It runs in a scratch folder: `learning/sandbox/<topic>/` in the current working
  directory. Nothing is written or deleted outside it.
- It finishes in seconds.

A first run that downloads something (`terraform init` fetching providers,
`npm install`, a container image) needs the user's yes once per session.

For tools that normally act on real systems, use their local stand-ins: for
Terraform the `local`, `null` and `random` providers, and `plan` rather than
`apply` unless the user asks for it. Never run against the user's own
infrastructure, even if credentials are present.

## How

- **Run after the attempt, not before.** The output is the answer to a prediction
  question. Running it first gives the answer away.
- **Put the example code in the sandbox** as a real file, so the user can open,
  change and rerun it.
- **Show only the lines that matter**, trimmed, in a code block under a label:
  "Real output (`terraform plan`):".
- **If you could not run it**, label it "Expected output (not run):". Never
  present output you did not run as real.
- **If the real output surprises you**, say so and let it stand. It is the better
  teacher.

## Cleaning up

Leave the sandbox in place during the session. At the end, tell the user where it
is in one line. They decide whether to keep it.
