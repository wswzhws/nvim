return {
  'neovim/nvim-lspconfig',
  'slint-ui/vim-slint',
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
    lspconfig.rust_analyzer.setup {}
  end,

  -- rust tools
  'mrcjkb/rustaceanvim',
  version = '^4', -- Recommended
  lazy = false,
}
