return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "ruff_lsp" }, -- "jedi_language_server"
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {},
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      -- lspconfig.jedi_language_server.setup({})
      lspconfig.ruff_lsp.setup({
        capabilities = capabilities
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
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

      vim.keymap.set("n", "<leader>fc", vim.lsp.buf.format, {})
    end,
  },
}
