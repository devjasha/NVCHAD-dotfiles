-- First read our docs (completely) then check the example_config repo

local M = {}

M.ui = {
  theme = "onedark",
}

M.plugins = {user = require "custom.plugins"}

return M
