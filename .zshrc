export USER=abeminato
export MAIL=$USER@student.42tokyo.jp

export PATH="/opt/homebrew/bin:$PATH"

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH="$PATH:/Users/abeminato/development/flutter/bin"
export PATH=/opt/homebrew/opt/php/bin:$PATH

# 42
alias norm='norminette -R CheckForbiddenSourceHeader'
alias norma='norminette -R CheckForbiddenSourceHeader ft*.c'
alias normh='norminette -R CheckDefine'
alias 42push='GIT_SSH_COMMAND="ssh -J git@vgs-gw.42tokyo.jp:4242" git push'
alias 42clone='GIT_SSH_COMMAND="ssh -J git@vgs-gw.42tokyo.jp:4242" git clone'
alias 42pull='GIT_SSH_COMMAND="ssh -J git@vgs-gw.42tokyo.jp:4242" git pull'
export LIBRARY_PATH="/opt/homebrew/opt/readline/lib"

# makefile
alias mk='make -j'

# c
alias gccw='gcc -Wall -Wextra -Werror'

# c++
alias g++='g++ -std=c++11'

# git
alias g='git'
alias ga='git add'
alias gap='git add -p'
alias ga.='git add .'
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gca='git commit --amend'
alias gcb='git checkout -b'
alias gsw='git switch'
alias gst='git status'
alias gbr='git branch'
alias gps='git push'
alias push='git push'
alias gpl='git pull'
alias pull='git pull'
alias gf='git fetch'
alias gl='git log'
alias glo='git log --oneline'
 # Untracked filesを表示せず，not stagedと，stagedだけの状態を出力する
alias stt='git status -uno'

# Go
alias gofa='gofmt -w ex*/*.go'

# terminal
cdls ()
{
    \cd "$@" && ls && source ~/.zshrc
}

alias cd="cdls"

# ls
export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls='ls --color=auto -GF'
alias ll='ls -alhF'
alias la='ls -a'

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

#docker-compose
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dcs='docker-compose start'
alias dce='docker-compose end'
alias dcr='docker-compose restart'

#laravel(phper向け)
alias art='php artisan'
alias arts='art serve'
alias artr='art route:list'
alias migrate='art migrate'
alias rollback='art migrate:rollback'
alias fresh='art migrate:fresh'
alias cc='php artisan config:clear && php artisan cache:clear && php artisan view:clear'
alias seed='art db:seed'

#npm
alias nrb='npm run build'
alias nrd='npm run dev'

# howcollect
export PATH="/usr/local/opt/llvm/bin:$PATH"

function gitmain(){
	git config --global user.name "M1n01"
	git config --global user.email "abe.minato.bz@gmail.com"
	source ~/.zshrc
}

function gitsub(){
	git config --global user.name "minatoabe"
	git config --global user.email "m.abe.howcollect@gmail.com"
	source ~/.zshrc
}
eval $(/opt/homebrew/bin/brew shellenv)

# zsh表示設定
## エンターキーが押される旅に実行される処理
prompt_precmd() {
	local magenta=$'\e[35m' cyan=$'\e[36m' reset=$'\e[m'
	local branch="$(git branch --show-current)"
	PROMPT="%{${magenta}%}[%/]%{${reset}%} [%{${cyan}%}${branch}%{${reset}%}] <`git config user.name`>
 $ "
}

## precmd フックを登録する
autoload -Uz add-zsh-hook
add-zsh-hook precmd prompt_precmd


# python
alias p='python3'

# cursor
alias cur='cursor'
