# nvim.files

Repo with my NeoVim config files.

## Refs
- https://www.jonashietala.se/blog/2023/10/01/rewriting_my_neovim_config_in_lua/#Was-the-rewrite-worth-it
    - https://github.com/treeman/dotfiles/tree/master
- https://www.harrisoncramer.me/building-a-powerful-neovim-configuration/
    - https://github.com/harrisoncramer/nvim/tree/main

# Keymap cheatsheet

| Description | Keymap/Shortcut |
|-------------|-----------------|
| Move to next quickfix item | `]q` |
| Move to previous quickfix item | `[q` |
| Move to last quickfix item | `]Q` |
| Move to first quickfix item | `[Q` |
| Move to next location list item | `]l` |
| Move to previous location list item | `[l` |
| Move to last location list item | `]L` |
| Move to first location list item | `[L` |
| Toggle Neotree file explorer | `<leader>d` |
| Toggle Trouble diagnostics | `<leader>t` |
| Open scratch file | `<leader>es` |
| Open journal file | `<leader>ej` |
| Open goals file | `<leader>eg` |
| Open habits file | `<leader>eh` |
| Open Neogit status | `gs` |
| Show git branches with Telescope | `gb` |
| Find files with Telescope | `<leader>ff` |
| Find in files with Telescope | `<leader>fg` |
| List buffers with Telescope | `<leader>fb` |
| Search help tags with Telescope | `<leader>fh` |
| List old files with Telescope | `<leader>fo` |
| Move to next Trouble item | `]t` |
| Move to previous Trouble item | `[t` |
| Move to last Trouble item | `]T` |
| Move to first Trouble item | `[T` |
| Toggle document symbols in Trouble | `<leader>w` |
| Run Neotest for test at cursor | `<leader>x` |
| Run Neotest for current file | `<leader>X` |
| Run Neotest for entire workspace | `<leader>m` |
| Toggle Neotest output panel | `<leader>n` |
| Toggle Neotest summary | `<leader>N` |
| Go to declaration (LSP) | `<localleader>gd` |
| Go to definition (LSP) | `<localleader>gD` |
| Find references (LSP) | `<localleader>gr` |
| Go to implementation (LSP) | `<localleader>gi` |
| Go to type definition (LSP) | `<localleader>gt` |
| Show hover information (LSP) | `<localleader>gh` |
| Show signature help (LSP) | `<localleader>gs` |
| Perform code action (LSP) | `<localleader>gx` |
| Rename symbol (LSP) | `<localleader>gR` |
| Move to next git hunk | `]h` |
| Move to previous git hunk | `[h` |
| Stage git hunk | `<leader>hs` |
| Reset git hunk | `<leader>hr` |
| Show git blame for hunk | `<leader>hb` |

# TODO:
- [ ] Move to `lazy.nvim`
    - [x] First version
    - [ ] Customize
    - [x] Create `config/keymaps`
- [ ] Chore
    - [ ] Fill out `README.md`
    - [x] Create a cheatsheet for keymaps

