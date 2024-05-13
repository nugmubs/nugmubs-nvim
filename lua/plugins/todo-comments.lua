return {
	-- todo-comments.nvim
	-- TODO: do something 
	-- HACK: weird code warning 
  -- FIX: THIS SHOULD BE FIXED
  -- WARN: warning
  -- PERF: OPTIMIZE 
  -- NOTE: Information 
  -- TEST: testing... 
  --
  -- see https://github.com/folke/todo-comments.nvim?tab=readme-ov-file
  {
		"folke/todo-comments.nvim",
		event = "BufRead",
		config = function()
			require("todo-comments").setup()

			vim.keymap.set("n", "]t", function()
				require("todo-comments").jump_next()
			end, { desc = "Next todo comment" })

			vim.keymap.set("n", "[t", function()
				require("todo-comments").jump_prev()
			end, { desc = "Previous todo comment" })

      vim.keymap.set("n", "<leader>tl", ":TodoLocList<CR>")
      vim.keymap.set("n", "<leader>tq", ":TodoQuickFix<CR>")
      vim.keymap.set("n", "<leader>tt", ":TodoTelescope<CR>")
		end,
	},
}
