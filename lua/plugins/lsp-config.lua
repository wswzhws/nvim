return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    lazy = false,
  },
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
    lspconfig.verible.setup {}
  end,
}
