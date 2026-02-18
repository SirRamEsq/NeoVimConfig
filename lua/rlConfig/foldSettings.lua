
-- Fold settings
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- extra column to display information on folds
vim.opt.foldcolumn = "0"
vim.opt.foldtext = "" 
-- minimum level that is set to folded by default
vim.opt.foldlevel = 99
-- Default fold level started at
vim.opt.foldlevelstart = 99

-- Note, if you don't have folds on first opening nvim, try regenerating them via 'zx'
