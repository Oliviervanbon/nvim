return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "ruff_lsp", "ruff"}, -- "jedi_language_server"
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {},
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      -- lspconfig.jedi_language_server.setup({})
      lspconfig.ruff_lsp.setup({
        capabilities = capabilities,
      })
    end,
    keys = {
      { "K",          vim.lsp.buf.hover,       desc = "hover/definition" },
      { "<leader>gd", vim.lsp.buf.definition,  desc = "Go to definition" },
      { "<leader>ca", vim.lsp.buf.code_action, desc = "Code action" },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      ensure_installed = { "stylua", "ruff", "jq" }, -- "isort"
    },
  },
  {
    "nvimtools/none-ls.nvim",
    opts = {},
    keys = {
      { "<leader>fc", vim.lsp.buf.format, desc = "Format code" },
    },
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.diagnostics.ruff,
          null_ls.builtins.formatting.ruff,
          null_ls.builtins.formatting.jq,
          -- Check if ruff also does import sorting, otherwise include:
          -- null_ls.builtins.formatting.isort,
        },
      })
    end,
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
      "nvim-lua/plenary.nvim"
    }
  },
}
