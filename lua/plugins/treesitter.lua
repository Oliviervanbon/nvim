return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {"lua", "vim", "vimdoc", "javascript", "html", "python" },
    highlight = { enable = true },
    indent = { enable = true }
  }
}
