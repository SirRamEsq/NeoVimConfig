-- Used as a fuzzy finder for files
-- May need grep / ripgrip?
return {
  "Mr-LLLLL/interestingwords.nvim",

  config = function()
    require('interestingwords').setup{
			colors = {
				'#aeee00', -- Green
				'#ff0000', -- Red
				'#2254dd', -- Cobalt Blue
				'#b88823', -- Yellow
				'#ffa724', -- Bronze
				'#00ff73', -- Turquoise
				'#f500e9', -- Violet
				'#fa6bf3', -- Pink
				'#c8f7a3', -- Grey Green
				'#989cfa', -- Grey Blue
				'#fca2a2', -- Grey Red
				'#ff2c4b'  -- Salmon
			},
			search_count = true, -- Display search count
			navigation = true, -- To use this plugin's search feature
			scroll_center = false, -- Use Smooth scrolling
			search_key = "<leader>hs",
			cancel_search_key = "<leader>hS",
			color_key = "<leader>hh",
			cancel_color_key = "<leader>hH",
			select_mode = "random",  -- random or loop
		}
    -- require('lualine').setup{
			-- lualine_x = {
				-- {
					-- require("interestingwords").lualine_get,
					-- cond = require("interestingwords").lualine_has,
					-- color = { fg = "#ff9e64" },
				-- },
			-- }
    -- }
  end
}
