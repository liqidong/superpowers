---
name: peterlearning
description: Use when handling daily infrastructure tasks, debugging, and Trilium journaling with one practical workflow that emphasizes evidence, rollback, and concise summaries.
---

# PeterLearning

## Overview
`peterlearning` 是你当前日常生产任务的统一技能入口，合并了：
- 快速原型
- 变更合约
- 证据排障
- 主子日志
- 技能沉淀

并吸收了旧 `lqd` 的有效经验，但不再采用“持续累加规则库”的管理形式。

## When to Use
- 每日运维/部署/配置变更任务
- 排障与修复
- 当天笔记日志（Trilium）更新
- 需要把重复流程沉淀为可复用操作

## Core Workflow
1. Define: 写清目标、边界、最小成功标准。
2. Prototype: 先做最小可运行版本。
3. Contract: 高风险动作前写执行合约（退出条件+回滚）。
4. Debug: 出问题时走证据回路，一次只改一个变量。
5. Journal: 主日志写结论，子笔记写全过程。
6. Package: 重复流程升级为技能/脚本。

## Habit Defaults (LQD)
- 默认主入口：`$peterlearning`
- 默认调试主技能：`$systematic-debugging`
- `superpowers-systematic-debugging` 仅作为兼容别名，不作为默认隐式触发。
- 每次任务执行前先做技能预检查，再执行动作。
- 任务类型自动路由见：`references/skill-selection-matrix.md`

## Trilium Rule
- 当用户说“笔记日志”时，默认走：
  - 主日志：简洁结论
  - 子笔记：详细过程
- 先写详细子笔记，再回填主日志。

## Quick Checks
- 是否有可执行验证命令。
- 是否有明确回滚路径。
- 是否保留了关键证据。
- 主日志是否 1 分钟可读懂。

## References
- 详细流程：`references/workflows.md`
- 旧 lqd 提炼：`references/lqd-digest.md`
- 习惯路由：`references/habit-profile-lqd.md`
- 自动选技表：`references/skill-selection-matrix.md`
