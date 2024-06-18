-- 更好的项目管理
return {
  'coffebar/neovim-project',
  opts = {
    projects = { -- define project roots
      '~/.config/*',
      '~/Documents/CodeBox/*',
    },
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
