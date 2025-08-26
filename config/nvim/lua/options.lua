require "nvchad.options"

local o = vim.o
o.cursorlineopt = "both"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 1
vim.opt.signcolumn = "yes"
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.textwidth = 100
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = "↪ "
vim.opt.colorcolumn = "100"
vim.opt.formatoptions:append { "t" }
vim.opt.expandtab = true
