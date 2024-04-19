-- TODO Comment plugin configurations
-- Usage:
--  - `]t` to jump to the next todo comment
--  - `[t` to jump to the previous todo comment
--  - `<leader>t` to open the todo comments in TodoTelescope
--  - `:TodoTelescope` to open the todo comments in TodoTelescope
--  TODO: Add more configurations
--  FIXME: Add more configurations
--  HACK: Add more configurations
--  WARN: Add more configurations
--  NOTE: Add more configurations
--  OPTIMIZE: Add more configurations
--  TEST: Add more configurations
return {
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    vim.keymap.set('n', ']t', function()
      require('todo-comments').jump_next()
    end, { desc = 'Next todo comment' })

    vim.keymap.set('n', '[t', function()
      require('todo-comments').jump_prev()
    end, { desc = 'Previous todo comment' })

    vim.keymap.set(
      'n',
      '<leader>t',
      '<cmd>TodoTelescope<cr>',
      { desc = 'Previous todo comment' }
    )

    require('todo-comments').setup()
  end,
}
