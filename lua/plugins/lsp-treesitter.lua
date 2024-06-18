-- 插件用于代码高亮和自动补全
return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPre', 'BufNewFile' },
    build = ':TSUpdate',
    dependencies = {
      'windwp/nvim-ts-autotag',
      'axelvc/template-string.nvim',
    },
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'lua',
          'vim',
          'rust',
          'python',
          'c',
          'cpp',
          'cuda',
          'go',
          'verilog',
        },

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
