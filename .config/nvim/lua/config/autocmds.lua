-- Automatically disable paste mode when leaving insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    vim.opt.paste = false
  end,
  desc = "Disable paste mode when leaving insert mode",
})

-- Disable text concealing for specific file types
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
  desc = "Disable concealing for JSON and Markdown files",
})
