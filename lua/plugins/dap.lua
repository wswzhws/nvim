return {
  {
    'mfussenegger/nvim-dap',
    event = 'VeryLazy',
    depends = {
      'theHamsta/nvim-dap-virtual-text',
      'rcarriga/nvim-dap-ui',
    },
    keys = {
      -- add a keymap to browshttps://github.com/cmu-db/bustub.gite plhttps://github.com/cmu-db/bustub.gitugin files
      -- stylua: ignore
      {
        "gt",
        function() require("dap").continue() end,
        desc = "launch/continue gdb",
      },
      {
        'gn',
        function()
          require('dap').step_over()
        end,
        desc = '单步调试',
      },
      {
        '<f5>',
        function()
          require('dap').step_into()
        end,
        desc = '步入',
      },
      {
        '<C-f5>',
        function()
          require('dap').step_out()
        end,
        desc = '步出',
      },
      {
        'gT',
        function()
          require('dap').terminate()
          require('dapui').close()
        end,
        desc = '终止程序',
      },
      {
        'gp',
        function()
          require('dap').toggle_breakpoint()
        end,
        desc = '切换断点',
      },
    },
    config = function()
      local dap = require 'dap'
      dap.adapters.gdb = {
        type = 'executable',
        command = 'gdb',
        args = { '-i', 'dap' },
      }

      dap.configurations.c = {
        {
          name = 'Launch',
          type = 'gdb',
          request = 'launch',
          program = function()
            return vim.fn.input(
              'Path to executable: ',
              vim.fn.getcwd() .. '/',
              'file'
            )
          end,
          cwd = '${workspaceFolder}',
          stopAtBeginningOfMainSubprogram = false,
        },
      }
      dap.configurations.cpp = dap.configurations.c
      dap.configurations.rust = dap.configurations.c
    end,
  },

  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
    },
    opts = function()
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
      -- 输入unicode的方法：ctrl + v + u 再输入unicode码
      -- 可在https://www.nerdfonts.com/cheat-sheet查询想要的字符
      local dap_breakpoint = {
        error = {
          text = '',
          texthl = 'DapBreakpoint',
          linehl = 'DapBreakpoint',
          numhl = 'DapBreakpoint',
        },
        condition = {
          text = '',
          texthl = 'DapBreakpoint',
          linehl = 'DapBreakpoint',
          numhl = 'DapBreakpoint',
        },
        rejected = {
          text = '',
          texthl = 'DapBreakpoint',
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

      local dap, dapui = require 'dap', require 'dapui'
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
        dap.repl.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
        dap.repl.close()
      end
      return {
        enabled = true, -- enable this plugin (the default)
        enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
        highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
        highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
        show_stop_reason = true, -- show stop reason when stopped for exceptions
        commented = false, -- prefix virtual text with comment string
        only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
        all_references = false, -- show virtual text on all all references of the variable (not only definitions)
        filter_references_pattern = '<module', -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
        -- Experimental Features:
        virt_text_pos = 'eol', -- position of virtual text, see `:h nvim_buf_set_extmark()`
        all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
        virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
        virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
      }
    end,
  },
  {
    'theHamsta/nvim-dap-virtual-text',
    opts = {},
  },
}
