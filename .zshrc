# reload
alias reload='source ~/.zshrc'

# homebrew setting
if [[ ":$PATH:" != *":/opt/homebrew/bin:"* ]]; then
    export PATH="$PATH:/opt/homebrew/bin"
fi

if [[ ":$PATH:" != *":/opt/homebrew/sbin:"* ]]; then
    export PATH="$PATH:/opt/homebrew/sbin"
fi

# Initialize the completion system for uv
# https://github.com/astral-sh/uv/issues/10707
autoload -Uz compinit
compinit

# Function to change directory using yazi
# https://yazi-rs.github.io/docs/quick-start
function y() {
    local tmp
    tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    local cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd" || return
    fi
    rm -f -- "$tmp"
}

# sheldon setting
eval "$(sheldon source)"
