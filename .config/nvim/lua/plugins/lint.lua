return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = { "rumdl" },
        mysql = { "sqruff" },
        plsql = { "sqruff" },
        sh = { "shellcheck" },
        sql = { "sqruff" },
        xml = { "xmllint" },
        yaml = { "actionlint", "zizmor" },
      },
      linters = {
        shellcheck = {
          -- sourceされたファイルも解析対象にし、SC1091(source先未追跡)の誤検知や
          -- source先変数の未使用判定ミスを防ぐ
          prepend_args = { "-x", "-P", "SCRIPTDIR" },
        },
        actionlint = {
          condition = function(ctx)
            return ctx.filename:match("%.github/workflows/") ~= nil
          end,
        },
        zizmor = {
          condition = function(ctx)
            return ctx.filename:match("%.github/workflows/") ~= nil
          end,
        },
        xmllint = {
          cmd = "xmllint",
          args = { "--noout" },
          stream = "stderr",
          ignore_exitcode = true,
          parser = require("lint.parser").from_pattern(
            "^.-:(%d+): [^:]+ : (.+)$",
            { "lnum", "message" },
            nil,
            { source = "xmllint" }
          ),
        },
      },
    },
  },
}
