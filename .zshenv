# homebrew setting
if [[ ":$PATH:" != *":/opt/homebrew/bin:"* ]]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi

# rust setting
export RUST_PATH="$HOME/.cargo"

if [[ ":$PATH" != *":$RUST_PATH/bin:"* ]]; then
    export PATH="$RUST_PATH/bin:$PATH"
fi

# go setting
export GOPATH="$HOME/go"
if [[ ":$PATH:" != *":$GOPATH/bin:"* ]]; then
    export PATH="$GOPATH/bin:$PATH"
fi

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

# volta initialize
export VOLTA_HOME="$HOME/.volta"
if [[ ":$PATH:" != *":$VOLTA_HOME/bin:"* ]]; then
    export PATH="$VOLTA_HOME/bin:$PATH"
fi
