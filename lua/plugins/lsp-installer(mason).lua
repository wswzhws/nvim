return {
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
        'lua-language-server', -- lua lsp
        'rust-analyzer', -- rust lsp
        'clangd', -- c/c++ lsp
        'gopls', -- go lsp
        'pyright', -- python lsp
        'cmake', -- cmake language server

        'stylua', -- lua formatter
        'verible', -- verilog/systemverilog lsp, formatter, and linter

        'codelldb', -- c/c++/rust debugger
        'delve', -- go debugger
      },
    }
  end,
}
