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

    -- c/cpp
    lspconfig.clangd.setup {}

    -- golang
    lspconfig.gopls.setup {}

    -- prisma
    lspconfig.prismals.setup {}
  end,
}
