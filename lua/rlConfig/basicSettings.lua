-- Set leader to SPACE
vim.g.mapleader = " "

-- Clipboard
--
-- To ALWAYS use the clipboard for ALL operations (instead of interacting with
-- the "+" and/or "*" registers explicitly): >vim
--     set clipboard+=unnamedplus
--
--  If you are using Linux, you need to install:
--   - xclip if using X11
--   - wl-copy and wl-paste if using Wayland
vim.opt.clipboard = "unnamed"



-- Basic settings
vim.opt.hlsearch = true -- Highlight Search
vim.opt.number = true -- Show Line number
vim.opt.relativenumber = false -- Relative line number
vim.opt.mouse = "a" -- use mouse in 'a'll modes
vim.opt.showmode = false -- show what mode we're in; Disabled for LuaLine Plugin
vim.opt.spelllang = "en_us"


-- Basic Display
vim.opt.termguicolors = true -- Allow 24bit color in terminals allowing it
vim.o.background = "dark" -- set to "dark" for dark theme

-- Open new split panes to right and below
vim.opt.splitright = true
vim.opt.splitbelow = true


-- Search configuration
vim.opt.ignorecase = true
vim.opt.smartcase = true -- Override the `ignorecase` option if search pattern contains upper case characters
vim.opt.gdefault = false -- Assume `g` flag in a substitude command; All matches are substituted instead of one


-- Tab and indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2 
vim.opt.expandtab = true -- when set to true, will insert spaces instead of literal tab character
vim.opt.autoindent = true -- Auto indent on new line
vim.opt.smartindent = true
vim.opt.smarttab = true
