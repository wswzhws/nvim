return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'mrcjkb/rustaceanvim', -- rust setup here
    version = '^4', -- Recommended
    lazy = false,
    'saecki/crates.nvim',
    tag = 'stable',
  },
  config = function()
    local lspconfig = require 'lspconfig'
    local lspcrates = require 'crates'

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
    lspconfig.cmake.setup {}

    lspconfig.gopls.setup {}
    lspconfig.pyright.setup {}

    lspconfig.verible.setup {}

    lspcrates.setup()
  end,
}
