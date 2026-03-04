# PeterLearning Skills Pack

本目录当前只保留一个统一技能：`peterlearning`。

## Skills
- `peterlearning`

## 说明
- 旧 `lqd` 学习模式已停用，已做有用内容提炼。
- 安装方式是“复制安装”，不使用软链接。

## 合并学习
见：`references/merged-learning-matrix.md`

## 维护检查
每周至少执行一次：

```bash
bash skills/scripts/check-superpowers-updates.sh
bash skills/scripts/audit-skills-metadata.sh
```

执行后会在 `skills/references/` 生成当日报告。

策略说明见：`references/skill-routing-policy.md`

可选定时任务（每周一 09:00）：

```cron
0 9 * * 1 cd /data/liqidong/codex/nas && bash skills/scripts/check-superpowers-updates.sh && bash skills/scripts/audit-skills-metadata.sh
```

## 打包
运行：
```bash
bash skills/scripts/package-skills.sh
```

产物输出：
- `artifacts/peterlearning-skills-pack-YYYY-MM-DD.tar.gz`
- `artifacts/peterlearning-skills-pack-YYYY-MM-DD.tar.gz.sha256`
