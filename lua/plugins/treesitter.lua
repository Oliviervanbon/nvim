return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {"lua", "vim", "vimdoc", "javascript", "html", "python", "markdown", "markdown_inline" },
    highlight = { enable = true },
    indent = { enable = true }
  },
  config = function()
  end
}
