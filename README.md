# dotfiles
dotfilesとは、ユーザーの設定ファイルを管理するためのリポジトリです。

## 目次

- [dotfiles](#dotfiles)
	- [目次](#目次)
	- [Usage](#usage)
	- [参考](#参考)

## Usage
```
git clone git@github.com:M1n01/dotfiles.git

cd dotfiles

# インストール
./.bin/install.sh

# 共通・Codex固有の指示を ~/.codex/AGENTS.md へ同期
./.bin/sync-agent-instructions.sh

# 書き込まずに同期状態を確認
./.bin/sync-agent-instructions.sh --check

# vscodeの設定をインストール
./.bin/setup-vscode.sh
```

## AIエージェント共通設定

共通指示は `.agents/common.md`、ツール固有の指示は
`.agents/codex.md` と `.agents/claude.md` で管理します。

- Codex: `sync-agent-instructions.sh` が共通指示とCodex固有指示を結合し、
  `~/.codex/AGENTS.md` を生成します。
- Claude Code: `~/.claude/CLAUDE.md` から共通指示とClaude固有指示を
  `@` インポートします。

共通指示またはCodex固有指示を変更した後は、同期コマンドを再実行して
ください。`install.sh` 実行時にも自動で同期されます。

## 参考
- [ようこそdotfilesの世界へ](https://qiita.com/yutkat/items/c6c7584d9795799ee164)
- [zsh zshenv zshrc](https://qiita.com/shiro_usagi/items/09837eccb44c840942f1)
- [.zshrc.localのススメ](https://qiita.com/awakia/items/1d5cd440ce58ef4fb8ae)
- [Saving VS Code settings in your dotfiles](https://anhari.dev/blog/saving-vscode-settings-in-your-dotfiles)
