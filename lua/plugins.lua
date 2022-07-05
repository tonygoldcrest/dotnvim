return require('packer').startup(function()
	-- Plugin Manager
	use 'wbthomason/packer.nvim'

	-- LSP
	use "williamboman/nvim-lsp-installer" -- Automatic LSP installer
	use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

	-- Autocomplete
	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	use 'L3MON4D3/LuaSnip' -- Snippets plugin

	-- Filesystem explorer
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icons
		},
	}

	-- Colors
	use 'rafi/awesome-vim-colorschemes'

	-- Airline
	use 'vim-airline/vim-airline'
	use 'vim-airline/vim-airline-themes'

	-- Git integration
	use 'tpope/vim-fugitive'
    use 'lewis6991/gitsigns.nvim'

	-- Comments
	use 'JoosepAlviste/nvim-ts-context-commentstring'
	use 'tpope/vim-commentary'

	-- Emmet
	use 'mattn/emmet-vim'

	-- Switch surroundings
	use 'tpope/vim-surround'
	use 'tpope/vim-repeat' -- and . repeat for it

	-- Dev Icons
	use 'kyazdani42/nvim-web-devicons'

	-- Display vertical indent lines
	use 'Yggdroot/indentLine'

	-- Local vimrc for project overrides
	use 'embear/vim-localvimrc'

	-- Disable search highlight when done searching
	use 'romainl/vim-cool'

	-- Vim tmux seamless navigation
	use 'christoomey/vim-tmux-navigator'

	-- Highlight colors
	use { 'RRethy/vim-hexokinase', run = 'make hexokinase' }

	-- Barline
	use 'romgrk/barbar.nvim'

	-- Treesitter
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	-- Rainbow parens
	use 'p00f/nvim-ts-rainbow'

	-- Fuzzy finder
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Zen mode
	use 'folke/zen-mode.nvim'

	-- Stabilize buffers
	use 'luukvbaal/stabilize.nvim'

	-- Autoload/save session
	use {
		'Shatur/neovim-session-manager',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
end)
