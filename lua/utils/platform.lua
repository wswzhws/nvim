local M = {}

local uv = vim.uv or vim.loop
local os_name = uv.os_uname().sysname

M.is_windows = vim.fn.has 'win32' == 1 or vim.fn.has 'win64' == 1
M.is_wsl = vim.fn.has 'wsl' == 1
M.is_mac = os_name == 'Darwin'
M.is_linux = os_name == 'Linux' and not M.is_wsl

M.path_sep = M.is_windows and '\\' or '/'

function M.home()
  return uv.os_homedir()
end

function M.join(...)
  local parts = vim
    .iter({ ... })
    :filter(function(part)
      return part ~= nil and part ~= ''
    end)
    :totable()

  return table.concat(parts, M.path_sep)
end

function M.executable(command)
  return vim.fn.executable(command) == 1
end

function M.config_path(...)
  return M.join(vim.fn.stdpath 'config', ...)
end

return M
