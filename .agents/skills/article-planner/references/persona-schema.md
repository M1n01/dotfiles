# Persona YAML Schema

`articles/personas.yml` に保存するペルソナ定義のスキーマ。

## 構造

```yaml
personas:
  primary:
    name: "短い呼称"
    role: "具体的な役割"
    age_range: "25-35"
    company_stage: "組織のステージ"
    team_size: "チーム規模"
    responsibilities:
      - 担当業務1
      - 担当業務2
    tech_stack:
      frontend: ["Next.js", "React"]
      backend: ["Node.js", "Go"]
      infra: ["Docker", "AWS"]
    current_state:
      - 現在の知識・経験1
      - 現在の知識・経験2
    pains:
      - 課題・悩み1
      - 課題・悩み2
    goals:
      - 目標1
      - 目標2
    search_keywords:
      - "検索キーワード1"
      - "検索キーワード2"
    expectations_for_article:
      - 記事への期待1
      - 記事への期待2
    dislikes:
      - 避けてほしい内容1
      - 避けてほしい内容2
    success_definition: "記事を読んだ後の成功状態"
    priority: 0.7

  secondary:
    # 同じ構造、priority: 0.2

  tertiary:
    # 同じ構造、priority: 0.1

article_strategy:
  target_persona: "primary"
  tone: "文体方針"
  structure_principle: "構成原則"
  must_have:
    - 必須要素1
    - 必須要素2
  avoid:
    - 避けるべき要素1
    - 避けるべき要素2
```

## フィールド説明

| フィールド | 必須 | 説明 |
|---|---|---|
| name | Yes | ペルソナの短い呼称 |
| role | Yes | 具体的な職種・役割 |
| age_range | No | 想定年齢層 |
| company_stage | No | 所属組織のステージ |
| team_size | No | チーム規模 |
| responsibilities | No | 担当業務リスト |
| tech_stack | No | 使用技術スタック |
| current_state | Yes | テーマに対する現在の知識・経験 |
| pains | Yes | テーマに関する課題・悩み |
| goals | Yes | 記事に期待する成果 |
| search_keywords | Yes | 検索しそうなキーワード |
| expectations_for_article | Yes | 記事への具体的な期待 |
| dislikes | No | 避けてほしい内容 |
| success_definition | Yes | 読了後の成功状態 |
| priority | Yes | 優先度（primary: 0.7, secondary: 0.2, tertiary: 0.1） |
