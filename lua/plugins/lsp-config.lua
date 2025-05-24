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
    'mason-org/mason.nvim',
    opts = {
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    },
  },

  {
    'mason-org/mason-lspconfig.nvim',
    opts = {},
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      'neovim/nvim-lspconfig',
    },
  },

  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    config = function()
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
