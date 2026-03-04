# Skills Metadata Audit (2026-03-04)

## Scope
- Checked homes:
  - `/home/lqd/.codex/skills`
  - `/home/lqd/.agents/skills`
- Criterion: directories containing `SKILL.md`.

## Summary
- Skills found: `43`
- With `agents/openai.yaml`: `43`
- Missing metadata files: `0`
- Missing `allow_implicit_invocation`: `0`
- Precedence policy check (`systematic-debugging=true`, `superpowers-systematic-debugging=false`): **yes**

## Missing Metadata
- none

## Duplicate Content (Different Names)
- hash `4999cb851360485eca5074e727bbdd62ef20549c5d5b01216fcbf5831badb473`: `systematic-debugging,superpowers-systematic-debugging`

## Policy Snapshot
- `systematic-debugging`: `true`
- `superpowers-systematic-debugging`: `false`

## Raw Rows
```tsv
home	skill	has_meta	allow_implicit_invocation	skill_sha256
/home/lqd/.agents/skills	aliyun-cli	yes	true	fd86f70cf77f53255c716ee011a3c9d5914065d5615c7d947ef43c4764ea4465
/home/lqd/.agents/skills	api-design-principles	yes	true	fa44aba6c2687e281dbd400de3c1bf81d24cd1d9ffa34532c652b90e6fb63ecd
/home/lqd/.agents/skills	code-review-excellence	yes	true	a765bd62c6ee22eab0cb56e96b5a811b49a9b4dfc1f85a86776aa1d3d6e87532
/home/lqd/.agents/skills	comfyui-video-pipeline	yes	true	d18b36a403f32cc92bda646216ded808d59bc5b233d264f02b347f635d0be23c
/home/lqd/.agents/skills	debugging-strategies	yes	false	895534dc870b4999e5b847edce6833cebf8f8b5cbe007112b0b76d70251a6bb1
/home/lqd/.agents/skills	devops-engineer	yes	true	e7b62bb77e956fb542a86a665fdb54373955d1bc2c564b6169e9d17185e21a68
/home/lqd/.agents/skills	docker-compose-networking	yes	true	eb5a4ee0f0280effc89dd3a86fd71c899b6b9d9ae410d2b4c42e4beedf1a44e8
/home/lqd/.agents/skills	docker-expert	yes	false	2926002ab31798c369a16aa345d37f0974265c6433e1ad863f5e7d3f1751c4d3
/home/lqd/.agents/skills	find-skills	yes	true	54b44dc9539df865fbb060f62fb062e8232e765852a0cf14c38301fe0c1eb264
/home/lqd/.agents/skills	git-advanced-workflows	yes	true	4f24b80d9babde64e4a1beaefdda065f5bb0953acc6a547fa7a3078faf8c41cd
/home/lqd/.agents/skills	hybrid-cloud-networking	yes	false	fd0caa450d2fab6f4b0d3c93acafc5291d3a461c6cf346947bb0b8cab08e5353
/home/lqd/.agents/skills	javascript-testing-patterns	yes	true	5fc959e9123e50ef9db6f82aceda08fa5d40011e8ce48a2d7332a1c80d98c336
/home/lqd/.agents/skills	networking	yes	true	1a1223f8ea113d01345d830df0d0d1c1207780183d9ba0320a92e7f5a64793ea
/home/lqd/.agents/skills	parallel-debugging	yes	false	31b6e288504f465cfecb2ff18ec014a836448a246f61f7a8e10c5462df5520d4
/home/lqd/.agents/skills	peterlearning	yes	true	a40bd865f1938bdb6f84239a480a0c5424c6ba8e622f56250765afa5449a25f0
/home/lqd/.agents/skills	self-improvement	yes	true	6234697e11dba69808d105f9cf9c96879a23301a707ceb37f0a0ae50fa2e381b
/home/lqd/.agents/skills	stable-diffusion-image-generation	yes	true	816dce0d04b2e2ddc1510a5aaf3e545778f4c59f7329af689dc9941bbbebca37
/home/lqd/.agents/skills	style-transfer	yes	true	f33788e41aa0a45617261d6a57d6bdabd559bb808da9eb69d9df40f4acf87b28
/home/lqd/.agents/skills	systematic-debugging	yes	true	4999cb851360485eca5074e727bbdd62ef20549c5d5b01216fcbf5831badb473
/home/lqd/.agents/skills	tailscale	yes	true	57badbe8b6cdfa350c0b6c84edff8f76d6e17f7dd8bc947f1d4f650575ab4861
/home/lqd/.agents/skills	vhs	yes	true	c60bed0d2bec9bba9083eece5996e0cfa07cc5244e1621f55b9cbc32787ab0d1
/home/lqd/.agents/skills	visual-regression-testing	yes	true	a8e7ce71e6f6d88fb76bf579a222c9638b424df4c1224d863a714ae2a5a0fa42
/home/lqd/.agents/skills	vpn	yes	true	e62bd5903cf54eb615cd7378c4f33adfb1bcd2c93c726f4167985728024b91ea
/home/lqd/.codex/skills	brainstorming	yes	true	7a238df1ebf0656c1da199aafafcc78c42f47bf4e56dd4e007a67afbb10af455
/home/lqd/.codex/skills	debugging-strategies	yes	false	895534dc870b4999e5b847edce6833cebf8f8b5cbe007112b0b76d70251a6bb1
/home/lqd/.codex/skills	devops-engineer	yes	true	e7b62bb77e956fb542a86a665fdb54373955d1bc2c564b6169e9d17185e21a68
/home/lqd/.codex/skills	dispatching-parallel-agents	yes	true	c628917689ccc12ce9991615db6824d44c4fe71f8427cd959560aebe6a1a6476
/home/lqd/.codex/skills	docker-expert	yes	false	2926002ab31798c369a16aa345d37f0974265c6433e1ad863f5e7d3f1751c4d3
/home/lqd/.codex/skills	executing-plans	yes	true	d099fa42fd7518f4dafa9f2d51c1c08fce970490d57682b6acd3e7a57bb55b52
/home/lqd/.codex/skills	finishing-a-development-branch	yes	true	dd2f82c6dc8582b621f9eb57fcb65f557f88eadf872727ac81d0840ae12c504e
/home/lqd/.codex/skills	hybrid-cloud-networking	yes	false	fd0caa450d2fab6f4b0d3c93acafc5291d3a461c6cf346947bb0b8cab08e5353
/home/lqd/.codex/skills	parallel-debugging	yes	false	31b6e288504f465cfecb2ff18ec014a836448a246f61f7a8e10c5462df5520d4
/home/lqd/.codex/skills	peterlearning	yes	true	a40bd865f1938bdb6f84239a480a0c5424c6ba8e622f56250765afa5449a25f0
/home/lqd/.codex/skills	receiving-code-review	yes	true	c9382e92b8f32363566068ecfed19d3b2651eaf40d3942b24840f839dedfc406
/home/lqd/.codex/skills	requesting-code-review	yes	true	2da31af22a58938ab78f3ee6d5b4687fcca062b923b646459eb52ba72117ef97
/home/lqd/.codex/skills	subagent-driven-development	yes	true	994b89a5d294eadd6a1611edb51377bac748d5f5fb7f4139d3c736b616b3a46a
/home/lqd/.codex/skills	superpowers-systematic-debugging	yes	false	4999cb851360485eca5074e727bbdd62ef20549c5d5b01216fcbf5831badb473
/home/lqd/.codex/skills	test-driven-development	yes	true	7dee67b4af6bdccc7a914ca34533184d64592d0f5b23aeae631538168db14994
/home/lqd/.codex/skills	using-git-worktrees	yes	true	de9dcde34840eee074047ec327d4ea6ca4954c5a73a6d874dc48f25fe46c9e7c
/home/lqd/.codex/skills	using-superpowers	yes	true	07d73726944e38fac59b9c90d876e0f714e395308b357973ae77b1321fc75067
/home/lqd/.codex/skills	verification-before-completion	yes	true	ea52d15aabaf72bc6b558efe2c126f161b53961090ddcd712000273bfe8c7b6c
/home/lqd/.codex/skills	writing-plans	yes	true	8a9198d4d9efbcad6e019b17c422c182113062c864b6154ec2a3ba2ed0b6b9d0
/home/lqd/.codex/skills	writing-skills	yes	true	d83a09d6a1c6976f6cc2f40addeae653a4a6eb5903097ebc365d90242e00e379
```
