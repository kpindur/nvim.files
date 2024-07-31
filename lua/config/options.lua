--vim.g.mapleader = " "
--vim.g.maplocalleader = "\\"

vim.g.python3_host_prog = vim.fn.expand("$NVIM_PYTHON_PROVIDER") .. "/bin/python"

local opt = vim.o

opt.shell = "/bin/bash"
-- Clipboard
opt.clipboard = "unnamedplus"
-- Backups and swapfiles
opt.swapfile = false
opt.backup = true
opt.backupdir = vim.fn.expand("~/.config/nvim/backup")
-- Text display
opt.list = false
opt.listchars = "tab:>-,trail:-"
opt.foldenable = false
-- Text formatting
opt.expandtab = true
opt.shiftround = true
opt.autoindent = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.tabstop = 2
opt.smarttab = true
-- Nvim UI
opt.number = true
opt.relativenumber = true
opt.linespace = 0
opt.report = 0
opt.ruler = true
opt.showcmd = true
opt.signcolumn = "yes"
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 2
opt.laststatus = 2
-- Spelling
opt.spell = true
opt.spelllang = "en_US"
-- Other
opt.ignorecase = true
opt.lazyredraw = true
opt.updatetime = 100

opt.splitbelow = true
opt.splitright = true

opt.termguicolors = true
opt.background = "dark"
