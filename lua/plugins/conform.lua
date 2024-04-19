-- 格式化代码相关配置 --
return {
  'stevearc/conform.nvim',
  lazy = true,
  event = { 'BufReadPre', 'BufNewFile' }, -- to disable, comment this out
  config = function()
    require('conform').setup {
      formatters_by_ft = {
        lua = { 'stylua' },
        verilog = { 'verible' },
        systemverilog = { 'verible' },
        c = { 'clang-format' },
        cpp = { 'clang-format' },
        go = { 'gofmt' },
      },

      format_on_save = {
        pattern = '*.lua,*.v,*.sv,*.c,*.cpp,*.go,*.h,*.hpp',
        timeout_ms = 500,
        async = false,
        lsp_fallback = true,
      },
    }
  end,
}
