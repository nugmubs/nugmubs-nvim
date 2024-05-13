return {
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {

      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/vim-vsnip",
    },
    config = function()
      -- Set up nvim-cmp.
      local cmp = require("cmp")

      -- require("luasnip.loaders.from_vscode").lazy_load() -- For `friendly-snippets`

      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
            -- require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-'>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-;>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }), 
          ["<C-[>"] = cmp.mapping.scroll_docs(-4),
          ["<C-]>"] = cmp.mapping.scroll_docs(4),
          ["<C-s>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = {
          { name = "path" },                    -- file paths
          { name = "nvim_lsp",               keyword_length = 3 }, -- from language server
          { name = "nvim_lsp_signature_help" }, -- display function signatures with current parameter emphasized
          { name = "nvim_lua",               keyword_length = 2 }, -- complete neovim's Lua runtime API such vim.lsp.*
          { name = "buffer",                 keyword_length = 2 }, -- source current buffer
          { name = "vsnip",                  keyword_length = 2 }, -- nvim-cmp source for vim-vsnip
          { name = "calc" },                    -- source for math calculation
        },

        formatting = {
          fields = { "menu", "abbr", "kind" },
          format = function(entry, item)
            local menu_icon = {
              nvim_lsp = "λ",
              vsnip = "⋗",
              buffer = "Ω",
              path = "🖫",
            }
            item.menu = menu_icon[entry.source.name]
            return item
          end,
        },
      })
    end,
  },
}
