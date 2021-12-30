local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true }

-- Make it easier to jump between splits.
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)
