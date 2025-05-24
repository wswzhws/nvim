local LUA_TABLE = {}

LUA_TABLE.lsp = function()
  local lspconfig = require 'lspconfig'
  lspconfig.lua_ls.setup {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
      },
    },
  }
end

LUA_TABLE.installed = {
  'lua-language-server',
  'stylua',
}

LUA_TABLE.format = {
  lua = { 'stylua' },
}

return LUA_TABLE
