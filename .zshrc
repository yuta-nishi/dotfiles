# Write alias because abbr is not available in Warp.
# cat/bat alias
if [[ $(command -v bat) ]]; then
    alias cat='bat'
fi

# ls/eza alias
if [[ $(command -v eza) ]]; then
    alias ls='eza --icons --git'
    alias ll='eza --icons --git -l -h'
    alias la='eza --icons --git -a' else
    alias ls='ls -GF'
    alias ll='ls -GF -lh'
    alias la='ls -GF -a'
fi

# grep/ripgrep alias
if [[ $(command -v rg) ]]; then
    alias grep="rg --hidden --glob '!.git'"
fi

# find/fd alias
if [[ $(command -v fd) ]]; then
    alias find='fd'
fi

# diff/delta alias
if [[ $(command -v delta) ]]; then
    alias diff='delta'
fi

# micromamba alias
if [[ $(command -v micromamba) ]]; then
    alias conda='micromamba'
fi

# neovim alias
if [[ $(command -v nvim) ]]; then
    alias vim='nvim'
    alias vi='nvim'
fi

# cd alias
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# git alias
alias g='git'
alias ga='git add'
alias gr='git restore'
alias gd='git diff'
alias gs='git status'
alias gp='git push'
alias gb='git branch'
alias gc='git commit'
alias gl='git log'
alias gm='git merge'
alias gcl='git clone'
alias gpl='git pull'
alias grs='git reset'
alias grm='git remote'
alias gsw='git switch'
alias gsh='git show'
alias gst='git stash'
alias grb='git rebase'
alias gcz='git cz --disable-emoji'
alias lg='lazygit'

# docker alias
alias d='docker'
alias dp='docker ps'
alias di='docker images'
alias de='docker exec'
alias dcb='docker compose build'
alias dcs='docker compose stop'
alias dcu='docker compose up'
alias dcd='docker compose down'
alias dcl='docker compose logs'
alias dcp='docker compose ps'
alias dce='docker compose exec'

# safety alias
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# reload
alias reload='source ~/.zshrc'

# homebrew setting
if [[ ":$PATH:" != *":/opt/homebrew/bin:"* ]]; then
    export PATH="$PATH:/opt/homebrew/bin"
fi

if [[ ":$PATH:" != *":/opt/homebrew/sbin:"* ]]; then
    export PATH="$PATH:/opt/homebrew/sbin"
fi

# latex setting
if [[ ":$PATH:" != *":/Library/Tex/texbin:"* ]]; then
    export PATH="$PATH:/Library/Tex/texbin"
fi

# Initialize the completion system for uv
# (ref: https://github.com/astral-sh/uv/issues/10707)
autoload -Uz compinit
compinit

# sheldon setting
eval "$(sheldon source)"
