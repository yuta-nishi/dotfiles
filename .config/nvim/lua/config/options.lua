-- default: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
vim.opt.relativenumber = false -- 相対行番号を無効化

vim.opt.title = true -- ターミナルタイトルにファイル名を表示
vim.opt.cmdheight = 0 -- コマンドラインの高さを0にして常に非表示にする
vim.opt.spelllang = { "en", "cjk" } -- 日本語などのCJK文字をスペルチェック対象外にする

-- LazyVimのroot検出を現在バッファで変えず、起動時cwdに固定する
local initial_cwd = vim.uv.cwd()
vim.g.root_spec = {
  function()
    return initial_cwd
  end,
}

vim.filetype.add({
  extension = {
    drawio = "xml",
  },
  pattern = {
    [".*/.vscode/.*%.json"] = "jsonc",
    [".*/%.config/dtctl/config"] = "yaml",
  },
})

---@param width number インデント幅
---@param expandtab boolean タブをスペースに変換するかどうか
local function set_indent(width, expandtab)
  vim.opt_local.expandtab = expandtab
  vim.opt_local.shiftwidth = width
  vim.opt_local.tabstop = width
  vim.opt_local.softtabstop = expandtab and width or 0
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "dockerfile", "java", "rust" },
  callback = function()
    set_indent(4, true)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    set_indent(4, false)
  end,
})

-- LazyVimのPython extraはデフォルトで`pyright + ruff`を有効化する。
-- `lazyvim_python_lsp`で`pyright`側を`ty`に差し替え、`ruff`はlint用LSPとして残す。
vim.g.lazyvim_python_lsp = "ty"
vim.lsp.enable("ty") -- Neovim 0.12 built-in LSP config
