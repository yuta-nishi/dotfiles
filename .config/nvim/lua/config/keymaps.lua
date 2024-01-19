local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Insert mode mapping
keymap.set("i", "jk", "<ESC>", opts)

-- Normal mode mappings
keymap.set("n", "<C-h>", "^", opts)
keymap.set("n", "<C-l>", "$", opts)
keymap.set("n", "s", '"_s', opts)

-- Visual mode mappings
keymap.set("n", "<C-h>", "^", opts)
keymap.set("n", "<C-l>", "$", opts)
