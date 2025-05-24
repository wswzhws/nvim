local VERILOG_TABLE = {}

VERILOG_TABLE.lsp = function()
  local lspconfig = require 'lspconfig'
  lspconfig.verible.setup {}
end

VERILOG_TABLE.installed = {
  'verible',
}

return VERILOG_TABLE
