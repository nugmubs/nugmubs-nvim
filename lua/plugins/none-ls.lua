return {
	"nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua, -- lua formatter
        null_ls.builtins.formatting.prettier, -- web relavant formatter
        null_ls.builtins.formatting.black, -- python formatter
        null_ls.builtins.formatting.isort, -- python formatter (2) 
        null_ls.builtins.diagnostics.rubocop, -- ruby linter 
        -- null_ls.builtins.diagnostics.eslint_d, -- web relavant linter -- THIS IS NOT WORKING
        require('none-ls.diagnostics.eslint_d'), -- alternatives for null_ls.builtin.... blah
        null_ls.builtins.formatting.rubocop, -- ruby formatter 
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

	end,
}
