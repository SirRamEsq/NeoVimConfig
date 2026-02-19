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

vim.opt.cursorline = true -- Enable highlighting the current line


-- Basic Display
vim.opt.termguicolors = true -- Allow 24bit color in terminals allowing it
vim.o.background = "dark" -- set to "dark" for dark theme

-- Conceal level
-- 2 - Conceal text unless line is highlighted
vim.opt.conceallevel = 2 

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
vim.opt.expandtab = false -- when set to true, will insert spaces instead of literal tab character
vim.opt.autoindent = true -- Auto indent on new line
vim.opt.smartindent = true
vim.opt.smarttab = true

-- Set window title
getTitle=function()
	local gitRootPath = vim.fn.system("git rev-parse --show-toplevel"):gsub("%s+", "")
	if vim.v.shell_error == 0 then
		-- Use fnamemodify to get only the tail (basename) of the path
		return vim.fn.fnamemodify(gitRootPath, ":t")
	end

	-- vim.fn.getcwd() -- Get current working dir
	local testVal = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t")
	if testVal ~= "" then
		return testVal
	end

	return "nvim"
end

vim.opt.title = true
vim.opt.titlelen = 0 -- do not shorten title
vim.opt.titlestring = getTitle()
-- Update title when entering a buffer
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.opt.titlestring = getTitle()
	end
})


-- Function to find the git root and copy the relative path to the clipboard
function CopyRelativeToGitRoot()
  -- Get the git root directory
  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  if vim.v.shell_error ~= 0 then
    print("Not in a git repository")
    return
  end
  
  -- Get absolute path and make it relative to git root
  local absolute_path = vim.api.nvim_buf_get_name(0)
  local relative_path = vim.fn.fnamemodify(absolute_path, ":p")
  relative_path = relative_path:sub(#git_root + 2) -- +2 to remove the trailing slash

  -- Copy to the system clipboard (+) register
  vim.fn.setreg("+", relative_path)
  print("Copied: " .. relative_path)
end

-- Create a Vim command for getting the relative path
vim.cmd("command! CopyRelPathGitRoot lua CopyRelativeToGitRoot()")
