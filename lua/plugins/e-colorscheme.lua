return {
  'sainnhe/everforest',
  priority = 1000, -- 优先级最高，最先加载出来
  config = function()
    vim.g.everforest_diagnostic_line_highlight = 1
    vim.cmd [[colorscheme everforest]]
  end,
}
