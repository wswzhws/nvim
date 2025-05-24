local PYTHON_TABLE = {}

PYTHON_TABLE.lsp = function()
  local lspconfig = require 'lspconfig'
  lspconfig.pyright.setup {}
end

PYTHON_TABLE.installed = {
  'pyright',
}

return PYTHON_TABLE
