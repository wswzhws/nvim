-- 插件用于代码检查
return {
  'mfussenegger/nvim-lint',
  config = function()
    require('lint').linters_by_ft = {
      c = { 'clangtidy' },
      cpp = { 'clangtidy' },
      -- sudo apt install clang-tidy
      -- brew install llvm
      go = { 'golangcilint' },
      -- go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
      -- verilog = { 'verible' },
      -- systemverilog = { 'verible' },
    }
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      callback = function()
        require('lint').try_lint()
      end,
    })
  end,
}
