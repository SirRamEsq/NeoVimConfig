-- The default Github vim plugin doesn't seem super great; so will use copilot.lua instead
-- return {
-- 	"github/copilot.vim"
--   config = function()
--     -- Configuration goes here if needed
--   end
-- }
--


return {
  "zbirenbaum/copilot.lua",
  requires = {
    "copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
  },
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({})
  end,
}


