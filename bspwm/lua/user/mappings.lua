return {
  n = {
    [";"] = {":"},
    ["<C-d>"] = {"<C-d>zz", desc = "Move down & center view"},
    ["L"] = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["H"] = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
  },
  i = {
    ["<C-J>"] = {"copilot#Accept(<Tab>)", silent = true, expr = true, script = true},
  },
}
