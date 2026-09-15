return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters = {
        rumdl = {
          command = "rumdl",
          args = { "fmt", "--silent", "-" },
          stdin = true,
        },
      },
      formatters_by_ft = {
        sh = { "shfmt" },
        bash = { "shfmt" },
        zsh = { "shfmt" },
        -- LazyVimのPython extraは`ruff`をLSPとして有効化するが、
        -- `conform.nvim`のPython formatterは定義しないため、Ruff CLIを明示する。
        python = { "ruff_format", "ruff_fix" },
        mysql = { "sqruff" },
        plsql = { "sqruff" },
        sql = { "sqruff" },
        markdown = { "prettier", "rumdl", "markdown-toc" },
        ["markdown.mdx"] = { "prettier", "rumdl", "markdown-toc" },
      },
    },
  },
}
