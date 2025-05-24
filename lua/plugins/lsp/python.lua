local PYTHON_TABLE = {}

PYTHON_TABLE.lsp = function()
  vim.lsp.enable 'pyright'
end

PYTHON_TABLE.installed = {
  'pyright',
}

PYTHON_TABLE.treesitter = {
  'python',
  'json',
  'yaml',
}

return PYTHON_TABLE
