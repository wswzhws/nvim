vim.g.mapleader = ' '
local keymap = vim.keymap

-- 设置从系统剪贴板复制粘贴
keymap.set({ 'n', 'x' }, '<leader>p', '"0p')

keymap.set('n', 'j', [[v:count?'j':'gj']], { noremap = true, expr = true })
keymap.set('n', 'k', [[v:count?'k':'gk']], { noremap = true, expr = true })

keymap.set('n', '<leader>nh', ':nohl<CR>', { desc = 'Clear search highlights' })
keymap.set('i', 'jk', '<esc>', { noremap = true })

-- keymap.set('n', '<leader>q', '<cmd>q<cr>')
-- keymap.set('n', '<leader>w', '<cmd>w<cr>')
-- keymap.set('n', '<leader>x', '<cmd>x<cr>')
