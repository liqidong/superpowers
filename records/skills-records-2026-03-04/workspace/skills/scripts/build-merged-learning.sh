#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
OUT="$ROOT_DIR/skills/references/merged-learning-report.md"
DATE_NOW="$(date +%F)"

CODEX_DIR="/home/lqd/.codex/skills"
AGENTS_DIR="/home/lqd/.agents/skills"
LOCAL_DIR="$ROOT_DIR/skills"

count_skills_with_skill_md() {
  local dir="$1"
  if [ -d "$dir" ]; then
    local count=0
    local entry
    for entry in "$dir"/*; do
      [ -e "$entry" ] || continue
      if [ -f "$entry/SKILL.md" ]; then
        count=$((count + 1))
      fi
    done
    echo "$count"
  else
    echo 0
  fi
}

COD_COUNT="$(count_skills_with_skill_md "$CODEX_DIR")"
AGENT_COUNT="$(count_skills_with_skill_md "$AGENTS_DIR")"
LOCAL_COUNT="$(count_skills_with_skill_md "$LOCAL_DIR")"

{
  echo "# Merged Learning Report"
  echo
  echo "生成时间：$DATE_NOW"
  echo
  echo "## Skill Inventory"
  echo "- ~/.codex/skills: $COD_COUNT"
  echo "- ~/.agents/skills: $AGENT_COUNT"
  echo "- repo local skills: $LOCAL_COUNT"
  echo
  echo "## Repo Local Skills"
  for entry in "$LOCAL_DIR"/*; do
    [ -e "$entry" ] || continue
    if [ -f "$entry/SKILL.md" ]; then
      basename "$entry" | sed 's/^/- /'
    fi
  done | sort
  echo
  echo "## Action"
  echo "- 使用 peterlearning 作为唯一入口技能。"
  echo "- 旧 lqd 模式已停用；保留经验已写入 peterlearning/references/lqd-digest.md。"
  echo "- 安装策略：本地一份 + 技能目录一份（复制安装，不做链接）。"
} > "$OUT"

echo "generated: $OUT"
