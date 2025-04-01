-- set base46_cache path ("data" referers to "~/.local/share/nvim")
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
-- set leader key as `space`.
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
-- install lazy.vim if it hasn't been installed
if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

-- prioritize lazypath in rtp (runtime path)
vim.opt.rtp:prepend(lazypath)
-- load configurations of lazy.nvim under "./lua/configs/lazy.lua"
local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({ import = "plugins" }, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
  require "lsputil"
end)
