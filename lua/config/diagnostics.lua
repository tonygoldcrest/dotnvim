vim.diagnostic.config({
	underline = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN]  = " ",
			[vim.diagnostic.severity.HINT]  = " ",
			[vim.diagnostic.severity.INFO]  = " ",
		},
	},
	virtual_text = false,
	severity_sort = true,
	float = {
		border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" },
		focusable = false,
		source = 'always',
	},
})

vim.api.nvim_create_autocmd('CursorHold', {
	callback = function()
		vim.diagnostic.open_float()
	end,
})
