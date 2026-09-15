-- default: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Insert mode mapping
keymap.set("i", "jk", "<ESC>", opts)

-- Normal mode mappings
keymap.set("n", "<C-h>", "^", opts)
keymap.set("n", "<C-l>", "$", opts)

-- Visual mode mappings
keymap.set("v", "<C-h>", "^", opts)
keymap.set("v", "<C-l>", "$", opts)
