return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
    'theHamsta/nvim-dap-virtual-text',
  },

  config = function()
    local keymap = vim.keymap

    keymap.set('n', '<leader>dc', '<cmd>DapContinue<cr>')
    keymap.set('n', '<leader>db', '<cmd>DapToggleBreakpoint<cr>')
    keymap.set('n', '<leader>dp', '<cmd>DapStepOut<cr>')
    keymap.set('n', '<leader>di', '<cmd>DapStepInto<cr>')
    keymap.set('n', '<leader>do', '<cmd>DapStepOver<cr>')
    keymap.set('n', '<leader>ds', "<cmd>lua require'dapui'.toggle()<cr>")

    local dap_breakpoint_color = {
      breakpoint = {
        ctermbg = 0,
        fg = '#993939',
        bg = '#31353f',
      },
      logpoing = {
        ctermbg = 0,
        fg = '#61afef',
        bg = '#31353f',
      },
      stopped = {
        ctermbg = 0,
        fg = '#98c379',
        bg = '#31353f',
      },
    }

    vim.api.nvim_set_hl(0, 'DapBreakpoint', dap_breakpoint_color.breakpoint)
    vim.api.nvim_set_hl(0, 'DapLogPoint', dap_breakpoint_color.logpoing)
    vim.api.nvim_set_hl(0, 'DapStopped', dap_breakpoint_color.stopped)

    local dap_breakpoint = {
      error = {
        text = '',
        texthl = 'DapBreakpoint',
        linehl = 'DapBreakpoint',
        numhl = 'DapBreakpoint',
      },
      condition = {
        text = '',
        texthl = 'DapBreakpoint',
        linehl = 'DapBreakpoint',
        numhl = 'DapBreakpoint',
      },
      rejected = {
        text = '',
        texthl = 'DapBreakpint',
        linehl = 'DapBreakpoint',
        numhl = 'DapBreakpoint',
      },
      logpoint = {
        text = '',
        texthl = 'DapLogPoint',
        linehl = 'DapLogPoint',
        numhl = 'DapLogPoint',
      },
      stopped = {
        text = '',
        texthl = 'DapStopped',
        linehl = 'DapStopped',
        numhl = 'DapStopped',
      },
    }

    vim.fn.sign_define('DapBreakpoint', dap_breakpoint.error)
    vim.fn.sign_define('DapBreakpointCondition', dap_breakpoint.condition)
    vim.fn.sign_define('DapBreakpointRejected', dap_breakpoint.rejected)
    vim.fn.sign_define('DapLogPoint', dap_breakpoint.logpoint)
    vim.fn.sign_define('DapStopped', dap_breakpoint.stopped)

    require('dap').adapters.codelldb = {
      type = 'server',
      port = '${port}',
      executable = {
        command = os.getenv 'HOME' .. '/.local/share/nvim/mason/bin/codelldb',
        args = { '--port', '${port}' },
      },
    }

    require('dap').configurations.cpp = {
      {
        name = 'Launch file',
        type = 'codelldb',
        request = 'launch',
        program = function()
          return vim.fn.input(
            'Path to executable: ',
            vim.fn.getcwd() .. '/',
            'file'
          )
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
      },
    }

    require('dap').configurations.c = require('dap').configurations.cpp
    require('dap').configurations.rust = require('dap').configurations.cpp

    require('dapui').setup {
      icons = { expanded = '', collapsed = '', current_frame = '' },
      mappings = {
        -- Use a table to apply multiple mappings
        expand = { '<CR>', '<2-LeftMouse>' },
        open = 'o',
        remove = 'd',
        edit = 'e',
        repl = 'r',
        toggle = 't',
      },
      layouts = {
        {
          elements = {
            {
              id = 'scopes',
              size = 0.35,
            },
            { id = 'stacks', size = 0.35 },
            { id = 'watches', size = 0.15 },
            { id = 'breakpoints', size = 0.15 },
          },
          size = 50,
          position = 'left',
        },
        {
          elements = {
            'repl',
          },
          size = 18,
          position = 'bottom',
        },
      },

      controls = { enabled = false },
      floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = 'single', -- Border style. Can be "single", "double" or "rounded"
        mappings = {
          close = { 'q', '<Esc>' },
        },
      },
      windows = { indent = 1 },
    }

    local dap, dapui = require 'dap', require 'dapui'
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    require('nvim-dap-virtual-text').setup {
      enabled = true,
      enabled_commands = true,
      highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
      highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
      show_stop_reason = true, -- show stop reason when stopped for exceptions
      commented = false, -- prefix virtual text with comment string
      only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
      all_references = false, -- show virtual text on all all references of the variable (not only definitions)
      clear_on_continue = false, -- clear virtual text on "continue" (might cause flickering when stepping)
      --- A callback that determines how a variable is displayed or whether it should be omitted
      --- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
      --- @param buf number
      --- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
      --- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
      --- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
      --- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
      display_callback = function(variable, buf, stackframe, node, options)
        -- by default, strip out new line characters
        if options.virt_text_pos == 'inline' then
          return ' = ' .. variable.value:gsub('%s+', ' ')
        else
          return variable.name .. ' = ' .. variable.value:gsub('%s+', ' ')
        end
      end,
      -- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
      virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',

      -- experimental features:
      all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
      virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
      virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
      -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
    }
  end,
}
