
local ok, telescope = pcall(require, "telescope")
if not ok then
  return
end

telescope.setup{
  extensions = {
    advanced_git_search = {
      -- fugitive or diffview
      diff_plugin = "fugitive",
      -- customize git in previewer
      -- e.g. flags such as { "--no-pager" }, or { "-c", "delta.side-by-side=false" }
      git_flags = {},
      -- customize git diff in previewer
      -- e.g. flags such as { "--raw" }
      git_diff_flags = {},
      -- Show builtin git pickers when executing "show_custom_functions" or :AdvancedGitSearch
      show_builtin_git_pickers = false,
      entry_default_author_or_date = "author", -- one of "author" or "date"
  
      -- Telescope layout setup
      telescope_theme = {
        function_name_1 = {
            -- Theme options
        },
        function_name_2 = "dropdown",
        -- e.g. realistic example
        show_custom_functions = {
            layout_config = { width = 0.4, height = 0.4 },
        }
      }
    }
  }
}
