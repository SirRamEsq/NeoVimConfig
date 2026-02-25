return {
	"nvimtools/hydra.nvim",
	config = function()
		local Hydra = require('hydra')
    local builtin = require('telescope.builtin')
		Hydra({
			name = 'Copy to Clipboard',
			mode = 'n', -- normal mode
			body = '<F12>', -- the key to press to enter this hydra mode
			config = {
				color = 'blue', -- default setting; blue exits after choosing an option
				invoke_on_body = true, -- Show after pressing 'body' key
				on_enter = nil,
				on_exit = nil,
				on_key = nil,
			},
			heads = {
				-- head, right-hand-side, options
				{ 'g', ':CopyRelPathGitRoot<CR>', { desc = 'Path relative to git root' } },
				{ 'f', ':%+y<CR>', { desc = 'Full file copy' } },
			}
		})
		-- Hydra({
		-- 	name = 'Grep search',
		-- 	mode = 'n', -- normal mode
		-- 	--body = '<leader>fr',
		-- 	body = '<F10>',
		-- 	config = {
		-- 		color = 'blue', -- default setting; blue exits after choosing an option
		-- 		invoke_on_body = true, -- Show after pressing 'body' key
		-- 		on_enter = nil,
		-- 		on_exit = nil,
		-- 		on_key = nil,
		-- 	},
		-- 	heads = {
		-- 		{'r', builtin.live_grep, { desc = 'Grep' }},
		-- 		--{'f', ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>", { desc = 'In Folder' }}
		-- 		{'f', grep_search_in_folder, { desc = 'In Folder' }}
		-- 	}
		-- })
	end
}
