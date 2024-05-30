return {
  'neovim/nvim-lspconfig',
  config = function()
    local lspconfig = require 'lspconfig'

    -- lua
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    }

    lspconfig.clangd.setup {}
    lspconfig.gopls.setup {}
    lspconfig.rust_analyzer.setup {}
    lspconfig.verible.setup {}
    lspconfig.slint_lsp.setup {}
  end,
}
