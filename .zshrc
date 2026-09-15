# cd alias
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# git alias
alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias hd='hunk diff "$(git merge-base origin/HEAD HEAD)"'
alias gi='git init'
alias gl='git log'
alias gm='git merge'
alias gp='git push'
alias gr='git restore'
alias gs='git status'
alias gt='git tag'
alias gw='git wt'
alias gcl='git clone'
alias gcp='git cherry-pick'
alias gcz='git czg'
alias gpl='git pull'
alias grb='git rebase'
alias grm='git remote'
alias grs='git reset'
alias gsh='git show'
alias gst='git stash'
alias gsw='git switch'
alias gtr='git-gtr'

# jj alias
alias j='jj'
alias jd='jj diff'
alias jg='jj git'
alias jgf='jj git fetch'
alias jgi='jj git init'
alias jgp='jj git push'
alias jl='jj log'
alias jn='jj new'
alias js='jj status'
alias jsp='jj split'
alias lj='lazyjj'

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
alias ld='lazydocker'

# kubectl alias
alias k='kubectl'
alias ka='kubectl apply -f'
alias kc='kubectl create'
alias ke='kubectl exec -it'
alias kd='kubectl delete -f'
alias kg='kubectl get'

# terraform alias
alias t='terraform'
alias ta='terraform apply'
alias td='terraform destroy'
alias tf='terraform fmt'
alias tp='terraform plan'
alias tv='terraform validate'

# sql alias
alias lq='lazysql'

# fzf alias
alias wt='worktree'

# safety alias
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# reload
alias reload='source ~/.zshrc'

# Directory for storing initialization command output.
# When a .zwc file with the same name as the cache exists, zsh uses the byte-compiled file when sourcing it.
typeset -g ZSH_STARTUP_CACHE_DIR="${ZSH_STARTUP_CACHE_DIR:-${XDG_CACHE_HOME:-$HOME/.cache}/zsh-startup}"

# Cache and load initialization commands that output zsh code.
# Usage: zsh-cache-eval <cache-name> <dependency-file...> -- <command> [arguments...]
# Re-run the command only when a dependency is newer than the cache.
function zsh-cache-eval() {
  local cache_name="$1"
  shift
  local cache_file="$ZSH_STARTUP_CACHE_DIR/$cache_name.zsh"
  local temporary_file="$cache_file.$$"
  local dependency
  local cache_stale=0
  local -a dependencies

  while [[ "$1" != "--" ]]; do
    dependencies+=("$1")
    shift
  done
  shift

  if [[ ! -r "$cache_file" || ! -r "$cache_file.zwc" ]]; then
    cache_stale=1
  else
    for dependency in "${dependencies[@]}"; do
      if [[ "$dependency" -nt "$cache_file" ]]; then
        cache_stale=1
        break
      fi
    done
  fi

  if ((cache_stale)); then
    # Fall back to the original initialization if the cache cannot be created.
    command mkdir -p "$ZSH_STARTUP_CACHE_DIR" || {
      eval "$("$@")"
      return
    }
    "$@" >|"$temporary_file" || {
      command rm -f "$temporary_file"
      return
    }
    zcompile "$temporary_file" || {
      source "$temporary_file"
      command rm -f "$temporary_file" "$temporary_file.zwc"
      return
    }
    command mv -f "$temporary_file" "$cache_file" || {
      source "$temporary_file"
      command rm -f "$temporary_file" "$temporary_file.zwc"
      return
    }
    command mv -f "$temporary_file.zwc" "$cache_file.zwc" || {
      source "$cache_file"
      return
    }
  fi

  source "$cache_file"
}

# fzf commands
function repo() {
  local src
  src=$(ghq list | fzf --preview "bat --color=always --style=header,grid --line-range :80 $(ghq root)/{}/README.*")
  if [ -n "$src" ]; then
    cd "$(ghq root)/$src" || return
  fi
}

function worktree() {
  local dest
  dest=$(git worktree list | fzf --header="git worktrees" | awk '{print $1}')
  if [ -n "$dest" ]; then
    cd "$dest" || return
  fi
}

# Initialize the completion system.
# Initialize it before sheldon because sheldon's completion code uses compdef.
# compinit's compaudit scans the entire fpath, so skip the audit (-C) when zcompdump is less than a day old.
autoload -Uz compinit
zcompdump="$ZSH_STARTUP_CACHE_DIR/zcompdump"
command mkdir -p "$ZSH_STARTUP_CACHE_DIR"
if [[ -n "$(command find "$zcompdump" -mtime -1 2>/dev/null)" ]]; then
  compinit -C -d "$zcompdump"
else
  compinit -d "$zcompdump"
fi
unset zcompdump

# sheldon setting
zsh-cache-eval sheldon \
  /opt/homebrew/bin/sheldon \
  "$HOME/.config/sheldon/plugins.toml" \
  "${SHELDON_DATA_DIR:-$HOME/.local/share/sheldon}/plugins.lock" \
  -- sheldon source

# Ghostty sends ^U for super+backspace by default.
# In zsh, ^U deletes the entire line, so remap it to delete from the cursor to the beginning of the line.
bindkey '^U' backward-kill-line

# terraform setting
# bashcompinit depends on compinit, so it must run after sheldon (and compinit).
# -d/-m/-p/-r suppress chpwd/precmd/prompt/ZLE redraws after each deferred task.
zsh-defer -d -m -p -r -c 'autoload -U +X bashcompinit && bashcompinit && complete -o nospace -C /opt/homebrew/bin/terraform terraform'
