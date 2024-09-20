return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        pyright = {
          single_file_support = false,
        },
        ruff = {
          opts = {},
        },
        ruff_lsp = { opts = {} },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = { eslint = {} },
      setup = {
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "vtsls" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- basic
        "lua-language-server",
        "clangd",

        -- json, js
        "json-lsp",
        "prettier",
        "prettierd",

        -- bash
        "shfmt",
        "bash-language-server",
        "shellcheck",

        -- markdown
        "glow",
        "marksman",
      },
    },
  },
}
