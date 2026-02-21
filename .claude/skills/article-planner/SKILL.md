---
name: article-planner
description: >
  Qiita技術記事の企画・構成支援スキル。テーマを入力すると想定読者のペルソナを複数提案し、
  選択したペルソナに合わせた記事構成案を作成する。
  トリガー: 「記事を書きたい」「記事の企画」「テーマから構成を考えたい」「ペルソナを考えたい」
  「article-planner」「/article-planner」などの発話時に使用する。
---

# Article Planner

Qiita技術記事のテーマからペルソナ提案→構成案作成までを支援する。

## ワークフロー

1. テーマ受領 → ペルソナ提案（3つ）
2. ペルソナ選択 → YAML保存
3. 構成案提案 → ブラッシュアップ
4. 構成案確定

## Step 1: ペルソナ提案

ユーザーからテーマを受け取り、3つのペルソナを提案する。

各ペルソナには以下を含める:
- **name**: 短い呼称（例: "Startup CTO"）
- **role**: 具体的な役割
- **company_stage / team_size**: 組織の文脈
- **current_state**: 現在の知識・経験レベル
- **pains**: テーマに関する課題・悩み
- **goals**: 記事に期待すること
- **search_keywords**: 検索しそうなキーワード（3-5個）
- **expectations_for_article**: 記事への具体的な期待
- **success_definition**: 記事を読んだ後の成功状態

ペルソナはprimary（優先度0.7）、secondary（0.2）、tertiary（0.1）の3段階で提案する。

提案時はAskUserQuestionで選択肢として提示し、各ペルソナの概要がわかるようにする。

## Step 2: ペルソナ保存

選択されたペルソナ情報を `articles/personas.yml` に保存する。
既存ファイルがある場合は上書き確認を行う。

YAML形式は [references/persona-schema.md](references/persona-schema.md) を参照。

## Step 3: 構成案提案

選択したペルソナに基づき、以下を考慮して構成案を提案する:

- ペルソナの **current_state** に合わせた前提知識の設定
- ペルソナの **pains** を解決する内容構成
- ペルソナの **expectations_for_article** を満たすセクション配置
- ペルソナの **dislikes** に該当する内容の回避

構成案のフォーマット:
```
## 記事タイトル案
[タイトル候補を2-3案]

## 想定タグ
[Qiitaタグを3-5個]

## 構成
1. セクション名 - 概要（想定文字数）
2. セクション名 - 概要（想定文字数）
...

## 記事戦略
- target_persona: [選択ペルソナ]
- tone: [文体方針]
- structure_principle: [構成原則]
- must_have: [必須要素]
- avoid: [避けるべき要素]
```

構成案を提示し、ユーザーのフィードバックを受けてブラッシュアップする。

## Step 4: 構成案確定

ユーザーが構成案に合意したら、`articles/personas.yml` の `article_strategy` セクションを更新する。

構成案確定後、記事の執筆は別途行う旨を伝える。
