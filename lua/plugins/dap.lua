return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{ "rcarriga/nvim-dap-ui",   dependencies = { "nvim-neotest/nvim-nio" } },
			{ "williamboman/mason.nvim" },
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup()

			-- Auto-open/close UI on session start/end
			dap.listeners.after.event_initialized["dapui"] = function() dapui.open() end
			dap.listeners.before.event_terminated["dapui"] = function() dapui.close() end
			dap.listeners.before.event_exited["dapui"] = function() dapui.close() end

			-- codelldb adapter (install via :MasonInstall codelldb)
			local codelldb_path = vim.fn.stdpath("data") .. "/mason/bin/codelldb"
			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = { command = codelldb_path, args = { "--port", "${port}" } },
			}

			dap.configurations.asm = {
				{
					name = "Launch",
					type = "codelldb",
					request = "launch",
					program = function()
						local co = coroutine.running()
						Snacks.picker.files({
							cwd = vim.fn.getcwd(),
							actions = {
								confirm = function(picker, item)
									picker:close()
									coroutine.resume(co, item and Snacks.picker.util.path(item) or nil)
								end,
							},
						})
						return coroutine.yield()
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					displayFormat = "decimal",
				},
			}

			-- Keymaps
			local k = vim.keymap.set
			k("n", "<Leader>db", dap.toggle_breakpoint, { desc = "DAP toggle breakpoint" })
			k("n", "<Leader>dc", dap.continue, { desc = "DAP continue" })
			k("n", "<Leader>dn", dap.step_over, { desc = "DAP step over" })
			k("n", "<Leader>di", dap.step_into, { desc = "DAP step into" })
			k("n", "<Leader>do", dap.step_out, { desc = "DAP step out" })
			k("n", "<Leader>dq", dap.terminate, { desc = "DAP terminate" })
			k("n", "<Leader>du", dapui.toggle, { desc = "DAP toggle UI" })
		end,
	},
}
