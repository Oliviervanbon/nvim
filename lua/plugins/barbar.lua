return {
  "romgrk/barbar.nvim",
  opts = {},
  config = function()
    -- Move to previous/next
    vim.keymap.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>', {})
    vim.keymap.set('n', '<A-.>', '<Cmd>BufferNext<CR>', {})
    -- Close buffer
    vim.keymap.set('n', '<A-c>', '<Cmd>BufferClose<CR>', {})
  end
}
