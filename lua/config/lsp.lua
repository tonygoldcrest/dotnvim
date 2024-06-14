require("mason").setup()
require("mason-lspconfig").setup {
	automatic_installation = true,
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require('lspconfig')

vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		local bufopts = { noremap = true, silent = true, buffer = ev.buf }
		vim.lsp.inlay_hint.enable(true)
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
		vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
		vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
		vim.keymap.set('n', '<Leader>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, bufopts)
		-- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
		vim.keymap.set('n', '<Leader>lr', vim.lsp.buf.rename, bufopts)
		vim.keymap.set('n', '<Leader>la', vim.lsp.buf.code_action, bufopts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
		vim.keymap.set('n', '<Leader>lf', vim.lsp.buf.format, bufopts)
	end,
})

lspconfig.lua_ls.setup {
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim', 'use' },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}

lspconfig.tsserver.setup {
	capabilities = capabilities,
	init_options = {
		maxTsServerMemory = 12288,
		preferences = {
			includeInlayParameterNameHints = 'all',
			-- includeInlayParameterNameHintsWhenArgumentMatchesName = true,
			includeInlayFunctionParameterTypeHints = true,
			-- includeInlayVariableTypeHints = true,
			includeInlayPropertyDeclarationTypeHints = true,
			-- includeInlayFunctionLikeReturnTypeHints = true,
			-- includeInlayEnumMemberValueHints = true,
			importModuleSpecifierPreference = 'non-relative',
		},
	},
}

lspconfig.eslint.setup {
	packageManager = 'yarn'
}

lspconfig.ccls.setup {
	capabilities = capabilities,
	init_options = {
		clang = {
			extraArgs = {
				"-isystem/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/c++/v1",
				"-isystem/Library/Developer/CommandLineTools/usr/lib/clang/15.0.0/include",
				"-isystem/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include",
				"-isystem/Library/Developer/CommandLineTools/usr/include",
				"-isystem/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks"
			},
			resourceDir = "/Library/Developer/CommandLineTools/usr/lib/clang/15.0.0"
		},
	},
}

lspconfig.rust_analyzer.setup {
	capabilities = capabilities,
}

-- lspconfig.clangd.setup {
-- 	capabilities = capabilities,
-- 	cmd = {'clangd', '--query-driver=/usr/bin/g++'},
-- }

require("lsp-file-operations").setup()
