return {
  "romgrk/barbar.nvim",
  opts = {
  },
  event = "BufEnter",
  keys = {
    {'<A-,>', '<Cmd>BufferPrevious<CR>', desc = "Previous buffer"},
    {'<A-.>', '<Cmd>BufferNext<CR>', desc = "Next buffer"},
    {'<A-c>', '<Cmd>BufferClose<CR>', desc = "Close buffer"},
  }
}
