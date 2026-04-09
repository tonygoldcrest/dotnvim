require 'nvim-treesitter.configs'.setup {
	ensure_installed = { 'typescript', 'javascript', 'lua', 'vim', 'vimdoc', 'rust', 'css', 'cpp' },
	highlight = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
	indent = {
		enable = true
	}
}

require('nvim-treesitter.configs').setup {}
