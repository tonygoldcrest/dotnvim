return {
	{
		"nvim-mini/mini.nvim",
		version = "*",
		keys = {
			{ "<Leader>r", function() local _ = MiniFiles.close() or MiniFiles.open() end, desc = "File explorer" },
			{
				"<Leader>f",
				function()
					local _ = MiniFiles.close() or MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
					vim.defer_fn(function() MiniFiles.reveal_cwd() end, 30)
				end,
				desc = "File explorer (current file)"
			},
		},
		config = function()
			require("mini.files").setup()

			vim.api.nvim_create_autocmd("User", {
				pattern = "MiniFilesBufferCreate",
				callback = function(args)
					local buf = args.data.buf_id
					local open_split = function(direction)
						local entry = MiniFiles.get_fs_entry()
						if not entry or entry.fs_type ~= "file" then return end
						MiniFiles.close()
						vim.cmd(direction .. " " .. vim.fn.fnameescape(entry.path))
					end
					vim.keymap.set("n", "<C-s>", function() open_split("split") end, { buffer = buf })
					vim.keymap.set("n", "<C-v>", function() open_split("vsplit") end, { buffer = buf })
					vim.keymap.set("n", "gy", function()
						local entry = MiniFiles.get_fs_entry()
						if not entry then return end
						vim.fn.setreg("+", entry.path)
						vim.notify("Copied: " .. entry.path, vim.log.levels.INFO)
					end, { buffer = buf })
				end,
			})

			-- Replaces vim-surround + vim-repeat
			-- Mappings match vim-surround: ys{motion}, cs, ds, visual S
			require("mini.surround").setup({
				mappings = {
					add = "<Leader>sa",
					delete = "<Leader>sd",
					replace = "<Leader>sr",
					find = "",
					find_left = "",
					highlight = "",
					update_n_lines = "",
				},
			})

			-- Replaces cappyzawa/trim.nvim
			require("mini.trailspace").setup()
			vim.api.nvim_create_autocmd("BufWritePre", {
				callback = function() MiniTrailspace.trim() end,
			})
		end,
	},
}
