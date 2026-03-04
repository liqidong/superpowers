# Skills Metadata Audit (2026-03-04)

## Scope
- Checked both skill homes:
  - `/home/lqd/.codex/skills`
  - `/home/lqd/.agents/skills`
- Criterion: skill directory contains `SKILL.md`.

## Result
- Unique physical skills: `43`
- Skills with `agents/openai.yaml`: `43`
- Missing metadata: `0`

## Duplicate Review
1. `systematic-debugging` and `superpowers-systematic-debugging`
- Status: 内容完全一致（同一 `SKILL.md` 文本）。
- Decision: 保留两者（兼容现有引用），并已完成主/别名路由：
  - `systematic-debugging`: `allow_implicit_invocation: true`（主推荐）
  - `superpowers-systematic-debugging`: `allow_implicit_invocation: false`（Deprecated Alias）

2. `peterlearning`
- Status: 在两个技能目录各有一份（复制安装）。
- Decision: 保留（符合“本地一份 + skill 目录一份，不做链接”的要求）。

3. `self-improvexxxx`
- Status: 历史别名，重复指向 `self-improvement`。
- Decision: 已移除该别名，避免重复触发。

## Metadata Strategy (Current)
- 为所有有效技能补齐了 `openai.yaml`，统一包含：
  - `interface.display_name`
  - `interface.short_description`
  - `interface.default_prompt`
  - `policy.allow_implicit_invocation`（按路由策略为 `true` 或 `false`）

## External Whitelist Routing
- 新增外部技能（来自 skills 商店）并完成路由：
  - `debugging-strategies`: secondary (`allow_implicit_invocation: false`)
  - `parallel-debugging`: secondary (`allow_implicit_invocation: false`)
  - `hybrid-cloud-networking`: secondary (`allow_implicit_invocation: false`)
  - `docker-expert`: secondary (`allow_implicit_invocation: false`)
  - `devops-engineer`: enabled (`allow_implicit_invocation: true`)

## Recommendation
- 全量元数据是好的：检索更准、触发更稳、列表可读性更高。
- 但要维护质量：
  - 描述保持“何时使用”，避免写成长流程。
  - 对“同内容多名字”的技能设置主推荐名，降低歧义。
  - 新增技能时强制带元数据，不再补丁式追补。
