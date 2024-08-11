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

# fzf history
function fzf-select-history() {
    BUFFER=$(history -n -r 1 | fzf --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N fzf-select-history
bindkey '^r' fzf-select-history

# history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# sheldon setting
eval "$(sheldon source)"
