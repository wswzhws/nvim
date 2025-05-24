local RUST_TABLE = {}

RUST_TABLE.lsp = function()
  local lspcrates = require 'crates'
  lspcrates.setup()
end

RUST_TABLE.installed = {
  'rust-analyzer',
}

return RUST_TABLE
