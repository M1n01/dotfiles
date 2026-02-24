---
name: fix-pr
description: 対象のGitHubのPRからコメントを確認し、ソースの修正案を提示する。
disable-model-invocation: true
allowed-tools: Read, Grep, Bash(gh api), Bash(gh view pr)
---

GitHub PR: $ARGUMENTS のレビューコメントを取得し、ソースの修正案を提案する。

1. `gh pr view` を使用し、PRの本文およびコメントを取得する
2. 変更差分を確認し、コメントで指摘された問題点を理解する。
3. 修正案を`fix-pr-${ARGUMENTS}.md`として出力する。

