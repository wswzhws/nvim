-- 插件用于设置快捷键映射，快速查找项目
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
      -- project
      {
        description = 'find a project based on patterns',
        mode = { 'n' },
        '<leader>j',
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
