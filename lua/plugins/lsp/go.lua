local GO_TABLE = {}

GO_TABLE.lsp = function()
  local lspconfig = require 'lspconfig'
  lspconfig.gopls.setup {}
end

GO_TABLE.installed = {
  'gopls',
  'delve',
}

return GO_TABLE
