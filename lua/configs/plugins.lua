local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local ok, packer = pcall(require, 'packer')
if not ok then
  return
end

packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' }) -- Using a floating window
    end
  }
})

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  use 'nvim-lua/plenary.nvim' -- used by telescope, gitsigns, vgit, neogit, neo-tree.
  use 'lewis6991/impatient.nvim'
  use 'rebelot/kanagawa.nvim'
  use 'EdenEast/nightfox.nvim'
  use 'nvim-lualine/lualine.nvim'
  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
          'nvim-tree/nvim-web-devicons',
      },
  }
  use 'romgrk/barbar.nvim'
  use 'windwp/nvim-autopairs'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'lukas-reineke/indent-blankline.nvim'
  use {
      'nvim-telescope/telescope.nvim', tag = '0.1.5',
      requires = {
          'nvim-lua/plenary.nvim',
      },
  }
  use 'tpope/vim-fugitive'
  use 'sindrets/diffview.nvim'
  use 'lewis6991/gitsigns.nvim'
  use {
      'aaronhallaert/advanced-git-search.nvim',
      config = function()
          require('telescope').load_extension('advanced_git_search')
      end,
      requires = {
         'nvim-telescope/telescope.nvim',
         -- to show diff splits and open commits in browser
         'tpope/vim-fugitive',
         -- to open commits in browser with fugitive
         'tpope/vim-rhubarb',
         -- optional: to replace the diff from fugitive with diffview.nvim
         -- (fugitive is still needed to open in browser)
         'sindrets/diffview.nvim',
     },
  }
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
