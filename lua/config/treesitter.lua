require'nvim-treesitter.configs'.setup {
	ensure_installed = 'all',
	context_commentstring = {
		enable = true
	},
	highlight = {
		enable = true,              -- false will disable the whole extension
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	}
}
