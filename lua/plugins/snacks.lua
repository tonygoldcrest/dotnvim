return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			picker = {
				layout = { preset = "telescope" },
			},
			terminal = {
				win = {
					position = "bottom",
					height = 0.3,
					enter = false,
					keys = {
						nav_up = { "<C-k>", function() vim.cmd("wincmd k") end, mode = "t" },
					},
				},
			},
		},
		keys = {
			{
				"<C-t>",
				function() Snacks.terminal.toggle() end,
				desc = "Toggle terminal",
				mode = { "n", "t" },
			},
		},
	},
}
