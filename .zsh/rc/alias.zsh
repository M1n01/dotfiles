# =============================================================================
# Git Aliases
# =============================================================================

# Basic Git
alias g='git'

# Add
alias ga='git add'
alias gap='git add -p'        # Interactive add
alias ga.='git add .'         # Add all files

# Commit
alias gc='git commit'
alias gcm='git commit -m'     # Commit with message
alias gca='git commit --amend' # Amend last commit

# Branch & Switch
alias gbr='git branch'        # List branches
alias gco='git switch'        # Switch branch
alias gcb='git switch -c'     # Create and switch to new branch

# Status
alias gs='git status -sb'     # Short status with branch info
alias gstt='git status -uno'  # Status without untracked files

# Stash
alias gst='git stash -u'      # Stash including untracked files
alias gsp='git stash pop'     # Pop stash
alias gsl='git stash list'    # List stashes
alias gsc='git stash clear'   # Clear all stashes

# Merge
alias gm='git merge'
alias gms='git merge --squash'

# Remote Operations
alias gps='git push'          # Push to remote
alias gpl='git pull'          # Pull from remote
alias gf='git fetch'          # Fetch from remote

# Log
alias gl='git log'
alias glg='git log --graph --abbrev-commit --date=iso'  # Graph log
alias glo='git log --oneline' # One-line log

# Other
alias gcp='git cherry-pick'   # Cherry-pick commits
alias ghi='git history'       # Git history

# =============================================================================
# Makefile
# =============================================================================

alias mk='make -j'
alias remake='make fclean && make -j'

# =============================================================================
# C
# =============================================================================

alias gccw='gcc -Wall -Wextra -Werror'

# =============================================================================
# C++
# =============================================================================

alias g++='g++ -std=c++11'

# =============================================================================
# Go
# =============================================================================

alias gofa='gofmt -w ex*/*.go'

# =============================================================================
# Python
# =============================================================================

alias p='python3'
alias python='python3'
alias pip='pipx'

# =============================================================================
# Node.js
# =============================================================================

# npm
alias ni='npm install'
alias nup='npm update'
alias nrm='npm uninstall'
alias nls='npm list'
alias ngl='npm global ls'
alias nrd='npm run dev'
alias nrb='npm run build'

# yarn
alias yd='yarn dev'
alias yb='yarn build'

# =============================================================================
# Laravel
# =============================================================================

alias pa='php artisan'
alias pas='php artisan serve'
alias par='php artisan route:list'
alias pam='php artisan migrate'

# =============================================================================
# docker
# =============================================================================

alias d='docker'
alias dp='docker ps'
alias di='docker images'
alias drm='docker system prune'

# docker compose
alias dcu='docker compose up'
alias dcd='docker compose down'
alias dcs='docker compose start'
alias dce='docker compose end'
alias dcr='docker compose restart'
alias dcl='docker compose logs'
alias dcp='docker compose ps'

# =============================================================================
# Kubernetes
# =============================================================================

alias k='kubectl'
alias kc='kubectl'
alias kd='kubectl describe'
alias kd='kubectl describe'

# minikube
alias kubectl='minikube kubectl --'

# =============================================================================
# MySQL
# =============================================================================

alias ms='mysql.server'
alias mss='mysql.server start'

# =============================================================================
# Terraform
# =============================================================================

alias tf='terraform'
alias tfi='terraform init'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfd='terraform destroy'

alias tfpf='terraform plan -var-file=personal.tfvars'

# =============================================================================
# Shell Commands
# =============================================================================

# ls
alias ls='ls --color=auto -GF'
alias ll='ls -alhF'
alias la='ls -a'

# cd
alias cd='cdls'
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'

# mkdir
alias mkdir='mkdir -p'

# cp
alias cp='cp -i'

# mv
alias mv='mv -i'

# rm
alias rm='trash'

# grep
alias grep='grep --color=auto'
alias pwdc='pwd | tr -d "\n" | pbcopy'

# tree
alias tree='tree -C'

# pbcopy
alias c='pbcopy'

# pwd
alias pwd='pwdc'

# diff
alias diff='colordiff -u'

# =============================================================================
# Other Aliases
# =============================================================================

alias zshrc='vi ~/.zshrc'
alias reload='source ~/.zshrc'
