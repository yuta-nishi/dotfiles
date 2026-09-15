local function winbar_filename()
  local ft = vim.bo.filetype
  if ft == "neo-tree" or ft == "neo-tree-popup" then
    return ""
  end
  local fname = vim.fn.expand("%:t")
  if fname == "" then
    return ""
  end
  -- 同名バッファが存在するか確認し、区別できる最短の相対パスを返す
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_get_current_buf() ~= buf then
      if vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t") == fname then
        return vim.fn.expand("%:~:.")
      end
    end
  end
  return fname
end

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = function(_, opts)
      local custom_highlights = opts.custom_highlights

      opts.custom_highlights = function(colors)
        local highlights = type(custom_highlights) == "function"
            and custom_highlights(colors)
          or custom_highlights
          or {}
        highlights.GitSignsCurrentLineBlame = { fg = colors.overlay1, italic = true }
        return highlights
      end
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      winbar = {
        lualine_c = { winbar_filename },
      },
      inactive_winbar = {
        lualine_c = { winbar_filename },
      },
    },
  },
}
