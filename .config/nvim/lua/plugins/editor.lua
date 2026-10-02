return {
  {
    "folke/flash.nvim",
    ---@type Flash.Config
    opts = {
      modes = {
        char = {
          enabled = false,
        },
      },
      search = {
        multi_window = true,
        wrap = true,
        incremental = true,
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    -- neo-tree copies the default component configs during `setup()`, so the
    -- icon provider installed by real-icons is lost when it loads afterwards.
    dependencies = { "Mirsmog/real-icons.nvim" },
    opts = function(_, opts)
      -- Merge the provider explicitly so it does not depend on load order.
      local icons = require("real-icons.integrations.neo_tree")
      opts = vim.tbl_deep_extend("force", opts, icons.opts())
      opts.filesystem = vim.tbl_deep_extend("force", opts.filesystem or {}, {
        filtered_items = {
          hide_dotfiles = false,
          hide_by_name = {
            ".git",
            ".DS_Store",
          },
        },
      })
      return opts
    end,
  },
  {
    "ibhagwan/fzf-lua",
    opts = {
      files = {
        actions = {
          ["ctrl-h"] = { require("fzf-lua").actions.toggle_hidden },
        },
      },
      grep = {
        actions = {
          ["ctrl-h"] = { require("fzf-lua").actions.toggle_hidden },
        },
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 400,
        virt_text = true,
        virt_text_pos = "eol",
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      lazygit = {
        env = {
          GIT_CONFIG_PARAMETERS = "'status.showUntrackedFiles=all'",
        },
      },
    },
  },
}
