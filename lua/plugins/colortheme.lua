return {
  {
    "catppuccin/nvim",
    lazy = false,
    priority=1000,
    name = "catppuccin",
    opts = {
      flavour="macchiato",
      integrations = {
        barbar = false,
        neotree = true,
        markdown = true,
        mason = true,
        gitsigns = true
      },
    },
  },
  {
    "shaunsingh/nord.nvim",
    lazy = true,
    name = "nord",
    priority = 1000,
    opts = {},
  }
}
