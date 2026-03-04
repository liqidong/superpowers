# PeterLearning Workflows

## 1) Prompt-to-Prototype
- 目标：最快拿到可运行原型。
- 步骤：目标描述 -> 最小实现 -> 运行 -> 纠偏 -> 冻结原型。
- 验收：满足最低可接受结果。

## 2) Agentic Change Contract
- 目标：高风险变更可控可回滚。
- 合约字段：Goal / Inputs / Steps / Exit / Rollback / Approval。
- 验收：每一步有验证，失败可回退。

## 3) Evidence Debug Loop
- 目标：避免误修复。
- 步骤：固定现象 -> 3个假设 -> 单变量实验 -> 记录结论。
- 验收：有根因证据链。

## 4) Main/Sub Log for Trilium
- 主日志：关键结果、关键决策、风险、明日动作。
- 子笔记：目标、步骤、命令、报错、修复、验证。
- 验收：主日志可速读，子笔记可复现。

## 5) Skill-First Packaging
- 目标：重复流程变复用资产。
- 产物：`SKILL.md + scripts + verification`。
- 验收：新人可按步骤复现。
