return {
  'stevearc/conform.nvim',
  lazy = true,
  event = { 'BufReadPre', 'BufNewFile' }, -- to disable, comment this out
  config = function()
    require('conform').setup {
      formatters_by_ft = {
        lua = { 'stylua' },
        markdown = { 'prettierd' },
      },

      format_on_save = {
        pattern = '*.lua,*.md',
        timeout_ms = 500,
        async = false,
        lsp_fallback = true,
      },
    }
  end,
}
