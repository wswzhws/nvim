return {
  'akinsho/toggleterm.nvim',
  config = function()
    require('toggleterm').setup {
      -- use Ctrl + \ to open terminal
      open_mapping = [[<c-\>]],
      direction = 'float',
      float_opts = {
        border = 'curved',
        width = 130,
        height = 30,
      },
    }
  end,
}
