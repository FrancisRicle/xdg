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
  if plugin.extensions ~= nil then
    for ext in plugin.extensions do
      table.insert(plugins, ext)
    end
  end
end)
require("lsp.config")
require("lazy").setup(plugins)
