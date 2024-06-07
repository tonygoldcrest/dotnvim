require('nvim-tree').setup({
	sort_by = 'case_sensitive',
	-- open_on_setup = true,
	view = {
		adaptive_size = true,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
	},
	update_focused_file = {
		enable = true,
	},
})
