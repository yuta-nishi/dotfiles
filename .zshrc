# powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# oh-my-zsh
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# ls
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -a'

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

# safety
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# pipe
alias -g G='| grep'
alias -g C='| wc -l'

# reload
alias reload='source ~/.zshrc'

# homebrew setting
export PATH=/opt/homebrew/bin:$PATH

# go setting
export PATH=$HOME/go/bin:$PATH

# rye initialize
source '/Users/yutanishi/.rye/env'

# rust initialize
source '/Users/yutanishi/.cargo/bin'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# volta initialize
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# bun completions
[ -s "/Users/yutanishi/.bun/_bun" ] && source "/Users/yutanishi/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
