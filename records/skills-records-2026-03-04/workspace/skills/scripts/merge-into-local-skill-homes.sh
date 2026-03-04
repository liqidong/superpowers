#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
LOCAL_SKILLS_DIR="$ROOT_DIR/skills"
SKILL_NAME="peterlearning"
SKILL_SRC="$LOCAL_SKILLS_DIR/$SKILL_NAME"
DISABLED_DIR="/home/lqd/.codex/skills-disabled"

TARGETS=(
  "/home/lqd/.codex/skills"
  "/home/lqd/.agents/skills"
)

OLD_SKILLS=(
  "main-sub-log-trilium"
  "evidence-debug-loop"
  "agentic-change-contract"
  "prompt-to-prototype-loop"
  "skill-first-packaging"
  "nas-daily-production-system"
)

if [ ! -d "$SKILL_SRC" ]; then
  echo "missing source skill: $SKILL_SRC"
  exit 1
fi

# Disable lqd in codex home to stop old learning mode.
mkdir -p "$DISABLED_DIR"
if [ -d "/home/lqd/.codex/skills/lqd" ]; then
  mv "/home/lqd/.codex/skills/lqd" "$DISABLED_DIR/lqd-$(date +%F-%H%M%S)"
  echo "disabled: /home/lqd/.codex/skills/lqd"
fi

for target in "${TARGETS[@]}"; do
  mkdir -p "$target"
  echo "== target: $target"

  # Remove old split skills (symlink or copied dir)
  for old in "${OLD_SKILLS[@]}"; do
    if [ -e "$target/$old" ] || [ -L "$target/$old" ]; then
      rm -rf "$target/$old"
      echo "removed old: $target/$old"
    fi
  done

  # Copy install (no symlink)
  mkdir -p "$target/$SKILL_NAME"
  cp -a "$SKILL_SRC/." "$target/$SKILL_NAME/"
  echo "copied: $target/$SKILL_NAME"
  echo
done

# Apply routing preferences (primary/alias metadata and cleanup).
bash "$ROOT_DIR/skills/scripts/apply-lqd-skill-routing.sh"
