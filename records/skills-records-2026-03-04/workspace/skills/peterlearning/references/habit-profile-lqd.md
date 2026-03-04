# LQD Habit Profile

## Default Skill Routing
1. 日常任务统一先进入 `$peterlearning`。
2. 排障任务默认使用 `$systematic-debugging`。
3. `superpowers-systematic-debugging` 作为兼容别名：
- 不建议隐式触发
- 仅在历史流程或显式指定时使用
4. 任务类型自动路由：
- 先查 `references/skill-selection-matrix.md` 再选主技能。

## Execution Discipline
1. 任务开始前做 skill precheck。
2. 高风险动作必须先定义变更合约与回滚。
3. 任何“已完成”声明前必须验证证据。
4. 笔记日志按主/子结构写入 Trilium。

## Metadata Policy
- 主推荐技能：`allow_implicit_invocation: true`
- 别名/兼容技能：`allow_implicit_invocation: false`
- 每个技能都应有 `agents/openai.yaml`
