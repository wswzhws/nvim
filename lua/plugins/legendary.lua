-- 插件用于快速创建项目，快速复制行，快速查找项目
-- 使用方法：
-- 1. 使用 <leader>d 查找项目
-- 2. 使用 <leader>h 查看历史项目
-- 3. 使用 <S-A-Up> 复制当前行到上一行
-- 4. 使用 <S-A-Down> 复制当前行到下一行
--
return {
  'mrjones2014/legendary.nvim',
  dependencies = {
    'hinell/duplicate.nvim',
  },
  priority = 10000,
  lazy = false,
  config = function()
    local legendary = require 'legendary'
    legendary.keymaps {
      -- duplicate
      {
        description = 'Line: duplicate up',
        mode = { 'n' },
        '<S-A-Up>',
        '<CMD>LineDuplicate -1<CR>',
      },
      {
        description = 'Line: duplicate down',
        mode = { 'n' },
        '<S-A-Down>',
        '<CMD>LineDuplicate +1<CR>',
      },
      {
        description = 'Selection: duplicate up',
        mode = { 'v' },
        '<S-A-Up>',
        '<CMD>VisualDuplicate -1<CR>',
      },
      {
        description = 'Selection: duplicate down',
        mode = { 'v' },
        '<S-A-Down>',
        '<CMD>VisualDuplicate +1<CR>',
      },
      -- project
      {
        description = 'find a project based on patterns',
        mode = { 'n' },
        '<leader>d',
        '<CMD>Telescope neovim-project discover<CR>',
      },
      {
        description = 'select a project from your recent history',
        mode = { 'n' },
        '<leader>h',
        '<CMD>Telescope neovim-project history<CR>',
      },
    }
  end,
}
