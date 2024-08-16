if vim.g.vscode then
  require("config.keymaps")
  require("config.options")
else
  require("config.lazy")
end
