return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			local wk = require("which-key")

			wk.setup({})

			wk.add({
				{ "<leader>l",  group = "lsp" },
				{ "<leader>w",  group = "workspace" },
				{ "<leader>s",  group = "strudel" },
				{ "<leader>sa", desc = "Surround add" },
				{ "<leader>sd", desc = "Surround delete" },
				{ "<leader>sr", desc = "Surround replace" },
				{ "]",          group = "next" },
				{ "[",          group = "prev" },
			})
		end,
	},
}
