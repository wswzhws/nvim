-- 标签配置文件，使用方法如下：
-- mm # 添加标签
-- ma # 查看所有标签
-- mc # 查看当前文件的标签
-- mn # 下一个标签
-- mp # 上一个标签

return {
  'MattesGroeger/vim-bookmarks',
  dependencies = {
    'tom-anders/telescope-vim-bookmarks.nvim',
  },
  config = function()
    vim.g.bookmark_sign = '♥'
    vim.g.bookmark_highlight_lines = 1

    require('telescope').load_extension 'vim_bookmarks'
    local keymap = vim.keymap
    keymap.set(
      'n',
      'ma',
      '<cmd>lua require("telescope").extensions.vim_bookmarks.all()<cr>'
    )
    keymap.set(
      'n',
      'mc',
      '<cmd>lua require("telescope").extensions.vim_bookmarks.current_file()<cr>'
    )
  end,
}
