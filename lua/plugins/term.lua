return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    keys = [[<C-\>]],
    opts = {
      open_mapping = [[<C-\>]],
      size = 20,
      hide_numbers = true,
      shell = vim.opt.shell:get(),
      shade_terminals = true,
      shading_factor = 2,
      persist_size = true,
      start_in_insert = true,
      direction = 'float',
      close_on_exit = true,
      float_opts = { border = 'curved' },
    },
  },
}
