-- File: lua/plugins/visuals.lua
return {
  -- 1. Highlight Colors (Hex codes, RGB, etc.)
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        user_default_options = {
          names = false, -- Don't highlight names like "Blue" (too noisy)
          RRGGBBAA = true, -- Highligh #RRGGBBAA hex codes
          mode = "virtualtext", -- Just show a colored square next to the code
        },
      })
    end,
  },
  -- 2. Modern TODO comments with search support
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- Look for: TODO, FIXME, BUG, HACK, WARN
      signs = true,
      highlight = {
        keyword = "wide", -- "bg", "fg", "wide"
      },
    },
  },
}
