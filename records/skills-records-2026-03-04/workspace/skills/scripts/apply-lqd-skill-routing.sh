#!/usr/bin/env bash
set -euo pipefail

write_yaml() {
  local path="$1"
  local content="$2"
  mkdir -p "$(dirname "$path")"
  printf "%s\n" "$content" > "$path"
}

PETER_YAML="$(cat <<'YAML'
interface:
  display_name: "Peter Learning"
  short_description: "统一运维排障、变更治理与Trilium日志执行技能"
  default_prompt: "Use $peterlearning and follow references/skill-selection-matrix.md to route task type before execution."
  brand_color: "#1D4ED8"
policy:
  allow_implicit_invocation: true
YAML
)"

SYSTEMATIC_PRIMARY="$(cat <<'YAML'
interface:
  display_name: "Systematic Debugging"
  short_description: "Primary debugging skill for root-cause-first fixes"
  default_prompt: "Use $systematic-debugging to investigate root cause before proposing fixes."
policy:
  allow_implicit_invocation: true
YAML
)"

SYSTEMATIC_ALIAS="$(cat <<'YAML'
interface:
  display_name: "Systematic Debugging (Deprecated Alias)"
  short_description: "Deprecated alias; use $systematic-debugging instead"
  default_prompt: "This alias is deprecated. Use $systematic-debugging for all normal debugging tasks."
policy:
  allow_implicit_invocation: false
YAML
)"

# Ensure legacy duplicate alias links are removed if present.
[ -L /home/lqd/.codex/skills/self-improvexxxx ] && unlink /home/lqd/.codex/skills/self-improvexxxx || true
[ -L /home/lqd/.agents/skills/self-improvexxxx ] && unlink /home/lqd/.agents/skills/self-improvexxxx || true

# Peterlearning in both homes.
write_yaml /home/lqd/.codex/skills/peterlearning/agents/openai.yaml "$PETER_YAML"
write_yaml /home/lqd/.agents/skills/peterlearning/agents/openai.yaml "$PETER_YAML"

# Primary debugging metadata.
if [ -d /home/lqd/.codex/skills/systematic-debugging ]; then
  write_yaml /home/lqd/.codex/skills/systematic-debugging/agents/openai.yaml "$SYSTEMATIC_PRIMARY"
fi
if [ -d /home/lqd/.agents/skills/systematic-debugging ]; then
  write_yaml /home/lqd/.agents/skills/systematic-debugging/agents/openai.yaml "$SYSTEMATIC_PRIMARY"
fi

# Alias routing metadata.
if [ -d /home/lqd/.codex/skills/superpowers-systematic-debugging ]; then
  write_yaml /home/lqd/.codex/skills/superpowers-systematic-debugging/agents/openai.yaml "$SYSTEMATIC_ALIAS"
fi
if [ -d /home/lqd/.agents/skills/superpowers-systematic-debugging ]; then
  write_yaml /home/lqd/.agents/skills/superpowers-systematic-debugging/agents/openai.yaml "$SYSTEMATIC_ALIAS"
fi

echo "routing applied"
