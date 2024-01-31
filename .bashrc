# ls/eza
if [[ $(command -v eza) ]]; then
    alias ls='eza --icons --git'
    alias ll='eza --icons --git -l -h'
    alias la='eza --icons --git -a'
else
    alias ls='ls --color=auto'
    alias ll='ls -lh'
    alias la='ls -a'
fi

# grep/ripgrep
if [[ $(command -v rg) ]]; then
    alias grep='rg'
fi

# find/fd
if [[ $(command -v fd) ]]; then
    alias find='fd'
fi

# diff/delta
if [[ $(command -v delta) ]]; then
    alias diff='delta'
fi

# cd
alias ..='cd ..'
alias ...='../..'
alias ....='../../..'
alias .....='../../../..'

# git
alias g='git'
alias gi='git init'
alias ga='git add'
alias gr='git restore'
alias gd='git diff'
alias gs='git status'
alias gp='git push'
alias gb='git branch'
alias gf='git fetch'
alias gc='git commit'
alias gl='git log'
alias gm='git merge'
alias gch='git checkout'
alias gcl='git clone'
alias gpl='git pull'
alias grs='git reset'
alias grm='git remote'
alias gsw='git switch'
alias gst='git stash'
alias grb='git rebase'
alias gcz='git cz'

# docker
alias dcb='docker compose build'
alias dcs='docker compose stop'
alias dcu='docker compose up'
alias dcd='docker compose down'
alias dcl='docker compose logs'
alias dcr='docker compose restart'
alias dcp='docker compose ps'
alias dce='docker compose exec'
alias dci='docker compose images'

# neovim
alias vim='nvim'
alias vi='nvim'

# safety
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# reload
alias reload='source ~/.zshrc'
