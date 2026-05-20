# Neovim 快捷键映射

Leader 键：`Space`

## 基础操作

| 模式 | 快捷键 | 功能 | 来源 |
| --- | --- | --- | --- |
| Normal / Visual | `<leader>p` | 从 yank 寄存器 `0` 粘贴，避免覆盖最近复制内容 | `lua/keymap.lua` |
| Normal | `j` | 无计数时按屏幕行向下移动，有计数时按真实行移动 | `lua/keymap.lua` |
| Normal | `k` | 无计数时按屏幕行向上移动，有计数时按真实行移动 | `lua/keymap.lua` |
| Normal | `<leader>nh` | 清除搜索高亮 | `lua/keymap.lua` |
| Insert | `jk` | 退出插入模式 | `lua/keymap.lua` |
| Normal | `<C-q>` | 强制退出当前窗口 | `lua/keymap.lua` |
| Normal | `<leader>q` | 保存并退出当前窗口 | `lua/keymap.lua` |

## 窗口与文件

| 模式 | 快捷键 | 功能 | 来源 |
| --- | --- | --- | --- |
| Normal | `H` | 移动到左侧窗口 | `lua/keymap.lua` |
| Normal | `J` | 移动到下方窗口 | `lua/keymap.lua` |
| Normal | `K` | 移动到上方窗口 | `lua/keymap.lua` |
| Normal | `L` | 移动到右侧窗口 | `lua/keymap.lua` |
| Normal | `<C-e>` | 打开/关闭 nvim-tree 文件树 | `lua/plugins/theme-fileManager.lua` |
| nvim-tree | `?` | 显示 nvim-tree 帮助 | `lua/plugins/theme-fileManager.lua` |

## 搜索与项目

| 模式 | 快捷键 | 功能 | 来源 |
| --- | --- | --- | --- |
| Normal | `<leader>f` | Telescope 查找文件 | `lua/plugins/func-telescope.lua` |
| Normal | `<leader>g` | Telescope 全局文本搜索 | `lua/plugins/func-telescope.lua` |
| Normal | `<leader>j` | Telescope 发现项目 | `lua/plugins/func-telescope.lua` |
| Normal | `<leader>h` | Telescope 最近项目历史 | `lua/plugins/func-telescope.lua` |
| Telescope Insert | `Esc` | 关闭 Telescope | `lua/plugins/func-telescope.lua` |
| Telescope Normal | `q` | 关闭 Telescope | `lua/plugins/func-telescope.lua` |

## LSP 与诊断

| 模式 | 快捷键 | 功能 | 来源 |
| --- | --- | --- | --- |
| Normal | `gd` | 跳转到定义 | `lua/plugins/lspsaga.lua` |
| Normal | `gr` | 查找引用 | `lua/plugins/lspsaga.lua` |
| Normal | `gh` | 显示 hover 文档 | `lua/plugins/lspsaga.lua` |
| Normal | `<space>r` | 重命名符号 | `lua/plugins/lspsaga.lua` |
| Normal / Visual | `<space>ca` | Code Action | `lua/plugins/lspsaga.lua` |
| Normal | `[d` | 上一个诊断 | `lua/plugins/lspsaga.lua` |
| Normal | `]d` | 下一个诊断 | `lua/plugins/lspsaga.lua` |
| Normal | `<leader>o` | 打开 LSP outline | `lua/plugins/lspsaga.lua` |

## 补全

| 模式 | 快捷键 | 功能 | 来源 |
| --- | --- | --- | --- |
| Insert / Cmdline | `<C-j>` | 选择下一个补全项 | `lua/plugins/lsp-languageCompletion.lua` |
| Insert / Cmdline | `<C-k>` | 选择上一个补全项 | `lua/plugins/lsp-languageCompletion.lua` |
| Insert / Cmdline | `<C-e>` | 取消补全 | `lua/plugins/lsp-languageCompletion.lua` |
| Insert / Cmdline | `<CR>` | 确认补全 | `lua/plugins/lsp-languageCompletion.lua` |

## Debug

