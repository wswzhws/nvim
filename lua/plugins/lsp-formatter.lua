return {
  'stevearc/conform.nvim',
  lazy = true,
  event = { 'BufReadPre', 'BufNewFile' }, -- to disable, comment this out
  config = function()
    local configTable =
      vim.tbl_extend('force', {}, require('plugins.lsp.lua').format)

    require('conform').setup {
      formatters_by_ft = configTable,

      format_on_save = {
        pattern = '*.lua',
        timeout_ms = 500,
        async = false,
        lsp_fallback = true,
      },
    }
  end,
}
