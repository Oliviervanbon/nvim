return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "≃" },
        untracked = { text = "┆" },
      },
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = false,     -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,  -- Use default
      max_file_length = 40000, -- Disable if file is longer than this (in lines)
      preview_config = {
        -- Options passed to nvim_open_win
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
    },
    keys = {
      { "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>",              desc = "Preview git hunk" },
      { "<leader>hr", "<cmd>Gitsigns reset_hunk<CR>",                desc = "Reset git hunk" },
      { "<leader>hs", "<cmd>Gitsigns stage_hunk<CR>",                desc = "Stage git hunk" },
      { "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>",           desc = "Undo stage git hunk" },
      { "<leader>bs", "<cmd>Gitsigns stage_buffer<CR>",              desc = "Stage git buffer" },
      { "<leader>hB", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "View current line blame" },
      { "<leader>hD", "<cmd>Gitsigns diffthis<CR>",                  desc = "Diff this" },
    },
  },
  {
    "tpope/vim-fugitive",
    opts = {},
    config = function() end,
  },
  {
    "rhysd/git-messenger.vim",
    opts = {},
    config = function() end,
  },
  {
    "sindrets/diffview.nvim",
    opts = {},
    config = function()
      require("diffview").setup {}
    end
  }
}
