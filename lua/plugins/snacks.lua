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
				start_insert = false,
				auto_insert = false,
				win = {
					position = "bottom",
					height = 0.3,
					enter = false,
				},
			},
		},
		keys = {
			{ "<C-p>",      function() Snacks.picker.files() end,       desc = "Find files" },
			{ "<C-b>",      function() Snacks.picker.buffers() end,     desc = "Buffers" },
			{ "<Leader>a",  function() Snacks.picker.grep() end,        desc = "Live grep" },
			{ "<Leader>ds", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
			{
				"<C-t>",
				function() Snacks.terminal.toggle() end,
				desc = "Toggle terminal",
				mode = { "n", "t" },
			},
			{ "<C-[>", "<C-\\><C-n>", desc = "Exit terminal insert mode", mode = "t" },
		},
	},
}
