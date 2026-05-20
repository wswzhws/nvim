return {
  'akinsho/toggleterm.nvim',
  config = function()
    local platform = require 'utils.platform'

    require('toggleterm').setup {
      -- use Ctrl + \ to open terminal
      open_mapping = [[<c-\>]],
      direction = 'float',
      float_opts = {
        border = 'curved',
        width = platform.is_windows and 110 or 130,
        height = 30,
      },
    }
  end,
}
