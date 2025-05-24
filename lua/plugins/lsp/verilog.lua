local VERILOG_TABLE = {}

VERILOG_TABLE.lsp = function()
  vim.lsp.enable 'verible'
end

VERILOG_TABLE.installed = {
  'verible',
}

VERILOG_TABLE.treesitter = {
  'verilog',
}

return VERILOG_TABLE
