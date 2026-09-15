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
export PI_CODING_AGENT_DIR="$XDG_CONFIG_HOME/pi/agent"

# TODO: Migrate the shared API credential to the OS keychain.
# Share the Hermes OpenCode Go credential with clients that use pi's name.
if [[ -f "$HOME/.hermes/.env" ]]; then
  set -a
  source "$HOME/.hermes/.env"
  set +a
fi
if [[ -n "${OPENCODE_GO_API_KEY:-}" && -z "${OPENCODE_API_KEY:-}" ]]; then
  export OPENCODE_API_KEY="$OPENCODE_GO_API_KEY"
fi
