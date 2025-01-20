-- Define the path for lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Clone lazy.nvim if it doesn't exist
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

-- Add lazy.nvim to the runtime path
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- Set up lazy.nvim
if not vim.g.vscode then
  require("lazy").setup({
    spec = {
      -- LazyVim core plugins
      {
        "LazyVim/LazyVim",
        import = "lazyvim.plugins",
        opts = {
          colorscheme = "catppuccin",
          news = { lazyvim = true, neovim = true },
        },
      },

      -- Import extra modules
      { import = "lazyvim.plugins.extras.linting.eslint" },
      { import = "lazyvim.plugins.extras.formatting.prettier" },
      { import = "lazyvim.plugins.extras.lang.typescript" },
      { import = "lazyvim.plugins.extras.lang.json" },
      { import = "lazyvim.plugins.extras.lang.rust" },
      { import = "lazyvim.plugins.extras.coding.copilot" },
      { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
      { import = "plugins" },
    },

    defaults = {
      -- Don't lazy-load custom plugins by default
      lazy = false,
      -- Use the latest git commit
      version = false,
    },

    checker = {
      -- Automatically check for plugin updates
      enabled = true,
    },

    performance = {
      cache = {
        -- Enable caching for all plugins
        enabled = true,
      },
      rtp = {
        -- Disable some rtp plugins
        disabled_plugins = {
          "gzip",
          "netrwPlugin",
          "rplugin",
          "tarPlugin",
          "tohtml",
          "tutor",
          "zipPlugin",
        },
      },
    },

    debug = false,
  })
else
  require("config.keymaps")
  require("config.options")
  require("lazy").setup({
    -- Surround plugin
    {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup({
          -- Configuration here, or leave empty to use defaults
        })
      end
    }
  })
end
