#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"
REF_DIR="$ROOT_DIR/skills/references"
DATE_NOW="$(date +%F)"
REPORT_PATH="${1:-$REF_DIR/metadata-audit-$DATE_NOW.md}"

HOMES=(
  "/home/lqd/.codex/skills"
  "/home/lqd/.agents/skills"
)

mkdir -p "$REF_DIR"

tmp_rows="$(mktemp)"
tmp_missing="$(mktemp)"
tmp_duplicates="$(mktemp)"
trap 'rm -f "$tmp_rows" "$tmp_missing" "$tmp_duplicates"' EXIT

total=0
with_meta=0
missing_meta=0
missing_policy=0

while IFS= read -r skill_md; do
  skill_dir="$(dirname "$skill_md")"
  home_dir="$(dirname "$skill_dir")"
  skill_name="$(basename "$skill_dir")"
  meta_file="$skill_dir/agents/openai.yaml"

  total=$((total + 1))
  has_meta="yes"
  policy_value="missing"

  if [ -f "$meta_file" ]; then
    with_meta=$((with_meta + 1))
    policy_value="$(sed -nE 's/^[[:space:]]*allow_implicit_invocation:[[:space:]]*(true|false).*/\1/p' "$meta_file" | head -n 1 || true)"
    [ -z "$policy_value" ] && policy_value="missing"
    if [ "$policy_value" = "missing" ]; then
      missing_policy=$((missing_policy + 1))
    fi
  else
    has_meta="no"
    missing_meta=$((missing_meta + 1))
    missing_policy=$((missing_policy + 1))
    echo "- \`$home_dir/$skill_name\` missing \`agents/openai.yaml\`" >> "$tmp_missing"
  fi

  hash_value="$(sha256sum "$skill_md" | awk '{print $1}')"
  printf "%s\t%s\t%s\t%s\t%s\n" "$home_dir" "$skill_name" "$has_meta" "$policy_value" "$hash_value" >> "$tmp_rows"
done < <(
  for home in "${HOMES[@]}"; do
    [ -d "$home" ] || continue
    find "$home" -mindepth 1 -maxdepth 2 -type f -name SKILL.md
  done | sort
)

# Find duplicate content only when distinct skill names share same hash.
awk -F'\t' '
{
  hash=$5
  name=$2
  key=hash SUBSEP name
  if (!(key in seen_name_hash)) {
    seen_name_hash[key]=1
    if (names[hash] == "") {
      names[hash]=name
    } else {
      names[hash]=names[hash] "," name
    }
    count[hash]++
  }
}
END {
  for (h in count) {
    if (count[h] > 1) {
      print h "\t" names[h]
    }
  }
}
' "$tmp_rows" | while IFS=$'\t' read -r hash_value names; do
  [ -n "$hash_value" ] || continue
  echo "- hash \`$hash_value\`: \`$names\`" >> "$tmp_duplicates"
done

# Specific precedence checks.
systematic_policy="$(awk -F'\t' '$2=="systematic-debugging" {print $4; exit}' "$tmp_rows")"
alias_policy="$(awk -F'\t' '$2=="superpowers-systematic-debugging" {print $4; exit}' "$tmp_rows")"
[ -z "$systematic_policy" ] && systematic_policy="not-found"
[ -z "$alias_policy" ] && alias_policy="not-found"

policy_ok="yes"
if [ "$systematic_policy" != "true" ] || [ "$alias_policy" != "false" ]; then
  policy_ok="no"
fi

cat > "$REPORT_PATH" <<EOF
# Skills Metadata Audit ($DATE_NOW)

## Scope
- Checked homes:
  - \`/home/lqd/.codex/skills\`
  - \`/home/lqd/.agents/skills\`
- Criterion: directories containing \`SKILL.md\`.

## Summary
- Skills found: \`$total\`
- With \`agents/openai.yaml\`: \`$with_meta\`
- Missing metadata files: \`$missing_meta\`
- Missing \`allow_implicit_invocation\`: \`$missing_policy\`
- Precedence policy check (\`systematic-debugging=true\`, \`superpowers-systematic-debugging=false\`): **$policy_ok**

## Missing Metadata
EOF

if [ -s "$tmp_missing" ]; then
  cat "$tmp_missing" >> "$REPORT_PATH"
else
  echo "- none" >> "$REPORT_PATH"
fi

cat >> "$REPORT_PATH" <<EOF

## Duplicate Content (Different Names)
EOF

if [ -s "$tmp_duplicates" ]; then
  cat "$tmp_duplicates" >> "$REPORT_PATH"
else
  echo "- none" >> "$REPORT_PATH"
fi

cat >> "$REPORT_PATH" <<EOF

## Policy Snapshot
- \`systematic-debugging\`: \`$systematic_policy\`
- \`superpowers-systematic-debugging\`: \`$alias_policy\`

## Raw Rows
\`\`\`tsv
home	skill	has_meta	allow_implicit_invocation	skill_sha256
$(cat "$tmp_rows")
\`\`\`
EOF

echo "report: $REPORT_PATH"
