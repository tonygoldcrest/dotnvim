require('nvim-lsp-installer').setup({
        automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
        ui = {
                icons = {
                        server_installed = "✓",
                        server_pending = "➜",
                        server_uninstalled = "✗"
                }
        }
})


require('config.nvim-cmp')

require'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim', 'use'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
