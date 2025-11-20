# nvim

Personal neovim configuration files 

# Plugins

- barbar:
    - barbar is a more interactive tab bar, navigate left (`<A-h>`) and right (`<A-l>`) between tabs.

- colorscheme: 
    - catppuccin-mocha

- git-stuff:
    - gitsigns:
    Get a nice gutter with git change symbols, preview (`<leader>hp`), stage (`<leader>hs`) and reset (`<leader>hr`) hunks easily, view line blames (`<leader>hB`), and diff specific git files (`<leader>hD`)
    - vim-fugitive
    Use `:Git` commands similar to `:!git` but better
    - git-messenger
    Use `:Diffviewopen` to view git changes more expansively

- lsp:
    - nvim-lspconfig:
        language servers:
        - `lua_ls` for lua
        - `nixd` for nix

- completion:
    - blink.cmp: easy auto completion plugin

- lualine:
    - lualine is a nice statusline

- oil:
    - Cool new file browser, better than using a file tree. Browse files with `-`. You can make modifications in this filetree and it will ask to create, rename or delete the file upon saving.

- telescope:
    find files with `<leader>ff`, find stuff in files with `<leader>fg`, find help files with `<leader>fh`.

- treesitter:
    highlight specific stuff in different languages

# Look into

- MariaSolOs's config
https://github.com/MariaSolOs/dotfiles/tree/main/.config/nvim

- Copilot
    - https://nithinbekal.com/posts/copilot-neovim/
    - https://www.reddit.com/r/neovim/comments/1cuzrlw/how_do_you_use_your_copilot/
    - https://github.com/copilotlsp-nvim/copilot-lsp
    - https://github.com/zbirenbaum/copilot.lua
    - https://github.com/zbirenbaum/copilot-cmp

