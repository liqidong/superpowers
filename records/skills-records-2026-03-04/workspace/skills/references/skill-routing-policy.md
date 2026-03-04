# Skill Routing Policy

## Goal
Reduce trigger ambiguity when different homes contain similarly named or duplicated skills.

## Routing Rules
1. Keep one primary name per capability, with implicit invocation enabled.
2. Keep aliases only for backward compatibility, and disable implicit invocation for aliases.
3. Keep `agents/openai.yaml` for all active skills to ensure stable discovery and trigger behavior.
4. If two skills have same content but different names, keep only one as primary and document alias status.

## Current Decisions
1. Debugging capability
- Primary: `systematic-debugging`
- Alias: `superpowers-systematic-debugging` (deprecated alias)
- Policy:
  - `systematic-debugging`: `allow_implicit_invocation: true`
  - `superpowers-systematic-debugging`: `allow_implicit_invocation: false`

2. Personal operations capability
- Primary: `peterlearning`
- Policy:
  - `peterlearning`: `allow_implicit_invocation: true`

## Maintenance Workflow
1. Run upstream drift check:
```bash
bash skills/scripts/check-superpowers-updates.sh
```

2. Run metadata audit:
```bash
bash skills/scripts/audit-skills-metadata.sh
```

3. If either report shows `action-needed` or policy mismatch:
- Update skill content from upstream (where applicable).
- Re-apply routing metadata via:
```bash
bash skills/scripts/apply-lqd-skill-routing.sh
```
- Re-run both checks and keep reports under `skills/references/`.
