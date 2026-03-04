# Skill Selection Matrix

## 使用方式
1. 先识别任务类型。
2. 按表选择 `Primary`。
3. 若复杂度上升，再叠加 `Secondary`。
4. 执行前确认验证与回滚要求。

## 任务类型 -> 推荐技能

| 任务类型 | Primary | Secondary | 触发条件 |
|---|---|---|---|
| 日常基础设施任务（ECS/NAS/FRP） | `peterlearning` | `devops-engineer` | 需要统一执行与记录 |
| 故障排查（一般） | `systematic-debugging` | `debugging-strategies` | 报错、异常、回归失败 |
| 故障排查（多假设并行） | `systematic-debugging` | `parallel-debugging` | 问题跨模块、根因不唯一 |
| Docker 容器优化与排障 | `peterlearning` | `docker-expert` | Dockerfile/Compose/镜像优化 |
| 混合网络与跨环境连通 | `peterlearning` | `hybrid-cloud-networking` | on-prem <-> cloud 连接设计 |
| CI/CD 与 IaC 变更 | `devops-engineer` | `peterlearning` | 流水线、发布、Terraform |
| 日志总结与 Trilium 上传 | `peterlearning` | `verification-before-completion` | 当天收尾与知识沉淀 |
| 任务设计与拆解 | `brainstorming` | `writing-plans` | 需求不清或任务较复杂 |
| 完成前验收 | `verification-before-completion` | `peterlearning` | 声明完成前必须验证 |

## 默认优先级规则
- `Primary` 与现有默认冲突时，优先：
  1. `peterlearning`
  2. `systematic-debugging`
  3. 其他 `Secondary`
- 标记为 secondary 的技能默认显式调用（`allow_implicit_invocation: false`）。

## 快速决策
- 看不清任务类型：先用 `peterlearning`。
- 出现 bug：立刻切 `systematic-debugging`。
- 涉及发布/流水线：切 `devops-engineer`。
