return {
	{
		"gruvw/strudel.nvim",
		build = "npm install",
		keys = {
			{ "<leader>sl", function() require("strudel").launch() end,     desc = "Launch" },
			{ "<leader>sq", function() require("strudel").quit() end,       desc = "Quit" },
			{ "<leader>st", function() require("strudel").toggle() end,     desc = "Toggle play/stop" },
			{ "<leader>su", function() require("strudel").update() end,     desc = "Update" },
			{ "<leader>ss", function() require("strudel").stop() end,       desc = "Stop playback" },
			{ "<leader>sb", function() require("strudel").set_buffer() end, desc = "Set buffer" },
			{ "<leader>sx", function() require("strudel").execute() end,    desc = "Set buffer and update" },
		},
		opts = {
			ui = { hide_code_editor = false },
			update_on_save = true,
		},
	},
}