| 模式 | 快捷键 | 功能 | 来源 |
| --- | --- | --- | --- |
| Normal | `<leader>do` | DAP continue / start | `lua/plugins/lsp-dap.lua` |
| Normal | `<leader>db` | 切换断点 | `lua/plugins/lsp-dap.lua` |
| Normal | `<leader>dc` | Step out | `lua/plugins/lsp-dap.lua` |
| Normal | `<leader>ds` | Step into | `lua/plugins/lsp-dap.lua` |
| Normal | `<leader>dn` | Step over | `lua/plugins/lsp-dap.lua` |
| Normal | `<leader>dp` | 打开/关闭 DAP UI | `lua/plugins/lsp-dap.lua` |
| DAP UI | `o` | 打开条目 | `lua/plugins/lsp-dap.lua` |
| DAP UI | `d` | 删除条目 | `lua/plugins/lsp-dap.lua` |
| DAP UI | `e` | 编辑条目 | `lua/plugins/lsp-dap.lua` |
| DAP UI | `r` | REPL | `lua/plugins/lsp-dap.lua` |
| DAP UI | `t` | 切换条目 | `lua/plugins/lsp-dap.lua` |

## 代码导航与编辑增强

| 模式 | 快捷键 | 功能 | 来源 |
| --- | --- | --- | --- |
| Normal / Visual / Operator | `s` | Flash 快速跳转 | `lua/plugins/func-quickjump.lua` |
| Normal / Visual / Operator | `S` | Flash Treesitter 跳转 | `lua/plugins/func-quickjump.lua` |
| Normal | `<leader>i` | 切换 alternate-toggler 中的对应文本 | `lua/plugins/func-toggler.lua` |
| Normal | `zR` | 打开所有折叠 | `lua/plugins/func-ufo.lua` |
| Normal | `zM` | 关闭所有折叠 | `lua/plugins/func-ufo.lua` |
| Normal | `zr` | 打开部分折叠 | `lua/plugins/func-ufo.lua` |
| Normal | `zm` | 关闭当前层级折叠 | `lua/plugins/func-ufo.lua` |
| Normal | `zk` | 预览当前折叠内容 | `lua/plugins/func-ufo.lua` |
| Normal / Visual | `gc` | 注释操作符 | `Comment.nvim` 默认 |
| Normal | `gcc` | 注释当前行 | `Comment.nvim` 默认 |
| Visual | `S` | 包裹选区 | `nvim-surround` 默认 |
| Normal | `ys` | 添加 surround | `nvim-surround` 默认 |
| Normal | `cs` | 修改 surround | `nvim-surround` 默认 |
| Normal | `ds` | 删除 surround | `nvim-surround` 默认 |

## TODO 与书签

| 模式 | 快捷键 | 功能 | 来源 |
| --- | --- | --- | --- |
| Normal | `]t` | 下一个 TODO 注释 | `lua/plugins/theme-TODO.lua` |
| Normal | `[t` | 上一个 TODO 注释 | `lua/plugins/theme-TODO.lua` |
| Normal | `<leader>t` | Telescope 查看 TODO 注释 | `lua/plugins/theme-TODO.lua` |
| Normal | `mm` | 添加/删除当前行书签 | `vim-bookmarks` 默认 |
| Normal | `ma` | Telescope 查看全部书签 | `lua/plugins/func-bookmark.lua` |
| Normal | `mc` | Telescope 查看当前文件书签 | `lua/plugins/func-bookmark.lua` |
| Normal | `mn` | 下一个书签 | `vim-bookmarks` 默认 |
| Normal | `mp` | 上一个书签 | `vim-bookmarks` 默认 |

## 终端与 Codex

| 模式 | 快捷键 | 功能 | 来源 |
| --- | --- | --- | --- |
| Normal / Terminal | `<C-\>` | 打开/关闭浮动终端 | `lua/plugins/func-openterm.lua` |
| Normal / Terminal | `<leader>cc` | 打开/关闭 Codex 窗口 | `lua/plugins/lsp-codex.lua` |
| Codex 窗口 | `<C-q>` | 关闭 Codex 窗口 | `lua/plugins/lsp-codex.lua` |

