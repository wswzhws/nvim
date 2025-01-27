return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'mrcjkb/rustaceanvim', -- rust setup here
    version = '^4', -- Recommended
    lazy = false,
  },
  config = function()
    local lspconfig = require 'lspconfig'

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
    lspconfig.pyright.setup {}
  end,
}
