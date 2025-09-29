
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
