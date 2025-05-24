local GO_TABLE = {}

GO_TABLE.lsp = function()
  vim.lsp.enable 'gopls'
end

GO_TABLE.installed = {
  'gopls',
  'delve',
}

GO_TABLE.treesitter = {
  'go',
  'gomod',
  'gowork',
  'gosum',
}

return GO_TABLE
