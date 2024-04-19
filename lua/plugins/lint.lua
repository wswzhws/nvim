-- 插件用于代码检查
return {
  'mfussenegger/nvim-lint',
  config = function()
    require('lint').linters_by_ft = {
      c = { 'clang-tidy' },
      cpp = { 'clang-tidy' },
      go = { 'golangci-lint' },
      rust = { 'cargo' },
      verilog = { 'verible' },
      systemverilog = { 'verible' },
    }
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
}
