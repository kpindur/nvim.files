--vim.g.mapleader = " "
--vim.g.maplocalleader = "\\"

vim.g.python3_host_prog = vim.fn.expand("$NVIM_PYTHON_PROVIDER") .. "/bin/python"

-- Update package.path to include luarocks
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua"
-- Update package.cpath to include luarocks
package.cpath = package.cpath .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/lib/lua/5.1/?.so"

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
vim.opt.completeopt = {
  'menuone',        --- popup even when there's only one match
  'noselect',       --- do not select, force to select
  'noinsert'        --- do not insert text until a selection is made
}
opt.conceallevel = 2
opt.laststatus = 2
-- Spelling
opt.spell = true
opt.spelllang = "en"
-- Other
opt.ignorecase = true
opt.lazyredraw = true
opt.updatetime = 100

opt.splitbelow = true
opt.splitright = true

opt.termguicolors = true
opt.background = "dark"
