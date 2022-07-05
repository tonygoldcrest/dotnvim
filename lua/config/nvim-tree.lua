require('nvim-tree').setup({
    sort_by = 'case_sensitive',
    open_on_setup = true,
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = '.', action = 'toggle_dotfiles' },
                { key = 'H', action = '' },
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    update_focused_file = {
        enable = true,
    },
})
