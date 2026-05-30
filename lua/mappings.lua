-- Copy path
vim.keymap.set("n", "gyp", function()
	local path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.")
	vim.fn.setreg("+", path)
	vim.notify("Copied: " .. path, vim.log.levels.INFO)
end, { desc = "Copy relative path" })

vim.keymap.set("n", "gyl", function()
	local path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.")
	local line = vim.api.nvim_win_get_cursor(0)[1]
	vim.fn.setreg("+", path .. ":" .. line)
	vim.notify("Copied: " .. path .. ":" .. line, vim.log.levels.INFO)
end, { desc = "Copy relative path:line" })

-- Quickfix
vim.keymap.set("n", "<leader>cc", "<cmd>cclose<cr>", { silent = true, desc = "Close quickfix" })
