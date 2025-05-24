return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require 'telescope.builtin'
      local keymap = vim.keymap
      keymap.set('n', '<leader>f', builtin.find_files, {})
      keymap.set('n', '<leader>g', builtin.live_grep, {})

      local actions = require 'telescope.actions'
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['esc'] = actions.close,
            },
            n = {
              ['q'] = actions.close,
            },
          },
          file_ignore_patterns = {
            'codegen.ts',
            '.git',
            'lazy-lock.json',
            '*-lock.yaml',
            'node_modules',
            '%.lock',
            'target/*',
          },
          dynamic_preview_title = true,
          path_display = { 'smart' },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
        layout_config = {
          horizontal = {
            preview_cutoff = 100,
            preview_width = 0.5,
          },
        },
      }
    end,
  },
  {
    'mrjones2014/legendary.nvim',
    dependencies = {
      'hinell/duplicate.nvim',
    },
    priority = 10000,
    lazy = false,
    config = function()
      local legendary = require 'legendary'
      legendary.keymaps {
        {
          description = 'find a project based on patterns',
          mode = { 'n' },
          '<leader>j',
          '<CMD>Telescope neovim-project discover<CR>',
        },
        {
          description = 'select a project from your recent history',
          mode = { 'n' },
          '<leader>h',
          '<CMD>Telescope neovim-project history<CR>',
        },
      }
    end,
  },
}
