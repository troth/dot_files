-- Make the <leader> key as early as possible so that it is set when needed
-- later.
vim.g.mapleader = ';'

require('config')
require('keymaps.general')
require('plugins')
require('setup.lsp')
require('setup.cmp')
