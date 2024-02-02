return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      extensions = {
        advanced_git_search = {
          -- fugitive or diffview
          diff_plugin = "fugitive",
          -- customize git in previewer
          -- e.g. flags such as { "--no-pager" }, or { "-c", "delta.side-by-side=false" }
          git_flags = {},
          -- customize git diff in previewer
          -- e.g. flags such as { "--raw" }
          git_diff_flags = {},
          -- Show builtin git pickers when executing "show_custom_functions" or :AdvancedGitSearch
          show_builtin_git_pickers = false,
          entry_default_author_or_date = "author", -- one of "author" or "date"

          -- Telescope layout setup
          telescope_theme = {
            function_name_1 = {
                -- Theme options
            },
            function_name_2 = "dropdown",
            -- e.g. realistic example
            show_custom_functions = {
                layout_config = { width = 0.4, height = 0.4 },
            }
          }
        }
      }
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files"},
      { '<leader>fg', "<cmd>Telescope live_grep<CR>", desc = "Live grep"}
    }
  },
  {
    "aaronhallaert/advanced-git-search.nvim",
    dependencies = {
      'tpope/vim-fugitive',
      -- to open commits in browser with fugitive
      'tpope/vim-rhubarb',
      -- optional: to replace the diff from fugitive with diffview.nvim
      -- (fugitive is still needed to open in browser)
      'sindrets/diffview.nvim',
    },
    opts={},
    config = function ()
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    opts = {},
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown{
            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  }
}
