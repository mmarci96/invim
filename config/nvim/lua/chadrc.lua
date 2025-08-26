-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "tokyodark", -- or whatever you use
  statusline = {
    theme = "minimal", -- change this to one of: default, minimal, simple, vscode
  },
}

M.base46 = {
  theme = "tokyodark",
  tabufline = {
    enabled = true,
    lazyload = true,
    order = { "treeOffset", "buffers", "tabs", "btns" },
    modules = nil,
    bufwidth = 20,
  },

  hl_override = {
    Function = { italic = true },
    ["@function"] = { italic = true },
    ["@function.call"] = { italic = true },
    ["@function.builtin"] = { italic = true },
    ["@function.macro"] = { italic = true },

    ["@keyword.function"] = { italic = true },
  },
}

return M
