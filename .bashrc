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
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

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
alias gcz='git cz --disable-emoji'

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

# conda
alias conda='micromamba'

# safety
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# volta initialize
export VOLTA_HOME="$HOME/.volta"
if [[ ":$PATH:" != *":$VOLTA_HOME/bin:"* ]]; then
	export PATH="$VOLTA_HOME/bin:$PATH"
fi

# cuda settings
export CUDA_HOME="/usr/local/cuda"
if [[ ":$PATH:" != *":$CUDA_HOME/bin:"* ]]; then
	export PATH="$CUDA_HOME/bin:$PATH"
fi

# rye setting
source "$HOME/.rye/env"

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/home/lab/yutanishi/.local/bin/micromamba'
export MAMBA_ROOT_PREFIX='/home/lab/yutanishi/micromamba'
__mamba_setup="$("$MAMBA_EXE" shell hook --shell bash --root-prefix "$MAMBA_ROOT_PREFIX" 2>/dev/null)"
if [ $? -eq 0 ]; then
	eval "$__mamba_setup"
else
	alias micromamba="$MAMBA_EXE" # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<

# rust setting
. "$HOME/.cargo/env"

# reload
alias reload="source ~/.bashrc"

# Prevent infinite loading in vscode by adding an environment variable
# starship
if [ -z "$VSCODE_INIT_DONE" ]; then
	export VSCODE_INIT_DONE=1
	eval "$(starship init bash)"
fi
