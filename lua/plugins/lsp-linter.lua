-- 插件用于代码检查
return {
  'mfussenegger/nvim-lint',
  config = function()
    require('lint').linters_by_ft = {
      -- python = { 'ruff' },
      -- add linters here
    }
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
}
