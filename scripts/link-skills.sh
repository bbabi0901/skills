#!/usr/bin/env bash
set -euo pipefail

# Dev-only: symlink every skill (except in-progress/ and deprecated/) into the
# local harness skill directories so a `git pull` keeps them current.
#   ~/.claude/skills  Claude Code
#   ~/.agents/skills  Codex and other Agent Skills-compatible harnesses
# Pass --all to include in-progress/ as well.

REPO="$(cd "$(dirname "$0")/.." && pwd)"
DESTS=("$HOME/.claude/skills" "$HOME/.agents/skills")
EXCLUDE=(-not -path '*/deprecated/*')
[ "${1:-}" = "--all" ] || EXCLUDE+=(-not -path '*/in-progress/*')

while IFS= read -r -d '' skill_md; do
  src="$(dirname "$skill_md")"
  name="$(basename "$src")"
  for DEST in "${DESTS[@]}"; do
    mkdir -p "$DEST"
    target="$DEST/$name"
    [ -e "$target" ] && [ ! -L "$target" ] && rm -rf "$target"
    ln -sfn "$src" "$target"
    echo "linked $name -> $src ($DEST)"
  done
done < <(find "$REPO/skills" -name SKILL.md "${EXCLUDE[@]}" -print0)
