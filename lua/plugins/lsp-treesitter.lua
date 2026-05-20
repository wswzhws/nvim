return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    dependencies = {
      {
        'windwp/nvim-ts-autotag',
        opts = {
          opts = {
            enable_close = true,
            enable_rename = true,
            enable_close_on_slash = false,
          },
        },
      },
      'axelvc/template-string.nvim',
    },
    config = function()
      local parsers = {
        'rust',
        'markdown',
        'markdown_inline',
      }
      vim.list_extend(parsers, require('plugins.lsp.c_cpp').treesitter)
      vim.list_extend(parsers, require('plugins.lsp.python').treesitter)
      vim.list_extend(parsers, require('plugins.lsp.lua').treesitter)
      vim.list_extend(parsers, require('plugins.lsp.go').treesitter)
      vim.list_extend(parsers, require('plugins.lsp.verilog').treesitter)

      local treesitter = require 'nvim-treesitter'
      local available = {}
      for _, parser in ipairs(treesitter.get_available()) do
        available[parser] = true
      end

      parsers = vim.tbl_filter(function(parser)
        return available[parser]
      end, parsers)

      treesitter.install(parsers)

      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup(
          'UserTreesitterStart',
          { clear = true }
        ),
        callback = function(args)
          pcall(vim.treesitter.start, args.buf)
        end,
      })

      require('template-string').setup {}
    end,
  },
}
