return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").install({
				"typescript", "javascript", "tsx", "lua", "vim", "vimdoc", "rust", "css", "cpp", "asm"
			})

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "*",
				callback = function()
					local ok = pcall(vim.treesitter.start)
					local ft = vim.bo.filetype
					if ok and ft ~= "c" and ft ~= "cpp" and ft ~= "asm" then
						vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})
		end,
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-context",
				config = function()
					require("treesitter-context").setup({ max_lines = 4 })
				end,
			},
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				branch = "main",
				config = function()
					local select = require("nvim-treesitter-textobjects.select")
					local move   = require("nvim-treesitter-textobjects.move")
					local swap   = require("nvim-treesitter-textobjects.swap")
					local rep    = require("nvim-treesitter-textobjects.repeatable_move")

					-- Select
					local sel = function(obj) return function() select.select_textobject(obj, "textobjects") end end
					vim.keymap.set({ "x", "o" }, "af", sel("@function.outer"), { desc = "outer function" })
					vim.keymap.set({ "x", "o" }, "if", sel("@function.inner"), { desc = "inner function" })
					vim.keymap.set({ "x", "o" }, "ac", sel("@class.outer"),    { desc = "outer class" })
					vim.keymap.set({ "x", "o" }, "ic", sel("@class.inner"),    { desc = "inner class" })
					vim.keymap.set({ "x", "o" }, "aa", sel("@parameter.outer"), { desc = "outer parameter" })
					vim.keymap.set({ "x", "o" }, "ia", sel("@parameter.inner"), { desc = "inner parameter" })
					vim.keymap.set({ "x", "o" }, "ab", sel("@block.outer"),    { desc = "outer block" })
					vim.keymap.set({ "x", "o" }, "ib", sel("@block.inner"),    { desc = "inner block" })

					-- Move (repeatable with ; and ,)
					local next_fn_start  = rep.make_repeatable_move(function() move.goto_next_start("@function.outer", "textobjects") end)
					local prev_fn_start  = rep.make_repeatable_move(function() move.goto_previous_start("@function.outer", "textobjects") end)
					local next_fn_end    = rep.make_repeatable_move(function() move.goto_next_end("@function.outer", "textobjects") end)
					local prev_fn_end    = rep.make_repeatable_move(function() move.goto_previous_end("@function.outer", "textobjects") end)
					local next_cls_start = rep.make_repeatable_move(function() move.goto_next_start("@class.outer", "textobjects") end)
					local prev_cls_start = rep.make_repeatable_move(function() move.goto_previous_start("@class.outer", "textobjects") end)

					vim.keymap.set({ "n", "x", "o" }, "]f", next_fn_start,  { desc = "next function start" })
					vim.keymap.set({ "n", "x", "o" }, "[f", prev_fn_start,  { desc = "prev function start" })
					vim.keymap.set({ "n", "x", "o" }, "]F", next_fn_end,    { desc = "next function end" })
					vim.keymap.set({ "n", "x", "o" }, "[F", prev_fn_end,    { desc = "prev function end" })
					vim.keymap.set({ "n", "x", "o" }, "]c", next_cls_start, { desc = "next class start" })
					vim.keymap.set({ "n", "x", "o" }, "[c", prev_cls_start, { desc = "prev class start" })

					vim.keymap.set({ "n", "x", "o" }, ";", rep.repeat_last_move_next)
					vim.keymap.set({ "n", "x", "o" }, ",", rep.repeat_last_move_previous)

					-- Swap parameters
					vim.keymap.set("n", "<M-l>", function() swap.swap_next("@parameter.inner") end,     { desc = "swap next parameter" })
					vim.keymap.set("n", "<M-h>", function() swap.swap_previous("@parameter.inner") end, { desc = "swap prev parameter" })
				end,
			},
		},
	},
}
