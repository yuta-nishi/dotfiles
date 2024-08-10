# ls/eza alias
if [[ $(command -v eza) ]]; then
    alias ls='eza --icons --git'
    alias ll='eza --icons --git -l -h'
    alias la='eza --icons --git -a'
else
    alias ls='ls --color=auto'
    alias ll='ls -lh'
    alias la='ls -a'
fi

# grep/ripgrep alias
if [[ $(command -v rg) ]]; then
    alias grep='rg'
fi

# find/fd alias
if [[ $(command -v fd) ]]; then
    alias find='fd'
fi

# diff/delta alias
if [[ $(command -v delta) ]]; then
    alias diff='delta'
fi

# cd alias
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# git alias
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
alias gt='git tag'
alias gch='git checkout'
alias gcl='git clone'
alias gpl='git pull'
alias grs='git reset'
alias grm='git remote'
alias gsw='git switch'
alias gst='git stash'
alias grb='git rebase'
alias gcz='git cz --disable-emoji'

# docker alias
alias dcb='docker compose build'
alias dcs='docker compose stop'
alias dcu='docker compose up'
alias dcd='docker compose down'
alias dcl='docker compose logs'
alias dcr='docker compose restart'
alias dcp='docker compose ps'
alias dce='docker compose exec'
alias dci='docker compose images'

# neovim alias
alias vim='nvim'
alias vi='nvim'

# safety alias
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# reload
alias reload='source ~/.zshrc'

# homebrew setting
if [[ ":$PATH:" != *":/opt/homebrew/bin:"* ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi

# go setting
export GOPATH="$HOME/go"
if [[ ":$PATH:" != *":$GOPATH/bin:"* ]]; then
    export PATH="$GOPATH/bin:$PATH"
fi

# rye initialize
source "$HOME/.rye/env"

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/opt/homebrew/opt/micromamba/bin/micromamba'
export MAMBA_ROOT_PREFIX='/Users/yutanishi/micromamba'
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2>/dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE" # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

# rust initialize
source "$HOME/.cargo/bin"

# volta initialize
export VOLTA_HOME="$HOME/.volta"
if [[ ":$PATH:" != *":$VOLTA_HOME/bin:"* ]]; then
    export PATH="$VOLTA_HOME/bin:$PATH"
fi

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun setting
export BUN_INSTALL="$HOME/.bun"
if [[ ":$PATH:" != *":$BUN_INSTALL/bin:"* ]]; then
    export PATH="$BUN_INSTALL/bin:$PATH"
fi

# ruby setting
export RBENV_HOME="$HOME/.rbenv"
if [[ ":$PATH:" != *":$RBENV_HOME/shims:"* ]]; then
    export PATH="$RBENV_HOME/shims:$PATH"
fi

# java setting
export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"
if [[ ":$PATH:" != *":/opt/homebrew/opt/openjdk/bin:"* ]]; then
    export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
fi

# flutter setting
export FLUTTER_HOME="$HOME/flutter"
if [[ ":$PATH:" != *":$FLUTTER_HOME/bin:"* ]]; then
    export PATH="$FLUTTER_HOME/bin:$PATH"
fi

# sheldon setting
eval "$(sheldon source)"
