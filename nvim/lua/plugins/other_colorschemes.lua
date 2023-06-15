return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "luisiacc/gruvbox-baby" },
  { "yazeed1s/oh-lucy.nvim" },
  { "EdenEast/nightfox.nvim" },
  { "rose-pine/neovim" },
  { "ray-x/starry.nvim" },
  { "tiagovla/tokyodark.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "deepocean",
    },
  },
}
