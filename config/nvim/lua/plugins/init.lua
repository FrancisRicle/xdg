local plugins = {}
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
for file in vim.fs.dir(vim.fn.stdpath("config") .. "/lua/plugins") do
  if file ~= "init.lua" then
    local plugin = require("plugins." .. string.sub(file, 1, -5))
    table.insert(plugins, plugin)
  end
end
require("lsp.")
require("lazy").setup(plugins)
