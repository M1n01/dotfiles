# Kiro CLI pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.pre.zsh"
# terminal
cdls ()
{
    \cd "$@" && ls
}

# ls
export LSCOLORS=gxfxcxdxbxegedabagacad

# ローカルの設定を読み込み
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

[ -f ~/.zsh/rc/alias.zsh ] && source ~/.zsh/rc/alias.zsh

# Kiro CLI post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/kiro-cli/shell/zshrc.post.zsh"

# Added by Antigravity
export PATH="/Users/abeminato/.antigravity/antigravity/bin:$PATH"

# Added by Antigravity
export PATH="/Users/abeminato/.antigravity/antigravity/bin:$PATH"

# bun completions
[ -s "/Users/abeminato/.bun/_bun" ] && source "/Users/abeminato/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

alias claude-mem='/Users/abeminato/.bun/bin/bun "/Users/abeminato/.claude/plugins/marketplaces/thedotmack/plugin/scripts/worker-service.cjs"'
