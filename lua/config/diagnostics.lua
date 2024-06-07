local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
	underline = true,
	signs = true,
	virtual_text = false,
	severity_sort = true,
	float = {
		border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" },
		focusable = false,
		source = 'always',
	},
})

vim.cmd('autocmd CursorHold * lua vim.diagnostic.open_float()')
