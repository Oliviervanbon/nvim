return {
  {
    "catppuccin/nvim",
    -- lazy = false,
    name = "catppuccin",
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme("catppuccin-macchiato")
    end,
  },
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    name = "nord",
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd.colorscheme("nord")
    end,
  },
}
