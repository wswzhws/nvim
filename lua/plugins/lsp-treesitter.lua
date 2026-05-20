return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    event = { 'BufReadPre', 'BufNewFile' },
    build = ':TSUpdate',
    dependencies = {
      'windwp/nvim-ts-autotag',
      'axelvc/template-string.nvim',
    },
    config = function()
      local configTable = vim.tbl_extend(
        'force',
        {
          'rust',
          'markdown',
          'markdown_inline',
        },
        require('plugins.lsp.c_cpp').treesitter,
        require('plugins.lsp.python').treesitter,
        require('plugins.lsp.lua').treesitter,
        require('plugins.lsp.go').treesitter,
        require('plugins.lsp.verilog').treesitter
      )

      require('nvim-treesitter.config').setup {
        ensure_installed = configTable,

        sync_install = false,
        auto_install = true,

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        autotag = {
          enable = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<enter>',
            node_incremental = '<enter>',
            scope_incremental = false,
            node_decremental = '<bs>',
          },
        },
      }

      require('template-string').setup {}
    end,
  },
}
