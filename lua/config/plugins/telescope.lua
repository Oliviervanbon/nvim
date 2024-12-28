return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- if Neovim/Lazy.Nvim doesn't want to build the plugin, you can do this manually by going to ~/.local/share/nvim/lazy/telescope-fzf-native.nvim and running "make" in the command line.
        build = 'make',
      },
    },
    config = function()
      require("telescope").setup {
        pickers = {
          find_files = {
            theme = "ivy"
          }
        },
        extensions = {
          fzf = {}
        }
      }

      require("telescope").load_extension("fzf")

      vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags)
      vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files)
      vim.keymap.set("n", "<leader>en", function()
        require("telescope.builtin").find_files {
          cwd = vim.fn.stdpath("config")
        }
      end)

      require("config.telescope.multigrep").setup()
    end
  }
}
