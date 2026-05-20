return {
  'stevearc/conform.nvim',
  lazy = true,
  event = { 'BufReadPre', 'BufNewFile' }, -- to disable, comment this out
  config = function()
    local configTable = vim.tbl_extend(
      'force',
      {},
      require('plugins.lsp.lua').format,
      require('plugins.lsp.c_cpp').format
    )

    require('conform').setup {
      formatters_by_ft = configTable,

      format_on_save = function(bufnr)
        local format_on_save_filetypes = {
          bazel = true,
          bzl = true,
          lua = true,
        }

        if not format_on_save_filetypes[vim.bo[bufnr].filetype] then
          return
        end

        return {
          timeout_ms = 500,
          lsp_format = 'fallback',
        }
      end,
    }
  end,
}
