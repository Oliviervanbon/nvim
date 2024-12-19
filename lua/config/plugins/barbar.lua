return {
  "romgrk/barbar.nvim",
  opts = {},
  event = "BufEnter",
  keys = {
    { "<A-h>", "<Cmd>BufferPrevious<CR>", desc = "Previous buffer" },
    { "<A-l>", "<Cmd>BufferNext<CR>",     desc = "Next buffer" },
    { "<A-c>", "<Cmd>BufferClose<CR>",    desc = "Close buffer" },
  },
}
