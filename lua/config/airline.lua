vim.g.airline_theme = 'solarized'
vim.g.airline_powerline_fonts = 1
vim.g['airline#extensions#tabline#enabled'] = 1
vim.g['airline#extensions#tabline#show_tabs'] = 1
vim.g['airline#extensions#tabline#show_buffers'] = 0
vim.g['airline#extensions#tabline#show_splits'] = 0
vim.g['airline#extensions#tabline#show_tab_nr'] = 0
vim.g['airline#extensions#tabline#show_tab_type'] = 0
vim.g['airline#extensions#tabline#show_close_button'] = 0
vim.g['airline#extensions#tabline#switch_buffers_and_tabs'] = 0
vim.g['airline#extensions#tabline#tab_nr_type'] = 3
vim.g['airline#extensions#whitespace#mixed_indent_algo'] = 1
vim.g['airline#extensions#tabline#tabs_label'] = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')