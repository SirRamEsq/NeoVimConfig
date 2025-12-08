return {
  {
    'echasnovski/mini.misc',
    config = function()
      -- Set Current working dir based on current buffer
      require('mini.misc').setup_auto_root(function(name, path)
        -- First match to .git projects and obsidian folders
        for _, n in ipairs({ '.git', '.obsidian' }) do
          if name == n then
            return true
          end
        end

        -- Then match to nvim config
        if path:match('%nvim/?$') then
          return true
        end

        -- No match
        return false
      end)
    end,
  },
}
