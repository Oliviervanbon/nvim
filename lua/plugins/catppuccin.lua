return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  opts = {},
  config = function()
    vim.cmd.colorscheme("catppuccin")
  end,
}
