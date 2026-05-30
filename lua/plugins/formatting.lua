return {
	{
		"stevearc/conform.nvim",
		keys = {
			{ "<Leader>lf", function() require("conform").format({ async = true }) end, desc = "Format file" },
		},
		opts = {
			formatters = {
				asmfmt_gnu = {
					command = vim.fn.expand("~/code/asmfmt-gnu/asmfmt-gnu"),
					stdin = true,
				},
			},
			formatters_by_ft = {
				asm = { "asmfmt_gnu" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
			},
		},
	},
}
