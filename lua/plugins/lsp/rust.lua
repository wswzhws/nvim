local RUST_TABLE = {}

RUST_TABLE.lsp = function()
  local lspcrates = require 'crates'
  lspcrates.setup()
end

return RUST_TABLE
