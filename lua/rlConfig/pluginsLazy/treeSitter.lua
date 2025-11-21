-- Integrates with syntax tree generator tree-sitter-cli
-- Needs tree-sitter-cli installed
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "javascript",
          -- The parsers below should always be installed
          "lua",
          "vim",
          "vimdoc",
          "c",
          "ruby",
          "python",
          "query"
        },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
          disable = { "python", "c" } -- these and some other langs don't work well
        },
      })
  end
}
