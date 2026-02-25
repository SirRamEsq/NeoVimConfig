-- Used as a fuzzy finder for files
-- Need ripgrip installed
return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
		-- Required
		{ "nvim-lua/plenary.nvim" },
		-- Used for arguments in grep serach
    { 
        "nvim-telescope/telescope-live-grep-args.nvim" ,
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.0.0",
    },
	},
  module = "telescope",

  config = function()
    local telescope = require('telescope')
		local lga_actions = require("telescope-live-grep-args.actions")
    telescope.setup({
			extensions = {
				live_grep_args = {
					auto_quoting = true, -- enable/disable auto-quoting
						-- define mappings, e.g.
						mappings = { -- extend mappings
							i = {
								["<C-k>"] = lga_actions.quote_prompt(),
							-- Search in folder
								["<C-f>"] = lga_actions.quote_prompt({ postfix = " --iglob **/folder/**" }),
								-- freeze the current list and start a fuzzy search in the frozen list
								["<C-space>"] = lga_actions.to_fuzzy_refine,
							},
						},
						-- ... also accepts theme settings, for example:
						-- theme = "dropdown", -- use dropdown theme
						-- theme = { }, -- use own theme spec
						-- layout_config = { mirror=true }, -- mirror preview pane
				}
			}
		})


    local builtin = require('telescope.builtin')

    vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
    -- vim.keymap.set("n", "<leader>fr", builtin.live_grep, {}) -- See below
    vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    vim.keymap.set("n", "<leader>fh", ":Telescope find_files hidden=true <CR>")

    vim.keymap.set('n', '<leader>pws', function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end)
    vim.keymap.set('n', '<leader>pWs', function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end)

    -- Load 'live greps args' extension
    telescope.load_extension("live_grep_args")
		vim.keymap.set("n", "<leader>fr", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
  end
}

