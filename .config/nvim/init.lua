if vim.g.vscode then
  require("config.keymaps")
  require("config.options")
  require("config.vscode")
else
  require("config.lazy")
end
