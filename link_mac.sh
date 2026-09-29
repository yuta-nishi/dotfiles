#!/bin/bash

DOTFILES="$HOME/ghq/github.com/yuta-nishi/dotfiles"

create_symlink() {
  if ln -fs "$1" "$2"; then
    echo "Linked: $2 -> $1"
  else
    echo "Failed to link: $2 -> $1"
  fi
}

# Create symbolic links in the home folder
echo "Creating links in the home folder..."
create_symlink "$DOTFILES/.Brewfile" "$HOME/.Brewfile"
create_symlink "$DOTFILES/.condarc" "$HOME/.condarc"
create_symlink "$DOTFILES/.gitconfig" "$HOME/.gitconfig"
create_symlink "$DOTFILES/.ideavimrc" "$HOME/.ideavimrc"
create_symlink "$DOTFILES/.latexmkrc" "$HOME/.latexmkrc"
create_symlink "$DOTFILES/.vimrc" "$HOME/.vimrc"
create_symlink "$DOTFILES/.zprofile" "$HOME/.zprofile"
create_symlink "$DOTFILES/.zshenv" "$HOME/.zshenv"
create_symlink "$DOTFILES/.zshrc" "$HOME/.zshrc"
create_symlink "$DOTFILES/.default-npm-packages" "$HOME/.default-npm-packages"

# Create symbolic links in the .config folder
echo "Creating links in the .config folder..."
create_symlink "$DOTFILES/.config/aerospace/" "$HOME/.config"
create_symlink "$DOTFILES/.config/bat/" "$HOME/.config"
create_symlink "$DOTFILES/.config/borders/" "$HOME/.config"
create_symlink "$DOTFILES/.config/fastfetch/" "$HOME/.config"
create_symlink "$DOTFILES/.config/htop/" "$HOME/.config"
create_symlink "$DOTFILES/.config/hermes/config.yaml" "$HOME/.hermes/config.yaml"
create_symlink "$DOTFILES/.config/hermes/skins/catppuccin-mocha.yaml" "$HOME/.hermes/skins/catppuccin-mocha.yaml"
create_symlink "$DOTFILES/.config/mise/" "$HOME/.config"
create_symlink "$DOTFILES/.config/nvim/" "$HOME/.config"
create_symlink "$DOTFILES/.config/opencode/opencode.jsonc" "$HOME/.config/opencode/opencode.jsonc"
create_symlink "$DOTFILES/.config/opencode/tui.json" "$HOME/.config/opencode/tui.json"
create_symlink "$DOTFILES/.config/pi/agent/settings.json" "$HOME/.config/pi/agent/settings.json"
create_symlink "$DOTFILES/.config/pi/agent/models.json" "$HOME/.config/pi/agent/models.json"
create_symlink "$DOTFILES/.config/pi/agent/models.yml" "$HOME/.config/pi/agent/models.yml"
create_symlink "$DOTFILES/.config/pi/agent/config.yml" "$HOME/.config/pi/agent/config.yml"
create_symlink "$DOTFILES/.codex/config.toml" "$HOME/.codex/config.toml"
create_symlink "$DOTFILES/.config/pi/agent/catppuccin-mocha.json" "$HOME/.config/pi/agent/catppuccin-mocha.json"
create_symlink "$DOTFILES/.config/sheldon/" "$HOME/.config"
create_symlink "$DOTFILES/.config/starship.toml" "$HOME/.config/starship.toml"
create_symlink "$DOTFILES/.config/yazi/" "$HOME/.config"
create_symlink "$DOTFILES/.config/zabrze/" "$HOME/.config"
create_symlink "$DOTFILES/.config/herdr/config.toml" "$HOME/.config/herdr/config.toml"
create_symlink "$DOTFILES/.config/herdr/scripts/herdr-switch.sh" "$HOME/.config/herdr/scripts/herdr-switch.sh"
create_symlink "$DOTFILES/.config/hunk/config.toml" "$HOME/.config/hunk/config.toml"
create_symlink "$DOTFILES/.config/harper-ls/dictionary.txt" "$HOME/.config/harper-ls/dictionary.txt"
create_symlink "$DOTFILES/.config/jj/config.toml" "$HOME/.config/jj/config.toml"
create_symlink "$DOTFILES/.config/k9s/config.yaml" "$HOME/.config/k9s/config.yaml"
create_symlink "$DOTFILES/.config/k9s/aliases.yaml" "$HOME/.config/k9s/aliases.yaml"
create_symlink "$DOTFILES/.config/k9s/skins/catppuccin-mocha.yaml" "$HOME/.config/k9s/skins/catppuccin-mocha.yaml"
create_symlink "$DOTFILES/.config/rumdl/rumdl.toml" "$HOME/.config/rumdl/rumdl.toml"
create_symlink "$DOTFILES/.config/zed/keymap.json" "$HOME/.config/zed/keymap.json"
create_symlink "$DOTFILES/.config/zed/settings.json" "$HOME/.config/zed/settings.json"

# Create symbolic links in the Application Support folder
echo "Creating links in the Application Support folder..."
create_symlink "$DOTFILES/.config/ghostty/config" "$HOME/Library/Application Support/com.mitchellh.ghostty/config.ghostty"

create_symlink "$DOTFILES/idea/keymaps/default.xml" "$HOME/Library/Application Support/JetBrains/IntelliJIdea2025.1/keymaps/default.xml"
create_symlink "$DOTFILES/datagrip/keymaps/default.xml" "$HOME/Library/Application Support/JetBrains/DataGrip2026.2/keymaps/default.xml"

create_symlink "$DOTFILES/lazygit/config.yml" "$HOME/Library/Application Support/lazygit/config.yml"
create_symlink "$DOTFILES/.docker/daemon.json" "$HOME/.docker/daemon.json"

echo "All symbolic links have been created successfully."
