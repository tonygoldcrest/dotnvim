-- Tree Explorer
vim.keymap.set('n', '<Leader>r', function() 
  local _ = MiniFiles.close()
  or MiniFiles.open()
end)
vim.keymap.set('n', '<Leader>f', function()
  local _ = MiniFiles.close()
    or MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
  vim.defer_fn(function()
    MiniFiles.reveal_cwd()
  end, 30)
end)

-- Telescope
vim.keymap.set('n', '<C-p>', '<Cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<C-b>', '<Cmd>Telescope buffers<CR>')
vim.keymap.set('n', '<Leader>a', "<Cmd>Telescope live_grep<CR>")
vim.keymap.set('n', '<Leader>ds', '<Cmd>Telescope diagnostics<CR>')

-- ZenMode
vim.keymap.set('n', '<Leader>z', '<Cmd>NoNeckPain<CR>')

-- Autofix
vim.keymap.set('n', '<Leader>p', '<Cmd>EslintFixAll<CR>')

-- Diagnostics
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

-- Quickfix
vim.keymap.set('n', '<leader>cc', '<cmd>cclose<cr>', { silent = true })

vim.keymap.set({ 'i', 's' }, '<Tab>', function()
	if vim.snippet.active({ direction = 1 }) then
		return '<cmd>lua vim.snippet.jump(1)<cr>'
	else
		return '<Tab>'
	end
end, { expr = true })

-- Strudel
local strudel = require("strudel")

vim.keymap.set("n", "<leader>sl", strudel.launch, { desc = "Launch Strudel" })
vim.keymap.set("n", "<leader>sq", strudel.quit, { desc = "Quit Strudel" })
vim.keymap.set("n", "<leader>st", strudel.toggle, { desc = "Strudel Toggle Play/Stop" })
vim.keymap.set("n", "<leader>su", strudel.update, { desc = "Strudel Update" })
vim.keymap.set("n", "<leader>ss", strudel.stop, { desc = "Strudel Stop Playback" })
vim.keymap.set("n", "<leader>sb", strudel.set_buffer, { desc = "Strudel set current buffer" })
vim.keymap.set("n", "<leader>sx", strudel.execute, { desc = "Strudel set current buffer and update" })
