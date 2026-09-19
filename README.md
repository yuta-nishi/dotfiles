# Dotfiles

Personal dotfiles for macOS, wired up with plain symlinks instead of chezmoi.

## Usage

Clone into `~/dotfiles`, then run the script.

```bash
git clone git@github.com:yuta-nishi/dotfiles.git ~/dotfiles
cd ~/dotfiles
./link_mac.sh
```

Links are created with `ln -fs`, so existing files are overwritten and the script can be re-run after pulling changes.

## Contents

### Shell

- `.zshrc`, `.zshenv`, `.zprofile` — [Zsh](https://github.com/zsh-users/zsh)
- `.config/sheldon/plugins.toml` — [Sheldon](https://github.com/rossmacarthur/sheldon)
- `.config/zabrze/*.toml` — [zabrze](https://github.com/Ryooooooga/zabrze)
- `.config/starship.toml` — [Starship](https://github.com/starship/starship)
- `.default-npm-packages` — [npm](https://github.com/npm/cli)
- `.condarc` — [Conda](https://github.com/conda/conda)

### Editors and IDEs

- `.config/nvim/` — [Neovim](https://github.com/neovim/neovim) with [LazyVim](https://github.com/LazyVim/LazyVim)
- `.vimrc` — [Vim](https://github.com/vim/vim)
- `.vscode/` — [VS Code](https://github.com/microsoft/vscode)
- `.config/zed/` — [Zed](https://github.com/zed-industries/zed)
- `.ideavimrc`, `idea/keymaps/` — [IntelliJ IDEA](https://github.com/JetBrains/intellij-community)

### Terminal

- `.config/ghostty/config` — [Ghostty](https://github.com/ghostty-org/ghostty)
- `.config/aerospace/` — [AeroSpace](https://github.com/nikitabobko/AeroSpace)
- `.config/borders/` — [JankyBorders](https://github.com/FelixKratz/JankyBorders)

### CLI and TUI

- `.config/mise/config.toml` — [mise](https://github.com/jdx/mise)
- `.gitconfig`, `catppuccin.gitconfig` — Git with [delta](https://github.com/dandavison/delta)
- `.config/bat/` — [bat](https://github.com/sharkdp/bat)
- `.config/fastfetch/config.jsonc` — [fastfetch](https://github.com/fastfetch-cli/fastfetch)
- `.config/htop/htoprc` — [htop](https://github.com/htop-dev/htop)
- `.config/yazi/` — [Yazi](https://github.com/sxyazi/yazi)
- `lazygit/config.yml` — [lazygit](https://github.com/jesseduffield/lazygit)
- `.config/k9s/` — [k9s](https://github.com/derailed/k9s)
- `.config/jj/config.toml` — [Jujutsu](https://github.com/jj-vcs/jj)
- `.config/hunk/config.toml` — [hunk](https://github.com/modem-dev/hunk)
- `.config/rumdl/rumdl.toml` — [rumdl](https://github.com/rvben/rumdl)
- `.config/harper-ls/dictionary.txt` — [Harper](https://github.com/Automattic/harper)
- `.config/herdr/` — [herdr](https://github.com/herdrdev/herdr)
- `.docker/daemon.json` — [Docker](https://github.com/moby/moby)

### AI coding agents

- `.config/pi/agent/` — [pi](https://github.com/earendil-works/pi)
- `.config/opencode/` — [opencode](https://github.com/sst/opencode)
- `.config/hermes/` — [Hermes](https://github.com/NousResearch/hermes-agent)
