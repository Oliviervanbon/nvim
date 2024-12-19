require("config.lazy")
require("config.vim-options")

vim.cmd.colorscheme "catppuccin-mocha"


-- Handige keymaps om lua configs te testen
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>") -- source de huidige file
vim.keymap.set("n", "<leader>x", ":.lua<CR>")                 -- voer de huidige line uit met Lua
vim.keymap.set("v", "<leader>x", ":lua<CR>")                  -- voer de huidige selectie uit met Lua
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")                -- spring naar de vorige quickfix
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")                -- spring naar de volgende quickfix vlogende
vim.keymap.set("n", "-", "<cmd>Oil<CR>")                      -- open Oil in dit window
vim.keymap.set("n", "<C-_>", "<cmd>nohlsearch<CR>")           -- haal highlighting weg
vim.keymap.set("n", "<C-h>", "<c-w>h")
vim.keymap.set("n", "<C-j>", "<c-w>j")
vim.keymap.set("n", "<C-k>", "<c-w>k")
vim.keymap.set("n", "<C-l>", "<c-w>l")

-- window management
vim.keymap.set("n", "<leader>|", "<C-w>v")          -- split window vertically
vim.keymap.set("n", "<leader>_", "<C-w>s")          -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=")         -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>") -- close current split window



vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
