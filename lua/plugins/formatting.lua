return {
	{
		"stevearc/conform.nvim",
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
