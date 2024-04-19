-- 插件用于在状态栏显示当前模式、文件名、诊断信息、文件类型等信息
return {
  'nvim-lualine/lualine.nvim',
  config = function()
    require('lualine').setup {
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { { 'filename', path = 3 } },
        lualine_c = { 'diagnostics' },
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'filetype' },
      },
    }
  end,
}
