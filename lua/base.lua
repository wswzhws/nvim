local opt = vim.opt

-- 启用标志列
opt.signcolumn = 'yes'
-- 显示行号
opt.number = true
-- 显示相对行号
opt.relativenumber = true
-- 光标上方和下方保留的行数
opt.scrolloff = 5
-- 光标左侧和右侧保留的列数
opt.sidescrolloff = 5
-- 高亮搜索结果
opt.hlsearch = true
-- 增量搜索
opt.incsearch = true
-- 鼠标支持关闭
opt.mouse = ''
-- 使用系统剪贴板进行复制/粘贴
opt.clipboard:append 'unnamedplus'
-- 设置制表符的空格数
opt.tabstop = 4
-- 设置缩进的空格数
opt.shiftwidth = 4
-- 使用空格而不是制表符进行缩进
opt.expandtab = true
-- 启用自动缩进
opt.autoindent = true
-- 在搜索时忽略大小写
opt.ignorecase = true
-- 在搜索时使用智能大小写
opt.smartcase = true
-- 禁用交换文件
opt.swapfile = false
-- 当文件在 Vim 外部发生更改时自动读取
opt.autoread = true
-- 当文件在 Vim 外部发生更改时自动读取（缓冲区本地）
vim.bo.autoread = true
-- 启用光标行高亮
-- opt.cursorline = true
-- 启用真彩色支持
opt.termguicolors = true
-- 在复制后高亮文本
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
})
-- 设置普通模式下光标为竖线
vim.cmd [[let &t_SI = "\e[6 q"]]
-- 设置插入模式下光标为下划线
vim.cmd [[let &t_EI = "\e[4 q"]]
-- 设置可视模式下光标为方块
vim.cmd [[let &t_SR = "\e[2 q"]]
