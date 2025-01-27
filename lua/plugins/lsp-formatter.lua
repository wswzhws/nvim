-- 格式化代码相关配置 --
return {
  'stevearc/conform.nvim',
  lazy = true,
  event = { 'BufReadPre', 'BufNewFile' }, -- to disable, comment this out
  config = function()
    require('conform').setup {
      formatters_by_ft = {
        lua = { 'stylua' },
      },

      format_on_save = {
        pattern = '*.lua',
        timeout_ms = 500,
        async = false,
        lsp_fallback = true,
      },
    }
  end,
}
