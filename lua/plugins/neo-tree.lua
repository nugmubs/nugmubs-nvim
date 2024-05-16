--return {
--  "nvim-neo-tree/neo-tree.nvim",
--
--  optional = true,
--  opts = function(_, opts)
--    opts.open_files_do_not_replace_types = opts.open_files_do_not_replace_types
--      or { "terminal", "Trouble", "qf", "Outline", "trouble" }
--    table.insert(opts.open_files_do_not_replace_types, "edgy")
--  end,
--}
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		vim.keymap.set("n", "<c-n>", ":Neotree filesystem reveal left<CR>")
	end,
	opts = {
		filesystem = {
			filtered_items = {
        visible = true,
				hide_dotfiles = false,
				hide_gitignored = true,
				hide_by_name = {
					".github",
					".gitignore",
					"package-lock.json",
				},
				never_show = { ".git" },
			},
		},
	},
}
