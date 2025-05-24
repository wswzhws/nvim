return {
  'mfussenegger/nvim-lint',

  config = function()
    local configTable = vim.tbl_extend('force', {}, {})

    require('lint').linters_by_ft = configTable
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
}
