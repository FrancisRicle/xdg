require("utils")
vim.keymap.set({ "n", "i" }, "<C-S>", "<cmd>wa<cr>")
vim.keymap.set({ "n", "i", "t" }, "<C-S>", "<cmd>wa<cr>")
vim.keymap.set({ "n", "i", "t" }, "<C-E>", "<cmd>Telescope file_browser<cr>")
vim.keymap.set({ "n", "i", "t" }, "<C-B>", "<cmd>Telescope buffers<cr>")
vim.keymap.set({ "n", "i", "t" }, "<C-T>", "<cmd>Telescope toggleterm_manager<cr>")
vim.o.expantab = true
vim.o.expandtab = true
vim.o.autoident = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.showtabline = 0
vim.o.relativenumber = true
vim.o.number = true
require("lazycore")
