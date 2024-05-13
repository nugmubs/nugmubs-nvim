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

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

vim.api.nvim_set_option("clipboard", "unnamed")

