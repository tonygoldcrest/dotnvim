vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
		install_path })
end

return require('packer').startup({
	function()
		-- Plugin Manager
		use 'wbthomason/packer.nvim'

		-- LSP
		-- use "williamboman/nvim-lsp-installer" -- Automatic LSP installer
		-- use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

		use 'folke/neoconf.nvim'

		use {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		}

		use {
			'antosha417/nvim-lsp-file-operations',
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-tree/nvim-tree.lua",
			}
		}

		use {
			"pmizio/typescript-tools.nvim",
			requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" }
		}

		use 'yioneko/nvim-vtsls'

		-- Autocomplete
		use 'hrsh7th/nvim-cmp'              -- Autocompletion plugin
		use 'hrsh7th/cmp-buffer'
		use 'hrsh7th/cmp-nvim-lsp-signature-help' -- Signature help
		use 'hrsh7th/cmp-nvim-lsp'          -- LSP source for nvim-cmp

		-- Filesystem explorer
		use {
			'kyazdani42/nvim-tree.lua',
			requires = {
				'kyazdani42/nvim-web-devicons', -- optional, for file icons
			},
		}

		-- Colors
		use 'EdenEast/nightfox.nvim'

		-- Lualine
		use {
			'nvim-lualine/lualine.nvim',
			requires = { 'kyazdani42/nvim-web-devicons', opt = true }
		}
		use 'arkav/lualine-lsp-progress' -- LSP Progress indicator

		-- Git integration
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
		use "lukas-reineke/indent-blankline.nvim"

		-- Disable search highlight when done searching
		use 'romainl/vim-cool'

		-- Vim tmux seamless navigation
		use 'christoomey/vim-tmux-navigator'

		-- Barline
		use 'romgrk/barbar.nvim'

		-- Treesitter
		use { 'nvim-treesitter/nvim-treesitter' }

		-- Display current function name
		use 'nvim-treesitter/nvim-treesitter-context'

		-- Fuzzy finder
		use {
			'nvim-telescope/telescope.nvim',
			requires = {
				{ 'nvim-lua/plenary.nvim' },
				{ "nvim-telescope/telescope-live-grep-args.nvim" },
			},
			config = function()
				require("telescope").setup {
					defaults = {
						path_display = { "truncate" },
						dynamic_preview_title = true
					}
				}

				require("telescope").load_extension("live_grep_args")
			end
		}

		-- Zen mode
		use 'folke/zen-mode.nvim'

		-- Stabilize buffers
		use 'luukvbaal/stabilize.nvim'

		-- Autoload/save session
		use {
			'Shatur/neovim-session-manager',
			requires = { { 'nvim-lua/plenary.nvim' } }
		}

		-- Trim trailing whitespaces
		use 'cappyzawa/trim.nvim'

		-- Center buffer
		use { "shortcuts/no-neck-pain.nvim", tag = "*" }

		if packer_bootstrap then
			require('packer').sync()
		end
	end,
	config = {
		display = {
			open_fn = require('packer.util').float,
		}
	}
})
