vim.g.mapleader = ' '
local keymap = vim.keymap

-- 设置从系统剪贴板复制粘贴
keymap.set({ 'n', 'x' }, '<leader>p', '"0p')

keymap.set('n', 'j', [[v:count?'j':'gj']], { noremap = true, expr = true })
keymap.set('n', 'k', [[v:count?'k':'gk']], { noremap = true, expr = true })

keymap.set('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear search highlights' })
keymap.set('i', 'jk', '<esc>', { noremap = true })

keymap.set('n', '<C-q>', '<cmd>wq<cr>')

keymap.set('n', 'H', '<C-w>h')
keymap.set('n', 'J', '<C-w>j')
keymap.set('n', 'K', '<C-w>k')
keymap.set('n', 'L', '<C-w>l')
