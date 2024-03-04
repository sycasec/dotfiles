return {
-- mason
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "rust_analyzer",
        "tsserver",
        "gopls",
        "marksman",
        "tailwindcss",
        "cssls",
        "clangd",
      })
    end,
  },
-- mason null-ls for formatters/linters (i didnt know that :(()
  {
    "jay-babu/mason-null-ls.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "eslint-lsp",
        "goimports",
        "stylua",
        "glow",
        "prettierd",
      })
    end,
  },

-- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = require("astronvim.utils").list_insert_unique(opts.ensure_installed, {
        "lua",
        "go",
        "rust",
        "css",
      })
    end,
  },


-- tailwind
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {
          opts = {
            filetypes = {
              "html",
              "css",
              "javascript",
              "typescript",
            }
          }
        },
        tsserver = {
          init_options = {
            preferences = {
              filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
            },
          },
        },
        clangd = {
          opts = {
            cmd = {
              "clangd",
              "--ofset-encoding=utf-16"
            }
          }
        },
      },
    },
  },

  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        user_default_options = {
          tailwind = true,
        }
     })
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    lazy=false,
    dependencies = {
        { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function (_, opts)
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- adds icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },

-- copilot
  {
    "github/copilot.vim",
    lazy = false,
  },

}
