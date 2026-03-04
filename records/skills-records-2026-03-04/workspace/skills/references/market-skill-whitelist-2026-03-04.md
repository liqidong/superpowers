# Market Skill Whitelist (2026-03-04)

## Goal
在不破坏现有 `peterlearning` 习惯路由的前提下，引入高相关外部技能。

## Search Sources
- Skills directory: https://skills.sh/
- CLI search used: `npx skills find <query>`

## Selected Skills
1. `debugging-strategies`
- Source: `wshobson/agents`
- Store: https://skills.sh/wshobson/agents/debugging-strategies
- Route: secondary (`allow_implicit_invocation: false`)

2. `parallel-debugging`
- Source: `wshobson/agents`
- Store: https://skills.sh/wshobson/agents/parallel-debugging
- Route: secondary (`allow_implicit_invocation: false`)

3. `hybrid-cloud-networking`
- Source: `wshobson/agents`
- Store: https://skills.sh/wshobson/agents/hybrid-cloud-networking
- Route: secondary (`allow_implicit_invocation: false`)

4. `docker-expert`
- Source: `sickn33/antigravity-awesome-skills`
- Store: https://skills.sh/sickn33/antigravity-awesome-skills/docker-expert
- Route: secondary (`allow_implicit_invocation: false`)

5. `devops-engineer`
- Source: `jeffallan/claude-skills`
- Store: https://skills.sh/jeffallan/claude-skills/devops-engineer
- Route: enabled (`allow_implicit_invocation: true`)

## Conflict Routing Policy
- Keep `peterlearning` as primary habit entry.
- Keep `systematic-debugging` as primary debugging skill.
- New external debugging/networking skills are explicit-only to avoid route collisions.
- Enable only one broader external skill (`devops-engineer`) for implicit invocation.

## Installation Method
- `npx skills add` had repeated clone timeout on this network.
- Final method uses path-based installer:
  - `/home/lqd/.codex/skills/.system/skill-installer/scripts/install-skill-from-github.py`
- Copy-install to both homes (no symlink):
  - `/home/lqd/.codex/skills`
  - `/home/lqd/.agents/skills`

## Reapply Command
```bash
bash /data/liqidong/codex/nas/skills/scripts/install-whitelisted-market-skills.sh
```
