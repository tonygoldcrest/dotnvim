require'nvim-treesitter.configs'.setup {
    ensure_installed = { 'typescript', 'javascript', 'lua', 'vim', 'vimdoc' },
    ignore_install = { 'phpdoc' },
    context_commentstring = {
        enable = true
    },
    highlight = {
        enable = true,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    },
    indent = {
        -- enable = true
    }
}
