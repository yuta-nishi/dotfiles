# ls
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -a'

# cd
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'

# git
alias g='git'
alias gi='git init'
alias ga='git add'
alias gd='git diff'
alias gs='git status'
alias gp='git push'
alias gb='git branch'
alias gst='git status'
alias gco='git checkout'
alias gf='git fetch'
alias gc='git commit'

# docker
alias dcb='docker compose build'
alias dcs='docker compose stop'
alias dcu='docker compose up'
alias dcd='docker compose down'
alias dcl='docker compose logs'
alias dcr='docker compose restart'
alias dce='docker compose exec'
alias dcp='docker compose ps'
alias dci='docker compose images'

# safety
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# pipe
alias -g G='| grep'
alias -g C='| wc -l'

# reload
alias reload='source ~/.zshrc'
