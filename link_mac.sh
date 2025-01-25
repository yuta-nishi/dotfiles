#!/bin/zsh

create_symlink() {
    if ln -fs "$1" "$2"; then
        echo "Linked: $2 -> $1"
    else
        echo "Failed to link: $2 -> $1"
    fi
}

# Create symbolic links in the home folder
echo "Creating links in the home folder..."
create_symlink "$HOME/dotfiles/.gitconfig" "$HOME/.gitconfig"
create_symlink "$HOME/dotfiles/.ideavimrc" "$HOME/.ideavimrc"
create_symlink "$HOME/dotfiles/.latexmkrc" "$HOME/.latexmkrc"
create_symlink "$HOME/dotfiles/.vimrc" "$HOME/.vimrc"
create_symlink "$HOME/dotfiles/.zshenv" "$HOME/.zshenv"
create_symlink "$HOME/dotfiles/.zshrc" "$HOME/.zshrc"
create_symlink "$HOME/dotfiles/.condarc" "$HOME/.condarc"

# Create symbolic links in the .config folder
echo "Creating links in the .config folder..."
create_symlink "$HOME/dotfiles/.config/aerospace/" "$HOME/.config"
create_symlink "$HOME/dotfiles/.config/mise/" "$HOME/.config"
create_symlink "$HOME/dotfiles/.config/nix/" "$HOME/.config"
create_symlink "$HOME/dotfiles/.config/nvim/" "$HOME/.config"
create_symlink "$HOME/dotfiles/.config/sheldon/" "$HOME/.config"
create_symlink "$HOME/dotfiles/.config/starship.toml" "$HOME/.config/starship.toml"
create_symlink "$HOME/dotfiles/.config/wezterm/" "$HOME/.config"
create_symlink "$HOME/dotfiles/.config/zabrze/" "$HOME/.config"
create_symlink "$HOME/dotfiles/.config/zed/keymap.json" "$HOME/.config/zed/keymap.json"
create_symlink "$HOME/dotfiles/.config/zed/settings.json" "$HOME/.config/zed/settings.json"

# Create symbolic links in the Visual Studio Code settings folder
echo "Creating links in the Visual Studio Code settings folder..."
create_symlink "$HOME/dotfiles/.vscode/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"
create_symlink "$HOME/dotfiles/.vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
create_symlink "$HOME/dotfiles/.vscode/tasks.json" "$HOME/Library/Application Support/Code/User/tasks.json"
\find "$HOME/dotfiles/.vscode/snippets" -type f | while read -r file_path; do
    relative_path="${file_path#$HOME/dotfiles/.vscode/snippets/}"
    target_path="$HOME/Library/Application Support/Code/User/snippets/$relative_path"
    create_symlink "$file_path" "$target_path"
done

# Create symbolic links in the IntelliJ IDEA settings folder
echo "Creating links in the IntelliJ IDEA settings folder..."
create_symlink "$HOME/dotfiles/idea/keymaps/default.xml" "$HOME/Library/Application Support/JetBrains/IntelliJIdea2024.3/keymaps/default.xml"
\find "$HOME/dotfiles/idea/options" -type f | while read -r file_path; do
    relative_path="${file_path#$HOME/dotfiles/idea/options/}"
    target_path="$HOME/Library/Application Support/JetBrains/IntelliJIdea2024.3/options/$relative_path"
    create_symlink "$file_path" "$target_path"
done

echo "All symbolic links have been created successfully."
