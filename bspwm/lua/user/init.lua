return {
  colorscheme = "rose-pine",
  lsp = {
    config = {
      clangd = {
        capabilities = {
          offsetEncoding = "utf-8",
        }
      }
    },
    formatting = {
      format_on_save = {
        enabled = true,
        allow_filetypes ={
          "go",
          "rs",
          -- "python",
          "rust",
        },
      }
    }
  },


  options = {
    opt = {
      wrap = true,
      tabstop = 8,
      shiftwidth = 4,
      list = true,
      listchars = { tab = "│→", extends = "⟩", precedes = "⟨", trail = "·", nbsp = "␣" },
    },
    g = {
      copilot_no_tab_map = true,
    },
  },

  mappings = {
    n = {
      [";"] = {":"},
      ["<C-d>"] = {"<C-d>zz", desc = "Move down & center view"},
      ["<C-u>"] = {"<C-u>zz", desc = "Move up & center view"},
    },
  }
}
