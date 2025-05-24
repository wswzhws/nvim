-- 插件用于代码折叠
-- 1. zR 打开所有折叠
-- 2. zM 关闭所有折叠
-- 3. zr 打开除了当前折叠的所有折叠
-- 4. zm 关闭当前折叠
-- 5. zk 查看当前折叠的内容
return {
  'kevinhwang91/nvim-ufo',
  dependencies = 'kevinhwang91/promise-async',
  config = function()
    require('ufo').setup {
      provider_selector = function()
        return { 'lsp', 'indent' }
      end,
    }
    vim.o.foldcolumn = '1'
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
    vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
    vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
    vim.keymap.set('n', 'zk', require('ufo').peekFoldedLinesUnderCursor)
  end,
}
