#!/usr/bin/env python3
"""Copy the files in shared/ into every skill, so each skill stays self-contained.

    python3 tools/sync_shared.py           # write the copies
    python3 tools/sync_shared.py --check   # exit 1 if any copy is missing or differs

shared/references/* goes to skills/<skill>/references/, shared/scripts/* to
skills/<skill>/scripts/. Each copy starts with a note that points back here.
"""
import pathlib
import sys

repo = pathlib.Path(__file__).resolve().parent.parent
shared = repo / "shared"
skills = sorted(p for p in (repo / "skills").iterdir() if (p / "SKILL.md").is_file())


def header(rel):
    note = f"Shared file. Edit shared/{rel} and run tools/sync_shared.py."
    return f"# {note}\n" if rel.endswith(".py") else f"<!-- {note} -->\n"


def expected():
    for src in sorted(shared.rglob("*")):
        if src.is_file() and src.name != ".DS_Store":
            rel = src.relative_to(shared).as_posix()
            yield rel, header(rel) + src.read_text()


def main():
    check = "--check" in sys.argv[1:]
    drift = []
    for skill in skills:
        for rel, content in expected():
            dest = skill / rel
            current = dest.read_text() if dest.is_file() else None
            if current == content:
                continue
            if check:
                drift.append(f"{dest.relative_to(repo)}: {'missing' if current is None else 'differs'}")
            else:
                dest.parent.mkdir(parents=True, exist_ok=True)
                dest.write_text(content)
                print(f"wrote {dest.relative_to(repo)}")
    if check:
        if drift:
            print("Shared copies out of sync (run tools/sync_shared.py):")
            print("\n".join(f"  {d}" for d in drift))
            sys.exit(1)
        print(f"ok: {len(skills)} skills in sync with shared/")


if __name__ == "__main__":
    main()
