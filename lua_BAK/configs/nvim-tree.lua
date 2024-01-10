local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
  return
end

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup({
  view = {
    width = 30
  },
  renderer = {
    icons = {
      glyphs = {
        git = {
          unstaged = "",
          untracked = "U",
        },
      },
    }
  },
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  }
})
