return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"folke/lazydev.nvim",
				ft = "lua",
				opts = {},
			},
			{ "williamboman/mason.nvim", opts = {} },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "hrsh7th/cmp-nvim-lsp" },
		},
		config = function()
			local servers = { "lua_ls", "ts_ls", "eslint", "rust_analyzer", "tailwindcss", "cssls", "clangd" }

			require("mason-lspconfig").setup({
				ensure_installed = servers,
				automatic_enable = false,
			})

			vim.lsp.config("*", {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			})

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } },
						telemetry = { enable = false },
					},
				},
			})

			vim.lsp.config("ts_ls", {
				init_options = {
					preferences = {
						includeInlayParameterNameHints = "all",
						importModuleSpecifierPreference = "non-relative",
					},
				},
			})

			vim.lsp.config("eslint", { packageManager = "bun" })

			vim.lsp.enable(servers)

			if vim.fn.executable("asm-lsp") == 1 then
				vim.filetype.add({ extension = { s = "asm", S = "asm" } })
				vim.lsp.config("asm_lsp", {
					filetypes = { "asm", "vmasm", "s", "S" },
				})
				vim.lsp.enable("asm_lsp")
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local bufopts = { noremap = true, silent = true, buffer = ev.buf }

					vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })

					vim.keymap.set("n", "<Leader>lk", vim.lsp.buf.signature_help, bufopts)
					vim.keymap.set("n", "<Leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
					vim.keymap.set("n", "<Leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
					vim.keymap.set("n", "<Leader>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, bufopts)
					vim.keymap.set("n", "<Leader>lf", function()
						require("conform").format({ bufnr = ev.buf, lsp_fallback = true })
					end, bufopts)
					vim.keymap.set("n", "<Leader>ld", function()
						vim.diagnostic.open_float({ focus = true })
					end, bufopts)
				end,
			})
		end,
	},
}
