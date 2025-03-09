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
    local configs = require 'lspconfig/configs'
    local lspconfig = require 'lspconfig'
    local lspcrates = require 'crates'

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    configs.neocmake = {
      default_config = {
        single_file_support = true, -- suggested
        init_options = {
          format = { enable = true },
          lint = { enable = true },
        },
      },
    }

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
    lspconfig.neocmake.setup {
      capabilities = capabilities,
    }

    lspconfig.gopls.setup {}
    lspconfig.pyright.setup {}

    lspconfig.verible.setup {}

    lspcrates.setup()
  end,
}
