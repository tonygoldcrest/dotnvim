-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	-- LSP
	--  "williamboman/nvim-lsp-installer" -- Automatic LSP installer
	--  'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

	{ 'folke/neoconf.nvim' },

	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim"},
	{ "neovim/nvim-lspconfig" },

	-- Autocomplete
	{ 'hrsh7th/nvim-cmp' },
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-nvim-lsp-signature-help' }, -- Signature help
	{ 'hrsh7th/cmp-nvim-lsp' },          -- LSP source for nvim-cmp

	-- Colors
	{ 'EdenEast/nightfox.nvim' },

	-- Lualine
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons' }
	},
	{	 'arkav/lualine-lsp-progress' }, -- LSP Progress indicator

	-- Git integration
	{ 'tpope/vim-fugitive' },
	{ 'lewis6991/gitsigns.nvim' },

	-- Switch surroundings
	{ 'tpope/vim-surround' },
	{ 'tpope/vim-repeat'},

	-- Dev Icons
	{ 'kyazdani42/nvim-web-devicons' },

	-- Display vertical indent lines
	{ "lukas-reineke/indent-blankline.nvim" },

	-- Local vimrc for project overrides
	{ 'embear/vim-localvimrc' },

	-- Disable search highlight when done searching
	{ 'romainl/vim-cool' },

	-- Vim tmux seamless navigation
	{ 'christoomey/vim-tmux-navigator' },

	-- Treesitter
	{ 'nvim-treesitter/nvim-treesitter' },

	-- Display current function name
	{ 'nvim-treesitter/nvim-treesitter-context' },

	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	-- Stabilize buffers
	{ 'luukvbaal/stabilize.nvim' },

	-- Autoload/save session
	{
		'Shatur/neovim-session-manager',
		dependencies = {  'nvim-lua/plenary.nvim'  }
	},

	-- Trim trailing whitespaces
	{ 'cappyzawa/trim.nvim' },

	-- Center buffer
	{ "shortcuts/no-neck-pain.nvim" },

	-- Detect file indent
	{ 'tpope/vim-sleuth' },
	{ 'nvim-mini/mini.nvim', version = '*' },

	{
		"gruvw/strudel.nvim",
		build = "npm install",
		config = function()
			require("strudel").setup()
		end,
	},

	install = { colorscheme = { "nightfox" } },
	checker = { enabled = true },
})
