
require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.cmd.colorscheme "catppuccin-mocha"


-- Handige keymaps om lua configs te testen
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>") -- source de huidige file
vim.keymap.set("n", "<space>x", ":.lua<CR>") -- voer de huidige line uit met Lua
vim.keymap.set("v", "<space>x", ":lua<CR>") -- voer de huidige selectie uit met Lua



vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", {clear = true}),
  callback = function()
    vim.highlight.on_yank()
  end,
})
