return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins.lsp.lua').lsp()
      require('plugins.lsp.c_cpp').lsp()
      require('plugins.lsp.go').lsp()
      require('plugins.lsp.python').lsp()
      require('plugins.lsp.verilog').lsp()
    end,
  },

  {
    'mrcjkb/rustaceanvim', -- rust setup here
    version = '^4', -- Recommended
    lazy = false,
    'saecki/crates.nvim',
    tag = 'stable',
    config = function()
      require('plugins.lsp.rust').lsp()
    end,
  },

  {
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
      require('mason').setup {
        ui = {
          icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
          },
        },
      }

      require('mason-lspconfig').setup {}
      require('mason-tool-installer').setup {
        ensure_installed = {
          require('plugins.lsp.c_cpp').installed,
          require('plugins.lsp.lua').installed,
          require('plugins.lsp.go').installed,
          require('plugins.lsp.python').installed,
          require('plugins.lsp.verilog').installed,
        },
      }
    end,
  },
}
