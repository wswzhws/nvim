local platform = require 'utils.platform'

return {
  'coffebar/neovim-project',
  opts = {
    projects = { -- define project roots
      platform.join(platform.home(), '.config', '*'),
      platform.join(platform.home(), 'Documents', 'CodeBox', '*'),
      platform.join(platform.home(), 'Documents', 'CodeBox', '*_box', '*'),
    },
    last_session_on_startup = false,
  },

  init = function()
    -- enable saving the state of plugins in the session
    vim.opt.sessionoptions:append 'globals' -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
  end,
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'Shatur/neovim-session-manager' },
  },
  lazy = false,
  priority = 100,
}
