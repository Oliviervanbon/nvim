local options = {
  number = true, -- show line numbers
  relativenumber = true,
  ignorecase = true,
  smartcase = true,
  incsearch = true,
  autoindent = true,
  cursorline = true,
  cursorlineopt = "number",
  tabstop = 2,
  softtabstop = 0,
  shiftwidth = 2,
  expandtab = true,
  smarttab = true,
  wildmode = "longest,list",
  backup = false,
  cmdheight = 2,
  backspace = "indent,eol,start",
  hlsearch = true,
  showmatch = true,
  clipboard = "unnamedplus",
  termguicolors = true,
  colorcolumn = "120",
  list = true,
	listchars = {trail="█",tab="  ",nbsp="○"},   
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.g.mapleader = " "
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- window management
vim.keymap.set("n", "<leader>|", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>_", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

vim.keymap.set('n', '<Leader>/', ':nohl<CR>')

-- vim.fn.matchadd('errorMsg', [[\s\+$]])
vim.api.nvim_set_hl(0,"RedTabs",{bg="Red"})
vim.fn.matchadd('RedTabs', [[\t]])
vim.fn.matchadd('errorMsg', [[\s\+$]])
