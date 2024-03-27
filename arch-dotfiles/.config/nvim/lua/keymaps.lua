-- keymaps.lua
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- General Keymaps
map('n', '<F5>', ':set list!<CR>', opts)

-- leader key

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Split navigation
map('n', '<C-J>', '<C-W><C-J>', opts)
map('n', '<C-K>', '<C-W><C-K>', opts)
map('n', '<C-L>', '<C-W><C-L>', opts)
map('n', '<C-H>', '<C-W><C-H>', opts)

-- Jump enhancements
map('n', '<C-e>', '3<C-e>', opts)
map('n', '<C-y>', '3<C-y>', opts)

-- Folding
map('n', '<leader>i', 'za', opts)

-- File and directory yanking
map('n', 'gf', ':vert winc f<cr>', opts)
map('n', 'yf', ':let @+=expand(\'%:p\')<CR>', opts)
map('n', 'yd', ':let @+=expand(\'%:p:h\')<CR>', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)
