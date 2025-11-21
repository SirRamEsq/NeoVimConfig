-- Check if lazy is installed and get path if so
-- If path doesn't exist, clone git repo
-- Then require the module

-- Get standard Neovim-specific path for "data" (used for plugins)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check if path exists; Install to lazypath if not
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

-- Prepend to runtime path
vim.opt.rtp:prepend(lazypath)

-- Require subdirectory `pluginsLazy`
require("lazy").setup({
    spec = "rlConfig.pluginsLazy",
    change_detection = { notify = false }
})
