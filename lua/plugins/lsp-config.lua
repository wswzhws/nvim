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

      local tools = {}
      vim.list_extend(tools, require('plugins.lsp.lua').installed)
      vim.list_extend(tools, require('plugins.lsp.c_cpp').installed)
      vim.list_extend(tools, require('plugins.lsp.go').installed)
      vim.list_extend(tools, require('plugins.lsp.python').installed)
      vim.list_extend(tools, require('plugins.lsp.verilog').installed)
      require('mason-tool-installer').setup {
        ensure_installed = tools,
      }
    end,
  },
}
