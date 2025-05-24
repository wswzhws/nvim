local CPP_TABLE = {}

CPP_TABLE.lsp = function()
  local lspconfig = require 'lspconfig'

  local configs = require 'lspconfig/configs'
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

  lspconfig.neocmake.setup {
    capabilities = capabilities,
  }

  lspconfig.clangd.setup {}
end

CPP_TABLE.installed = {
  'codelldb',
  'clangd',
  'neocmake',
}

return CPP_TABLE
