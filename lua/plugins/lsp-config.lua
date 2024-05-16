return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "rust_analyzer", "tsserver" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"simrat39/rust-tools.nvim",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			-- setup language servers
			lspconfig.lua_ls.setup({
				-- capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				-- capabilities = capabilities,
			})
			lspconfig.rust_analyzer.setup({
				-- capabilities = capabilities,
			})
      lspconfig.pyright.setup({
        
      })
			local rt = require("rust-tools")
			local mason_registry = require("mason-registry")

			local codelldb = mason_registry.get_package("codelldb")
			local extension_path = codelldb:get_install_path() .. "/extension/"
			local codelldb_path = extension_path .. "adapter/codelldb"
			local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
			rt.setup({
				dap = {
					adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
				},
				server = {
					capabilities = require("cmp_nvim_lsp").default_capabilities(),
					on_attach = function(_, bufnr)
						-- Hover actions
						vim.keymap.set("n", "<Leader>k", rt.hover_actions.hover_actions, { buffer = bufnr })
						-- Code action groups
						vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
					end,
				},
				tools = {
					hover_actions = {
						auto_focus = true,
					},
				},
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
