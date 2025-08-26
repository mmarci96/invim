vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)

vim.cmd [[
  highlight TabLine       guibg=#04000F guifg=#6c6f77
  highlight TabLineSel    guibg=#2a2e39 guifg=#FFFFFF
  highlight TabLineFill   guibg=#04000F guifg=#6c6f77
  highlight TabLineClose  guibg=#04000F guifg=#FF5F00
]]

require("nvim-tree").setup {
    view = {
        width = 24,
        -- Remove extra padding between edge and folder names
    },
    renderer = {
        indent_width = 1,
        group_empty = true,
        icons = {
            show = {
                folder_arrow = true,
            },
        },
    },
}
