return {
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme kanagawa-dragon")
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			options = {
				icons_enabled = true,
				theme = "auto",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {},
				always_divide_middle = true,
				globalstatus = false,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = {},
		},
	},

	-- LSP/formatter progress notifications (replaces arkav/lualine-lsp-progress)
	{ "j-hui/fidget.nvim", opts = {} },

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},

	{
		"shortcuts/no-neck-pain.nvim",
		keys = {
			{ "<Leader>z", "<Cmd>NoNeckPain<CR>", desc = "Zen mode" },
		},
		opts = {
			width = 150,
			minSideBufferWidth = 0,
			autocmds = {
				enabled = false,
				enableOnVimEnter = false,
			},
			mappings = { enabled = true },
		},
	},
}
