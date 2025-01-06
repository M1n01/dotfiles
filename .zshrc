# makefile
alias mk='make -j'
alias remake='make fclean && make -j'

# c
alias gccw='gcc -Wall -Wextra -Werror'

# c++
alias g++='g++ -std=c++11'

# git
alias g='git'
alias ga='git add'
## add
alias gap='git add -p'
alias ga.='git add .'
## commit
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
## merge
alias gm='git merge'
alias gms='git merge --squash'
## checkout
alias gco='git switch'
alias gcb='git switch -c'
alias gsw='git switch'
alias gsc='git switch -c'
## status
alias gs='git status -sb'
 # Untracked filesを表示せず，not stagedと，stagedだけの状態を出力する
alias gstt='git status -uno'
## stash
alias gst='git stash -u'
alias gsp='git stash pop'
alias gsl='git stash list'
alias gsc='git stash clear'
## branch
alias gbr='git branch'
## push
alias gps='git push'
## pull
alias gpl='git pull'
## fetch
alias gf='git fetch'
## log
alias gl='git log'
alias glg='git log --graph --abbrev-commit --date=iso '
alias glo='git log --oneline'
## cherry-pick
alias gcp='git cherry-pick'
## history
alias gh='git history'

# Go
alias gofa='gofmt -w ex*/*.go'

# terminal
cdls ()
{
    \cd "$@" && ls
}
alias cd="cdls"

# ls
export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls='ls --color=auto -GF'
alias ll='ls -alhF'
alias la='ls -a'

## diff
alias diff='colordiff -u'

# mkdir
alias mkdir='mkdir -p'

# cd
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'

alias grep="grep --color=auto"
alias tree='tree -C'

alias c='pbcopy'

alias pwdc='pwd | tr -d "\n" | pbcopy'

# 編集
alias zshrc='vi ~/.zshrc'
alias reload='source ~/.zshrc'

# 安全策
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# MySQL
alias ms='mysql.server'
alias mss='mysql.server start'

# docker
alias d='docker'
alias dp='docker ps'
alias di='docker images'
alias drm='docker system prune'

# docker compose
alias dc='docker compose'
alias dcu='docker compose up'
alias dcd='docker compose down'
alias dcs='docker compose start'
alias dce='docker compose end'
alias dcr='docker compose restart'
alias dcl='docker compose logs'
alias dcp='docker compose ps'

#laravel(phper向け)
alias art='php artisan'
alias arts='php artisan serve'
alias artr='php artisan route:list'
alias migrate='php artisan migrate'
alias rollback='php artisan migrate:rollback'
alias fresh='php artisan migrate:fresh'
alias cc='php artisan config:clear && php artisan cache:clear && php artisan view:clear'
alias seed='art db:seed'

#npm
alias nrb='npm run build'
alias nrd='npm run dev'

# npx
## hardhat
alias nhc='npx hardhat compile'
alias nht='npx hardhat test'
alias nhn='npx hardhat node'

# python
alias p='python3'
alias python='python3'
alias pip='pipx'

# ローカルの設定を読み込み
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
