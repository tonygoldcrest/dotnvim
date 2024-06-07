vim.filetype.add({ extension = { wgsl = "wgsl" } })

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.wgsl = {
	install_info = {
		url = "https://github.com/szebniok/tree-sitter-wgsl",
		files = { "src/parser.c" }
	},
}

require 'nvim-treesitter.configs'.setup {
	ensure_installed = { 'typescript', 'javascript', 'lua', 'vim', 'vimdoc', 'wgsl', 'rust', 'css', 'cpp' },
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
