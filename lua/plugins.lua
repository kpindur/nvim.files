-- Called from init.vim by 'lua require('plugins')'
require('packer').startup(function(use)
  -- let Packer manage itself
  use 'wbthomason/packer.nvim'

  -- manage LSP servers
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- attach to rust-analyzer
  use 'neovim/nvim-lspconfig'
  use 'simrat39/rust-tools.nvim'

  -- completion framework
  use 'hrsh7th/nvim-cmp' 

  -- LSP completion source
  use 'hrsh7th/cmp-nvim-lsp'

  -- additional sources
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-vsnip'                             
  use 'hrsh7th/cmp-path'                              
  use 'hrsh7th/cmp-buffer'                            
  use 'hrsh7th/vim-vsnip'

  -- tree-sitter
  use 'nvim-treesitter/nvim-treesitter'
  
  -- debugger
  use 'puremourning/vimspector'

  -- plenary
  use 'nvim-lua/plenary.nvim'

  -- telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- presence
  use 'andweeb/presence.nvim'

  -- autopairs
  use 'windwp/nvim-autopairs'

	-- colorschemes
	use { "catppuccin/nvim", as = "catppuccin" }

	-- devicons for status line
	use  'nvim-tree/nvim-web-devicons'

	-- status line
	use  { 'nvim-lualine/lualine.nvim', requires = {'nvim-tree/nvim-web-devicons', opt = true }}

	-- todo comments
	use {"folke/todo-comments.nvim", requires = { "nvim-lua/plenary.nvim" }}
	
	-- tabs
	use {'romgrk/barbar.nvim', requires = {'nvim-tree/nvim-web-devicons', 'lewis6991/gitsigns.nvim'}}

	-- Mind Maps using Markdown
	use {
		"Zeioth/markmap.nvim",
		build = "yarn global add markmap-cli",
		cmd = { "MarkmapOpen", "MarkmapSave", "MarkmapWatch", "MarkmapWatchStop" },
		opts = {
			html_output = "/tmp/markmap.html",
			hide_toolbar = false,
			grace_period = 3600000
		},
		config = function(_, opts) require("markmap").setup(opts) end
	}

	-- R Markdown
	use {'vim-pandoc/vim-rmarkdown', required = {'vim-pandoc/vim-pandoc', 'vim-pandoc/vim-pandoc-syntax'}}

	-- nvim-tree (NERDTree alternative)
	use {'nvim-tree/nvim-tree.lua', requires = {'nvim-tree/nvim-web-devicons'}}
end)
