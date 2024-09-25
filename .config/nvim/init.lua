vim.api.nvim_set_keymap('v', '<Space>c', '"+y', { noremap = true, silent = true })
vim.opt.clipboard = 'unnamedplus'


require('config.options')
require('plugins.plugins')
require('plugins.tokyonight')
require('plugins.lsp')

require('plugins.lualine')

require("plugins.nvim-tree")
require("config.keymaps")

require('plugins.comment')
require("plugins.nvim-autopairs")

require('plugins.bufferline')
require('plugins.gitsigns')

require('plugins.telescope')
