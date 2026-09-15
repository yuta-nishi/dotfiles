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
        -- Shell
        bashls = {},
        -- SQL
        sqruff = {
          filetypes = { "sql", "mysql", "plsql" },
        },
        -- スペル+文法チェック（<leader>caで辞書に単語追加可能）
        harper_ls = {
          settings = {
            ["harper-ls"] = {
              userDictPath = vim.fn.expand("~/.config/harper-ls/dictionary.txt"),
              linters = {
                SpellCheck = true,
                -- a/anの使い分け
                AnA = true,
                -- コードコメントで誤検出が多いので無効
                SentenceCapitalization = false,
                UnclosedQuotes = true,
                -- クオートスタイルは好みなので無効
                WrongQuotes = false,
                -- コードコメントで邪魔なので無効
                LongSentences = false,
                -- CLI optionの`--foo`をdash記号へ置換しようとするため無効
                Dashes = false,
                -- コード中の`arg`は一般的な識別子なので無効
                ExpandArgument = false,
                -- "the the" のような重複語
                RepeatedWords = true,
                Spaces = true,
                CorrectNumberSuffix = true,
                NumberSuffixCapitalization = true,
                -- CLI名やpackage名の小文字表記で誤検出しやすい
                OrthographicConsistency = false,
                -- "I I" のような連続代名詞
                MultipleSequentialPronouns = true,
                -- 見出しでタイトルケースを使用しない
                UseTitleCase = false,
              },
            },
          },
        },
        -- タイポ検出
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

      -- jdtls wrapperは--jvm-argを受け取るので、JDTLSだけにtruststoreを渡す。
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
