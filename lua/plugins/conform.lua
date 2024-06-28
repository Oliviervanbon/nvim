return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "biome", "lua_ls", "html", "ruff_lsp", "ruff", "nil_ls" },
      automatic_installation = true,
    },
    config = true,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = { "stylua", "prettier", "nixpkgs-fmt" },
    },
    config = true,
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufWritePost", "BufReadPost", "InsertLeave" },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        markdown = {},
      }
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
      vim.keymap.set("n", "<leader>l", function()
        lint.try_lint()
      end, { desc = "Trigger linting for current file" })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
    config = function()
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local opts = { noremap = true, silent = true }
      local on_attach = function(client, bufnr)
        opts.buffer = bufnr
        vim.opt.signcolumn = "yes"
        vim.diagnostic.config({
          virtual_text = true,
          severity_sort = true,
        })
      end

      local capabilities = cmp_nvim_lsp.default_capabilities()
      capabilities.workspace = {
        didChangeWatchedFiles = {
          dynamicRegistration = true,
        },
      }

      -- configure html server
      lspconfig.html.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = { -- custom settings for lua
          Lua = {
            format = {
              enable = true,
              defaultConfig = {
                indent_style = "space",
                indent_size = "2",
                align_continuous_assign_statement = false,
                align_continuous_rect_table_field = false,
                align_array_table = false,
              },
            },
            -- make the language server recognize "vim" global
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              -- make language server aware of runtime files
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
          },
        },
      })
      lspconfig.ruff_lsp.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        init_options = {
          settings = {
            -- Any extra CLI arguments for 'ruff' go here.
            args = {},
          },
        },
      })
      lspconfig.nil_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        init_options = {
          settings = {
            -- Any extra CLI arguments for 'ruff' go here.
            args = {},
          },
        },
      })
      -- lspconfig.markdown_oxide.setup({
      --   capabilities = capabilities,
      --   on_attach = on_attach,
      --   init_options = {
      --     settings = {
      --       -- Any extra CLI arguments for 'ruff' go here.
      --       args = {},
      --     }
      --   }
      -- })
    end,
    keys = {
      { "K", vim.lsp.buf.hover, desc = "Show documentation for what is under cursor" },
      { "gR", "<cmd>Telescope lsp_references<CR>", desc = "Show LSP references" },
      { "gd", "<cmd>Telescope lsp_definitions<CR>", desc = "Show LSP definitions" },
      { "gD", vim.lsp.buf.definition, desc = "Go to declaration" },
      { "gi", "<cmd>Telescope lsp_implementations<CR>", desc = "Show LSP implementations" },
      { "gt", "<cmd>Telescope lsp_type_definitions<CR>", desc = "Show LSP type definitions" },
      { "<leader>ca", vim.lsp.buf.code_action, desc = "Code action" },
    },
  },
  {
    "stevearc/conform.nvim",
    events = { "LspAttach", "BufWritePre", "BufReadPre", "BufNewFile" },
    cmd = { "ConformInfo" },
    dependencies = {
      "williamboman/mason.nvim",
    },
    keys = {
      {
        -- Customize or remove this keymap to your liking
        "<leader>fc",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    -- Everything in opts will be passed to setup()
    opts = {
      -- Define your formatters
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff_fix", "ruff_format" },
        javascript = { { "prettierd", "prettier" } },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        markdown = { { "prettierd", "prettier" } },
        nix = { "nixfmt" },
        -- Use the "*" filetype to run formatters on all filetypes.
      },
      -- Set up format-on-save
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.enable_autoformat or vim.b[bufnr].enable_autoformat then
          return { timeout_ms = 500, lsp_fallback = true }
        end
      end,
      -- format_on_save = { timeout_ms = 500, lsp_fallback = true },
      -- Customize formatters
    },
    init = function()
      -- If you want the formatexpr, here is the place to set it
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
      vim.api.nvim_create_user_command("Format", function(args)
        local range = nil
        if args.count ~= -1 then
          local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
          range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
          }
        end
        require("conform").format({ async = true, lsp_fallback = true, range = range })
      end, { range = true })

      -- function for toggling format on save
      vim.api.nvim_create_user_command("FormatDisable", function(args)
        if args.bang then
          -- FormatDisable! will disable formatting just for this buffer
          vim.g.enable_autoformat = false
        else
          vim.b.enable_autoformat = false
        end
      end, {
        desc = "Disable autoformat-on-save",
        bang = true,
      })
      vim.api.nvim_create_user_command("FormatEnable", function(args)
        if args.bang then
          -- FormatEnable! will enable formatting just for this buffer
          vim.g.enable_autoformat = true
        else
          vim.b.enable_autoformat = true
        end
      end, {
        desc = "Re-enable autoformat-on-save",
        bang = true,
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          if vim.g.enable_autoformat or vim.b[args.buf].enable_autoformat then
            require("conform").format({ bufnr = args.buf })
          end
        end,
      })
      -- auto save in ~/Development folder
      -- https://github.com/MariaSolOs/dotfiles/blob/5e344230f63641e3e3540d489eb1d65d1dd60bf8/.config/nvim/lua/plugins/conform.lua#L26
      -- vim.api.nvim_create_autocmd("BufEnter", {
      --   desc = "Configure format on save",
      --   callback = function(args)
      --     local path = vim.api.nvim_buf_get_name(args.buf)
      --     path = vim.fs.normalize(path)
      --     vim.b[args.buf].format_on_save = vim
      --       .iter({ vim.env.XDG_CONFIG_HOME, vim.g.development_dir })
      --       :any(function(folder)
      --         return vim.startswith(path, vim.fs.normalize(folder))
      --       end)
      --   end,
      -- })
    end,
  },
}
