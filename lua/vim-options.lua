local options = {
    number = true,            -- show line numbers
    relativenumber = false,    -- 
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
    hlsearch = true,
    showmatch = true,
    clipboard = "unnamedplus",
    termguicolors = true
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.g.mapleader = "<"

