#!/bin/bash

create_symlink() {
  if ln -fs "$1" "$2"; then
    echo "Linked: $2 -> $1"
  else
    echo "Failed to link: $2 -> $1"
  fi
}

# Create symbolic links in the home folder
echo "Creating links in the home folder..."
create_symlink "$HOME/dotfiles/.Brewfile" "$HOME/.Brewfile"
create_symlink "$HOME/dotfiles/.condarc" "$HOME/.condarc"
create_symlink "$HOME/dotfiles/.gitconfig" "$HOME/.gitconfig"
create_symlink "$HOME/dotfiles/.ideavimrc" "$HOME/.ideavimrc"
create_symlink "$HOME/dotfiles/.latexmkrc" "$HOME/.latexmkrc"
create_symlink "$HOME/dotfiles/.vimrc" "$HOME/.vimrc"
create_symlink "$HOME/dotfiles/.zprofile" "$HOME/.zprofile"
create_symlink "$HOME/dotfiles/.zshenv" "$HOME/.zshenv"
create_symlink "$HOME/dotfiles/.zshrc" "$HOME/.zshrc"
create_symlink "$HOME/dotfiles/.default-npm-packages" "$HOME/.default-npm-packages"

# Create symbolic links in the .config folder
echo "Creating links in the .config folder..."
create_symlink "$HOME/dotfiles/.config/aerospace/" "$HOME/.config"
create_symlink "$HOME/dotfiles/.config/bat/" "$HOME/.config"
create_symlink "$HOME/dotfiles/.config/borders/" "$HOME/.config"
create_symlink "$HOME/dotfiles/.config/fastfetch/" "$HOME/.config"
create_symlink "$HOME/dotfiles/.config/htop/" "$HOME/.config"
create_symlink "$HOME/dotfiles/.config/hermes/config.yaml" "$HOME/.hermes/config.yaml"
create_symlink "$HOME/dotfiles/.config/hermes/skins/catppuccin-mocha.yaml" "$HOME/.hermes/skins/catppuccin-mocha.yaml"
create_symlink "$HOME/dotfiles/.config/mise/" "$HOME/.config"
create_symlink "$HOME/dotfiles/.config/nvim/" "$HOME/.config"
create_symlink "$HOME/dotfiles/.config/opencode/opencode.jsonc" "$HOME/.config/opencode/opencode.jsonc"
create_symlink "$HOME/dotfiles/.config/opencode/tui.json" "$HOME/.config/opencode/tui.json"
create_symlink "$HOME/dotfiles/.config/pi/agent/settings.json" "$HOME/.config/pi/agent/settings.json"
create_symlink "$HOME/dotfiles/.config/pi/agent/catppuccin-mocha.json" "$HOME/.config/pi/agent/catppuccin-mocha.json"
create_symlink "$HOME/dotfiles/.config/sheldon/" "$HOME/.config"
create_symlink "$HOME/dotfiles/.config/starship.toml" "$HOME/.config/starship.toml"
create_symlink "$HOME/dotfiles/.config/yazi/" "$HOME/.config"
create_symlink "$HOME/dotfiles/.config/zabrze/" "$HOME/.config"
create_symlink "$HOME/dotfiles/.config/herdr/config.toml" "$HOME/.config/herdr/config.toml"
create_symlink "$HOME/dotfiles/.config/herdr/scripts/herdr-switch.sh" "$HOME/.config/herdr/scripts/herdr-switch.sh"
create_symlink "$HOME/dotfiles/.config/hunk/config.toml" "$HOME/.config/hunk/config.toml"
create_symlink "$HOME/dotfiles/.config/harper-ls/dictionary.txt" "$HOME/.config/harper-ls/dictionary.txt"
create_symlink "$HOME/dotfiles/.config/jj/config.toml" "$HOME/.config/jj/config.toml"
create_symlink "$HOME/dotfiles/.config/k9s/config.yaml" "$HOME/.config/k9s/config.yaml"
create_symlink "$HOME/dotfiles/.config/k9s/aliases.yaml" "$HOME/.config/k9s/aliases.yaml"
create_symlink "$HOME/dotfiles/.config/k9s/skins/catppuccin-mocha.yaml" "$HOME/.config/k9s/skins/catppuccin-mocha.yaml"
create_symlink "$HOME/dotfiles/.config/rumdl/rumdl.toml" "$HOME/.config/rumdl/rumdl.toml"
create_symlink "$HOME/dotfiles/.config/zed/keymap.json" "$HOME/.config/zed/keymap.json"
create_symlink "$HOME/dotfiles/.config/zed/settings.json" "$HOME/.config/zed/settings.json"

# Create symbolic links in the Application Support folder
echo "Creating links in the Application Support folder..."
create_symlink "$HOME/dotfiles/.config/ghostty/config" "$HOME/Library/Application Support/com.mitchellh.ghostty/config.ghostty"

create_symlink "$HOME/dotfiles/idea/keymaps/default.xml" "$HOME/Library/Application Support/JetBrains/IntelliJIdea2025.1/keymaps/default.xml"
create_symlink "$HOME/dotfiles/datagrip/keymaps/default.xml" "$HOME/Library/Application Support/JetBrains/DataGrip2026.2/keymaps/default.xml"

create_symlink "$HOME/dotfiles/lazygit/config.yml" "$HOME/Library/Application Support/lazygit/config.yml"
create_symlink "$HOME/dotfiles/.docker/daemon.json" "$HOME/.docker/daemon.json"

echo "All symbolic links have been created successfully."
