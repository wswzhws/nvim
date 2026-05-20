return {
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('plugins.lsp.lua').lsp()
      require('plugins.lsp.c_cpp').lsp()
      require('plugins.lsp.go').lsp()
      require('plugins.lsp.python').lsp()
      require('plugins.lsp.verilog').lsp()
      -- Fix for clangd AST errors after file saves
      vim.api.nvim_create_autocmd('BufWritePost', {
        pattern = { '*.c', '*.cpp', '*.h', '*.hpp' },
        group = vim.api.nvim_create_augroup(
          'clangd-reload-fix',
          { clear = true }
        ),
        callback = function()
          -- Only reload if clangd is attached to this buffer
          local clients = vim.lsp.get_clients { bufnr = 0, name = 'clangd' }
          if #clients > 0 then
            vim.cmd 'silent! edit'
          end
        end,
      })
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
