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
vim.keymap.set('n', '<Leader>a', '<Cmd>Telescope live_grep<CR>')

-- ZenMode
vim.keymap.set('n', '<Leader>z', '<Cmd>ZenMode<CR>')
