-- lazy.nvimが未インストールなら自動でgit cloneする（初回起動時のみ実行）
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- lazy.nvimの設定
if not vim.g.vscode then
  require("lazy").setup({
    spec = {
      {
        "LazyVim/LazyVim",
        import = "lazyvim.plugins",
        opts = {
          colorscheme = "catppuccin-mocha",
        },
      },
      -- ai extras
      { import = "lazyvim.plugins.extras.ai.copilot" },
      { import = "lazyvim.plugins.extras.ai.sidekick" },
      -- coding extras
      { import = "lazyvim.plugins.extras.coding.mini-surround" },
      { import = "lazyvim.plugins.extras.coding.neogen" },
      -- lang extras
      { import = "lazyvim.plugins.extras.lang.docker" },
      { import = "lazyvim.plugins.extras.lang.go" },
      { import = "lazyvim.plugins.extras.lang.helm" },
      { import = "lazyvim.plugins.extras.lang.java" },
      { import = "lazyvim.plugins.extras.lang.json" },
      { import = "lazyvim.plugins.extras.lang.markdown" },
      { import = "lazyvim.plugins.extras.lang.python" },
      { import = "lazyvim.plugins.extras.lang.rust" },
      { import = "lazyvim.plugins.extras.lang.sql" },
      { import = "lazyvim.plugins.extras.lang.svelte" },
      { import = "lazyvim.plugins.extras.lang.tailwind" },
      { import = "lazyvim.plugins.extras.lang.terraform" },
      { import = "lazyvim.plugins.extras.lang.tex" },
      { import = "lazyvim.plugins.extras.lang.toml" },
      { import = "lazyvim.plugins.extras.lang.typescript" },
      { import = "lazyvim.plugins.extras.lang.typescript.oxc" },
      { import = "lazyvim.plugins.extras.lang.typst" },
      { import = "lazyvim.plugins.extras.lang.vue" },
      { import = "lazyvim.plugins.extras.lang.yaml" },
      -- custom plugins
      { import = "plugins" },
    },
    defaults = {
      lazy = false,
      version = false,
    },
    checker = { enabled = true },
    performance = {
      rtp = {
        disabled_plugins = {
          "gzip",
          "tarPlugin",
          "tohtml",
          "tutor",
          "zipPlugin",
        },
      },
    },
  })
else
  -- VSCode Neovim用の設定
  require("config.keymaps")
  require("config.options")
end
