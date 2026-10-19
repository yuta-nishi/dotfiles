local function yaml_schemas()
  return require("schemastore").yaml.schemas({
    replace = {
      ["RKE Cluster Configuration YAML"] = {
        description = "the cluster.yml configuration file for RKE",
        fileMatch = {},
        name = "RKE Cluster Configuration YAML",
        url = "https://raw.githubusercontent.com/dcermak/vscode-rke-cluster-config/main/schemas/cluster.yml.json",
      },
    },
  })
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        yamlls = {
          before_init = function(_, new_config)
            new_config.settings = new_config.settings or {}
            new_config.settings.yaml = new_config.settings.yaml or {}
            new_config.settings.yaml.schemas = vim.tbl_deep_extend(
              "force",
              new_config.settings.yaml.schemas or {},
              yaml_schemas()
            )
          end,
          settings = {
            yaml = {
              format = {
                printWidth = 90,
              },
            },
          },
        },
        helm_ls = {
          before_init = function(_, new_config)
            new_config.settings = new_config.settings or {}
            new_config.settings["helm-ls"] = new_config.settings["helm-ls"] or {}
            new_config.settings["helm-ls"].yamlls = new_config.settings["helm-ls"].yamlls
              or {}
            new_config.settings["helm-ls"].yamlls.config = vim.tbl_deep_extend(
              "force",
              new_config.settings["helm-ls"].yamlls.config or {},
              {
                schemas = yaml_schemas(),
              }
            )
          end,
          settings = {
            ["helm-ls"] = {
              yamlls = {
                config = {
                  schemaStore = {
                    enable = false,
                    url = "",
                  },
                  completion = true,
                  hover = true,
                },
              },
            },
          },
        },
        bashls = {},
        sqruff = {
          filetypes = { "sql", "mysql", "plsql" },
        },
        sourcekit = {
          filetypes = { "swift" },
        },
        -- Spell/grammar check. <leader>ca adds words to the dictionary.
        harper_ls = {
          settings = {
            ["harper-ls"] = {
              userDictPath = vim.fn.expand("~/.config/harper-ls/dictionary.txt"),
              linters = {
                SpellCheck = true,
                -- a/an usage.
                AnA = true,
                -- Noisy in code comments.
                SentenceCapitalization = false,
                UnclosedQuotes = true,
                -- Quote style is a preference.
                WrongQuotes = false,
                LongSentences = false,
                -- Replaces CLI flags like --foo with dashes.
                Dashes = false,
                -- "arg" is a common identifier.
                ExpandArgument = false,
                RepeatedWords = true,
                -- Intentional runs of spaces are common in comments and diagrams.
                Spaces = false,
                CorrectNumberSuffix = true,
                NumberSuffixCapitalization = true,
                -- False positives on lowercase CLI/package names.
                OrthographicConsistency = false,
                MultipleSequentialPronouns = true,
                -- Don't require title case in headings.
                UseTitleCase = false,
              },
            },
          },
        },
        typos_lsp = {},
      },
    },
  },
  {
    "mfussenegger/nvim-jdtls",
    optional = true,
    opts = function(_, opts)
      local truststore = vim.env.JAVA_ZSCALER_TRUSTSTORE
      if
        not truststore
        or truststore == ""
        or not (vim.uv or vim.loop).fs_stat(truststore)
      then
        return
      end

      opts.cmd = opts.cmd or { vim.fn.exepath("jdtls") }

      -- The jdtls wrapper accepts --jvm-arg; append truststore flags to its cmd.
      local function add_jvm_arg(arg)
        local flag = "--jvm-arg=" .. arg
        if not vim.tbl_contains(opts.cmd, flag) then
          table.insert(opts.cmd, flag)
        end
      end

      add_jvm_arg("-Djavax.net.ssl.trustStore=" .. truststore)
      add_jvm_arg("-Djavax.net.ssl.trustStoreType=PKCS12")
      add_jvm_arg(
        "-Djavax.net.ssl.trustStorePassword="
          .. (vim.env.JAVA_ZSCALER_TRUSTSTORE_PASSWORD or "changeit")
      )
    end,
  },
}
