-- Tree Explorer
vim.keymap.set('n', '<Leader>r', '<Cmd>NvimTreeToggle<CR>')
vim.keymap.set('n', '<Leader>f', '<Cmd>NvimTreeFindFile<CR>')

-- Source vimrc/current file
vim.keymap.set('n', '<Leader>sv', '<Cmd>luafile $MYVIMRC<CR>')
vim.keymap.set('n', '<Leader>sf', '<Cmd>luafile %<CR>')
vim.keymap.set('n', '<Leader>ev', '<Cmd>e $MYVIMRC<CR>')

-- Tabs
vim.keymap.set('n', 'H', '<Cmd>BufferPrevious<CR>')
vim.keymap.set('n', 'L', '<Cmd>BufferNext<CR>')
vim.keymap.set('n', '<Leader>qq', '<Cmd>BufferClose<CR>')
vim.keymap.set('n', '<Leader>qr', '<Cmd>BufferCloseBuffersRight<CR>')
vim.keymap.set('n', '<Leader>ql', '<Cmd>BufferCloseBuffersLeft<CR>')
vim.keymap.set('n', '<Leader>qc', '<Cmd>BufferCloseAllButCurrent<CR>')

-- Telescope
vim.keymap.set('n', '<C-p>', '<Cmd>Telescope find_files<CR>')
vim.keymap.set('n', '<C-b>', '<Cmd>Telescope buffers<CR>')
vim.keymap.set('n', '<Leader>a', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set('n', '<Leader>ds', '<Cmd>Telescope diagnostics<CR>')

-- Diagnostics
vim.keymap.set('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>')

-- ZenMode
vim.keymap.set('n', '<Leader>z', '<Cmd>ZenMode<CR>')

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
