local CPP_TABLE = {}

CPP_TABLE.lsp = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  vim.filetype.add {
    pattern = {
      ['.*%.bazelrc'] = 'bazelrc',
      ['bazelrc'] = 'bazelrc',
      ['%.bazelrc'] = 'bazelrc',
    },
  }

  vim.lsp.config('neocmake', {
    capabilities = capabilities,
  })

  vim.lsp.enable 'clangd'
  vim.lsp.enable 'starpls'
  vim.lsp.enable 'bazelrc-lsp'
end

CPP_TABLE.installed = {
  'codelldb',
  'clangd',
  'neocmake',
  'starpls',
  'bazelrc-lsp',
}

CPP_TABLE.treesitter = {
  'c',
  'cpp',
  'cuda',
}

return CPP_TABLE
