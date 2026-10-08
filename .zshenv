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

# ruby setting
export RBENV_HOME="$HOME/.rbenv"
if [[ ":$PATH:" != *":$RBENV_HOME/shims:"* ]]; then
  export PATH="$RBENV_HOME/shims:$PATH"
fi

# flutter setting
export FLUTTER_HOME="$HOME/flutter"
if [[ ":$PATH:" != *":$FLUTTER_HOME/bin:"* ]]; then
  export PATH="$FLUTTER_HOME/bin:$PATH"
fi

# uv setting
export PATH="$HOME/.local/bin:$PATH"

# XDG Base Directory setting
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

if [[ -z "${OPENCODE_GO_API_KEY:-}" ]]; then
  OPENCODE_GO_API_KEY="$(security find-generic-password -s opencode-go-api-key -w 2>/dev/null)" && export OPENCODE_GO_API_KEY
fi

# zerobrew setting
export ZEROBREW_DIR="$HOME/.zerobrew"
export ZEROBREW_BIN="$ZEROBREW_DIR/bin"
export ZEROBREW_ROOT="/opt/zerobrew"
export ZEROBREW_PREFIX="/opt/zerobrew"
export PKG_CONFIG_PATH="$ZEROBREW_PREFIX/lib/pkgconfig:${PKG_CONFIG_PATH:-}"

if [[ ":$PATH:" != *":$ZEROBREW_BIN:"* ]]; then
  export PATH="$ZEROBREW_BIN:$ZEROBREW_PREFIX/sbin:$ZEROBREW_PREFIX/bin:$PATH"
fi
