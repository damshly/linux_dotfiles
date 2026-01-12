-- File: lua/plugins/lspsaga.lua
return {
  'nvimdev/lspsaga.nvim',
  event = 'LspAttach',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    require('lspsaga').setup({
      -- Visual styling
      ui = {
        border = 'rounded', -- Clean VS Code-like rounded borders
        devicon = true,
      },
      -- Documentation hover settings
      hover = {
        max_width = 0.6,
        open_link = 'gx',
      },
      -- Breadcrumbs (Show function path at the top)
      symbol_in_winbar = {
        enable = true,
        show_file = true,
        folder_level = 2,
      },
      -- Disable noisy features
      lightbulb = {
        enable = false,
      },
      -- Key hint at the bottom
      beacon = {
        enable = true,
      },
    })
  end,
}
