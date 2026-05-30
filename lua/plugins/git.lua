return {
	{ "tpope/vim-fugitive" },
	{ "lewis6991/gitsigns.nvim", opts = {} },
	{
		"NeogitOrg/neogit",
		lazy = true,
		dependencies = {
			"esmuellert/codediff.nvim",
			"m00qek/baleia.nvim",
			"folke/snacks.nvim",
		},
		cmd = "Neogit",
		keys = {
			{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
		}
	}
}
