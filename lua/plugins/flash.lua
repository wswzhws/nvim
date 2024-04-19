-- 该插件用于高亮当前光标所在的单词
-- 使用方法:
-- 1. 按下s键，高亮当前光标所在的单词
-- 2. 按下S键，高亮当前光标所在的单词，并且高亮当前光标所在的单词的语法树
return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = {},
  keys = {
    {
      's',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump()
      end,
      desc = 'Flash',
    },
    {
      'S',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').treesitter()
      end,
      desc = 'Flash Treesitter',
    },
  },
}
