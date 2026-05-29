-- Files
vim.keymap.set('n', '<Leader>r', function()
	local _ = MiniFiles.close() or MiniFiles.open()
end, { desc = "File explorer" })

vim.keymap.set('n', '<Leader>f', function()
	local _ = MiniFiles.close() or MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
	vim.defer_fn(function() MiniFiles.reveal_cwd() end, 30)
end, { desc = "File explorer (current file)" })

-- Picker
vim.keymap.set('n', '<C-p>', function() Snacks.picker.files() end, { desc = "Find files" })
vim.keymap.set('n', '<C-b>', function() Snacks.picker.buffers() end, { desc = "Buffers" })
vim.keymap.set('n', '<Leader>a', function() Snacks.picker.grep() end, { desc = "Live grep" })
vim.keymap.set('n', '<Leader>ds', function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" })

-- Undotree
vim.keymap.set('n', '<leader>u', '<cmd>Undotree<cr>', { desc = "Undotree" })

-- UI
vim.keymap.set('n', '<Leader>z', '<Cmd>NoNeckPain<CR>', { desc = "Zen mode" })
vim.keymap.set('n', '<Leader>p', function()
	local bufnr = vim.api.nvim_get_current_buf()
	local client = vim.lsp.get_clients({ bufnr = bufnr, name = 'eslint' })[1]
	if not client then return end
	client:request_sync('workspace/executeCommand', {
		command = 'eslint.applyAllFixes',
		arguments = {
			{
				uri     = vim.uri_from_bufnr(bufnr),
				version = vim.lsp.util.buf_versions[bufnr],
			},
		},
	}, nil, bufnr)
end, { desc = "ESLint fix all" })

-- Copy path
vim.keymap.set('n', 'gyp', function()
	local path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':.')
	vim.fn.setreg('+', path)
	vim.notify("Copied: " .. path, vim.log.levels.INFO)
end, { desc = "Copy relative path" })

vim.keymap.set('n', 'gyl', function()
	local path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':.')
	local line = vim.api.nvim_win_get_cursor(0)[1]
	local result = path .. ':' .. line
	vim.fn.setreg('+', result)
	vim.notify("Copied: " .. result, vim.log.levels.INFO)
end, { desc = "Copy relative path:line" })

-- Format
vim.keymap.set('n', '<Leader>lf', function()
	require("conform").format({ async = true })
end, { desc = "Format file" })

-- Diagnostics
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { noremap = true, silent = true, desc = "Prev diagnostic" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { noremap = true, silent = true, desc = "Next diagnostic" })

-- Quickfix
vim.keymap.set('n', '<leader>cc', '<cmd>cclose<cr>', { silent = true, desc = "Close quickfix" })

-- Snippet
vim.keymap.set({ 'i', 's' }, '<Tab>', function()
	if vim.snippet.active({ direction = 1 }) then
		return '<cmd>lua vim.snippet.jump(1)<cr>'
	else
		return '<Tab>'
	end
end, { expr = true, desc = "Jump snippet / Tab" })

-- Terminal
vim.keymap.set('t', '<C-e>', '<C-\\><C-n>', { desc = "Exit terminal insert mode" })

-- Strudel
local strudel = require("strudel")
vim.keymap.set("n", "<leader>sl", strudel.launch, { desc = "Launch" })
vim.keymap.set("n", "<leader>sq", strudel.quit, { desc = "Quit" })
vim.keymap.set("n", "<leader>st", strudel.toggle, { desc = "Toggle play/stop" })
vim.keymap.set("n", "<leader>su", strudel.update, { desc = "Update" })
vim.keymap.set("n", "<leader>ss", strudel.stop, { desc = "Stop playback" })
vim.keymap.set("n", "<leader>sb", strudel.set_buffer, { desc = "Set buffer" })
vim.keymap.set("n", "<leader>sx", strudel.execute, { desc = "Set buffer and update" })
