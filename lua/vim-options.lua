vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false

-- Navigation vim panes
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>") -- up arrow 
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>") -- down arrow  
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>") -- left arrow 
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>") -- right arrow 

vim.keymap.set('n', '<leader>nh', ':nohlsearch<CR>')
vim.wo.number = true

vim.api.nvim_set_option("clipboard", "unnamed")

-- LSP Diagnostics Options Setup 
local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
