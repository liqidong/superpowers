#!/usr/bin/env bash
set -euo pipefail

INSTALLER="/home/lqd/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py"
CODEX_DEST="/home/lqd/.codex/skills"
AGENTS_DEST="/home/lqd/.agents/skills"

install_if_missing() {
  local name="$1"
  local repo="$2"
  local path="$3"

  if [ -d "$CODEX_DEST/$name" ]; then
    echo "skip existing (codex): $name"
  else
    python3 "$INSTALLER" --repo "$repo" --path "$path" --dest "$CODEX_DEST" --method download
  fi

  if [ -d "$AGENTS_DEST/$name" ]; then
    echo "skip existing (agents): $name"
  else
    mkdir -p "$AGENTS_DEST/$name"
    cp -a "$CODEX_DEST/$name/." "$AGENTS_DEST/$name/"
    echo "copied to agents: $name"
  fi
}

install_if_missing debugging-strategies wshobson/agents plugins/developer-essentials/skills/debugging-strategies
install_if_missing parallel-debugging wshobson/agents plugins/agent-teams/skills/parallel-debugging
install_if_missing hybrid-cloud-networking wshobson/agents plugins/cloud-infrastructure/skills/hybrid-cloud-networking
install_if_missing docker-expert sickn33/antigravity-awesome-skills skills/docker-expert
install_if_missing devops-engineer jeffallan/claude-skills skills/devops-engineer

# Apply metadata routing preferences.
bash /data/liqidong/codex/nas/skills/scripts/apply-market-skill-routing.sh

# Re-apply local habit routing (peterlearning + debugging alias policy).
bash /data/liqidong/codex/nas/skills/scripts/apply-lqd-skill-routing.sh

echo "whitelist install + routing complete"
