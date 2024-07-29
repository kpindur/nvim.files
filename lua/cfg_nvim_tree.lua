-- nvim-tree
local nvim_tree = require "nvim-tree"
nvim_tree.setup({
	filters = {
		dotfiles = true,
	},
})

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "<A-Tab>", ":NvimTreeToggle<CR>", opts)

