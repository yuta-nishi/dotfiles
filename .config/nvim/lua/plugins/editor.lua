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
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_by_name = {
            ".git",
            ".DS_Store",
          },
        },
      },
    },
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
