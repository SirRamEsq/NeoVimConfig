-- The keymap syntax goes
--   Mode: where "v" means visual, "n" normal, etc
--   The key you want to remap:
--     EX capital "J"
--   The command or motion you want to map to your key

-- Move entire line up or down with `J` and `K` in Visual Mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Leader + direction to move between panes
vim.keymap.set('n', '<Leader>wh', '<C-w>h', { noremap = true, silent = true, desc = 'Move to left pane' })
vim.keymap.set('n', '<Leader>wj', '<C-w>j', { noremap = true, silent = true, desc = 'Move to down pane' })
vim.keymap.set('n', '<Leader>wk', '<C-w>k', { noremap = true, silent = true, desc = 'Move to up pane' })
vim.keymap.set('n', '<Leader>wl', '<C-w>l', { noremap = true, silent = true, desc = 'Move to right pane' })
vim.keymap.set('n', '<Leader>ws', '<C-w>s', { noremap = true, silent = true, desc = 'Horizontal Split' })
vim.keymap.set('n', '<Leader>wv', '<C-w>v', { noremap = true, silent = true, desc = 'Vertical Split' })
vim.keymap.set("n", "<leader>fo", ':ObsidianSearch<CR>', {})

-- CTRL + Backspace deletes a word in insert mode
vim.keymap.set('i', '<C-BS>', '<C-w>', { noremap = true, silent = true, desc = 'Delete Word' })
-- Some terminals send CTRL + H for CTRL + Backspace
vim.keymap.set('i', '<C-h>', '<C-w>', { noremap = true, silent = true, desc = 'Delete Word' })

-- Leader + t for tab stuff
vim.keymap.set('n', '<Leader>tn', ':tabnew<CR>', { noremap = true, silent = true, desc = 'Create new tab' })
vim.keymap.set('n', '<Leader>tc', ':tabclose<CR>', { noremap = true, silent = true, desc = 'Delete tab' })

-- Leader + dot to open :Explore
vim.keymap.set('n', '<Leader>.', ':Explore<CR>', { noremap = true, silent = true, desc = 'Explore' })

-- Choose from buffers
vim.keymap.set('n', '<Leader>b', ':Telescope buffers<CR>', { noremap = true, silent = true, desc = 'Choose Buffer' })

-- Copy entire buffer to system clipboard
-- vim.keymap.set('n', '<F12>', ':%+y<CR>', { noremap = true, silent = true, desc = 'Copy Entire Buffer' })
-- Copy git relative path to clipboard
-- vim.keymap.set('n', '<F10>', ':CopyRelPathGitRoot<CR>', { noremap = true, silent = true, desc = 'Copy Entire Buffer' })
-- Fortune Cookie
local fortune = require("fortune").get_fortune()
vim.keymap.set('n', '<F7>', function() print(fortune[2]) end, { noremap = true, silent = true, desc = 'Fortune Cookie' })

-- TODO
-- Setup hydra

local configDir = vim.fn.stdpath("config")
print("Using config directory: " .. configDir)

-- Jump to directories
-- J = Jump
-- F = file
-- D = directory
-- O = obsidian
vim.keymap.set('n', '<Leader>jdc', ':Explore ' .. configDir .. '/lua/rlConfig<CR>', { noremap = true, silent = true, desc = 'Jump to config dir' })
vim.keymap.set('n', '<Leader>jfc', ':e ' .. configDir .. '/lua/rlConfig/keyMappings.lua<CR>', { noremap = true, silent = true, desc = 'Jump to config file' })
vim.keymap.set('n', '<Leader>jdo', ':Explore ' .. '~/Dropbox/DropsyncFiles/ObsidianVault/Personal/<CR>', { noremap = true, silent = true, desc = 'Jump to config file' })
