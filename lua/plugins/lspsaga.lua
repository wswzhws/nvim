-- 插件用于提供更好的 LSP 体验
-- 1. 使用 <space>ca 查看代码建议
-- 2. 使用 <space>r 重命名变量
-- 3. 使用 gd 跳转到定义
-- 4. 使用 gr 查看引用
-- 6. 使用 [d 跳转到上一个错误
-- 7. 使用 ]d 跳转到下一个错误
-- 8. 使用 <leader>o 查看大纲
return {
  'nvimdev/lspsaga.nvim',
  config = function()
    local keymap = vim.keymap

    require('lspsaga').setup {
      ui = {
        border = 'rounded',
      },
      lightbulb = {
        enable = false,
      },
      outline = {
        win_width = 40,
      },
    }

    keymap.set('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<cr>')
    keymap.set('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<cr>')
    keymap.set('n', '<leader>o', '<cmd>Lspsaga outline<cr>')

    local builtin = require 'telescope.builtin'

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<cr>', opts)
        vim.keymap.set('n', '<space>r', vim.lsp.buf.rename, opts)
        vim.keymap.set(
          { 'n', 'v' },
          '<space>ca',
          '<cmd>Lspsaga code_action<cr>',
          opts
        )
        vim.keymap.set('n', 'gr', builtin.lsp_references, opts)
      end,
    })

    vim.keymap.set('n', 'gh', '<cmd>Lspsaga hover_doc<cr>', { silent = true })

    -- error lens
    vim.diagnostic.config {
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = ' ',
          [vim.diagnostic.severity.WARN] = ' ',
          [vim.diagnostic.severity.INFO] = '󰋼 ',
          [vim.diagnostic.severity.HINT] = '󰌵 ',
        },
        numhl = {
          [vim.diagnostic.severity.ERROR] = '',
          [vim.diagnostic.severity.WARN] = '',
          [vim.diagnostic.severity.HINT] = '',
          [vim.diagnostic.severity.INFO] = '',
        },
        linehl = {
          [vim.diagnostic.severity.ERROR] = 'ErrorLine',
          [vim.diagnostic.severity.WARN] = 'WarningLine',
          [vim.diagnostic.severity.HINT] = 'HintLine',
          [vim.diagnostic.severity.INFO] = 'InfoLine',
        },
      },
    }
  end,
}
