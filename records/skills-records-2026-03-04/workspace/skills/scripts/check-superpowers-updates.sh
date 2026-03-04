#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
REF_DIR="$ROOT_DIR/skills/references"
DATE_NOW="$(date +%F)"
REPORT_PATH="${1:-$REF_DIR/superpowers-update-assessment-$DATE_NOW.md}"

VENDOR_REPO="${VENDOR_REPO:-/home/lqd/.codex/skills/.vendor/superpowers}"
LOCAL_SKILLS_HOME="${LOCAL_SKILLS_HOME:-/home/lqd/.codex/skills}"
UPSTREAM_URL="${UPSTREAM_URL:-https://github.com/obra/superpowers.git}"
FORK_URL="${FORK_URL:-git@github.com:liqidong/superpowers.git}"

if [ ! -d "$VENDOR_REPO/.git" ]; then
  echo "missing vendor repo: $VENDOR_REPO"
  exit 1
fi

if [ ! -d "$LOCAL_SKILLS_HOME" ]; then
  echo "missing local skills home: $LOCAL_SKILLS_HOME"
  exit 1
fi

mkdir -p "$REF_DIR"

cd "$VENDOR_REPO"
git fetch origin --prune >/dev/null 2>&1

vendor_head="$(git rev-parse HEAD)"
vendor_origin_main="$(git rev-parse origin/main)"
upstream_main="$(git ls-remote "$UPSTREAM_URL" refs/heads/main | awk '{print $1}')"
fork_main="$(git ls-remote "$FORK_URL" refs/heads/main 2>/dev/null | awk '{print $1}' || true)"
[ -z "$fork_main" ] && fork_main="unavailable"

tmp_details="$(mktemp)"
trap 'rm -f "$tmp_details"' EXIT

total=0
in_sync=0
drift=0
missing=0

for upstream_skill_dir in "$VENDOR_REPO"/skills/*; do
  [ -d "$upstream_skill_dir" ] || continue
  skill_name="$(basename "$upstream_skill_dir")"
  total=$((total + 1))

  local_name="$skill_name"
  if [ "$skill_name" = "systematic-debugging" ] && [ -d "$LOCAL_SKILLS_HOME/superpowers-systematic-debugging" ]; then
    local_name="superpowers-systematic-debugging"
  fi

  local_dir="$LOCAL_SKILLS_HOME/$local_name"
  if [ ! -d "$local_dir" ]; then
    missing=$((missing + 1))
    {
      echo "- \`$skill_name\`: missing local dir (\`$local_dir\`)"
    } >> "$tmp_details"
    continue
  fi

  diff_out="$(diff -qr --exclude='agents' "$upstream_skill_dir" "$local_dir" || true)"
  if [ -z "$diff_out" ]; then
    in_sync=$((in_sync + 1))
    continue
  fi

  drift=$((drift + 1))
  {
    echo "- \`$skill_name\` -> \`$local_name\`: drift detected"
    echo ""
    echo "  Diff:"
    echo '  ```'
    printf '%s\n' "$diff_out" | sed 's/^/  /'
    echo '  ```'
    echo ""
  } >> "$tmp_details"
done

status_line="in-sync"
if [ "$vendor_origin_main" != "$upstream_main" ] || [ "$drift" -gt 0 ] || [ "$missing" -gt 0 ]; then
  status_line="action-needed"
fi

cat > "$REPORT_PATH" <<EOF
# Superpowers Skill Update Assessment ($DATE_NOW)

## Scope
- Upstream repo: \`$UPSTREAM_URL\`
- User fork: \`$FORK_URL\`
- Local vendor: \`$VENDOR_REPO\`
- Local skills home: \`$LOCAL_SKILLS_HOME\`

## Baseline
- Upstream \`main\`: \`$upstream_main\`
- Fork \`main\`: \`$fork_main\`
- Vendor \`HEAD\`: \`$vendor_head\`
- Vendor \`origin/main\`: \`$vendor_origin_main\`

## Summary
- Status: **$status_line**
- Upstream skills scanned: \`$total\`
- In sync: \`$in_sync\`
- Drift: \`$drift\`
- Missing local copies: \`$missing\`

## Details
EOF

if [ -s "$tmp_details" ]; then
  cat "$tmp_details" >> "$REPORT_PATH"
else
  echo "- No skill content drift found (excluding local \`agents/openai.yaml\` metadata)." >> "$REPORT_PATH"
fi

echo "report: $REPORT_PATH"
