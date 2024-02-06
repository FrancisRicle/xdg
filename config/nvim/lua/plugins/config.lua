require("utils")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
local plugins = {}
modules("plugins", function(plugin) 
  table.insert(plugins, plugin)
end)
local telescope_extensions = require("telescope.extensions")
require("lazy").setup(join_tables(plugins, telescope_extensions))
require("lsp.config")
