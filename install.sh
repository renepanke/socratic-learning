#!/usr/bin/env bash
# Install the skills without a plugin/marketplace, for Claude Code and/or Codex.
#
#   ./install.sh [claude|codex|all] [--project DIR] [--link] [--uninstall]
#   ./install.sh zip                 # build one zip per skill in dist/ (Claude.ai upload)
#
# Targets:
#   claude  ~/.claude/skills   (with --project: DIR/.claude/skills)
#   codex   ~/.agents/skills   (with --project: DIR/.agents/skills)
#   all     both (default)
set -euo pipefail

repo="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
skills_src="$repo/skills"

target=all
project=""
link=0
uninstall=0

usage() { sed -n '2,10p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'; exit "${1:-0}"; }

while [ $# -gt 0 ]; do
  case "$1" in
    claude|codex|all) target="$1" ;;
    zip) target=zip ;;
    --project) project="${2:?--project needs a directory}"; shift ;;
    --link) link=1 ;;
    --uninstall) uninstall=1 ;;
    -h|--help) usage ;;
    *) echo "unknown argument: $1" >&2; usage 1 ;;
  esac
  shift
done

if [ "$target" = zip ]; then
  mkdir -p "$repo/dist"
  for dir in "$skills_src"/*/; do
    name="$(basename "$dir")"
    rm -f "$repo/dist/$name.zip"
    (cd "$skills_src" && zip -qr "$repo/dist/$name.zip" "$name" -x '*.DS_Store')
    echo "built dist/$name.zip"
  done
  exit 0
fi

dest_for() {
  local base="${project:-$HOME}"
  case "$1" in
    claude) echo "$base/.claude/skills" ;;
    codex)  echo "$base/.agents/skills" ;;
  esac
}

install_into() {
  local dest="$1"
  mkdir -p "$dest"
  for dir in "$skills_src"/*/; do
    name="$(basename "$dir")"
    rm -rf "${dest:?}/$name"
    if [ "$uninstall" = 1 ]; then
      echo "removed $dest/$name"
    elif [ "$link" = 1 ]; then
      ln -s "${dir%/}" "$dest/$name"
      echo "linked  $dest/$name -> ${dir%/}"
    else
      cp -R "${dir%/}" "$dest/$name"
      echo "copied  $dest/$name"
    fi
  done
}

case "$target" in
  all) install_into "$(dest_for claude)"; install_into "$(dest_for codex)" ;;
  *)   install_into "$(dest_for "$target")" ;;
esac

[ "$uninstall" = 1 ] || echo "Done. Restart Claude Code / Codex if the skills don't show up."
