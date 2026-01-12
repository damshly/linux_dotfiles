-- File: lua/plugins/completion.lua
return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- LSP source for cmp
    "hrsh7th/cmp-buffer",   -- Buffer source (words in current file)
    "hrsh7th/cmp-path",     -- Path source (file paths)
    "L3MON4D3/LuaSnip",     -- Snippet engine
    "saadparwaiz1/cmp_luasnip", -- Snippets source for cmp
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- Previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- Next suggestion
        ["<C-Space>"] = cmp.mapping.complete(),     -- Show suggestions
        ["<CR>"] = cmp.mapping.confirm({ 
          behavior = cmp.ConfirmBehavior.Replace,
          select = true 
        }), -- Confirm selection & execute auto-import
      }),
      sources = cmp.config.sources({
        { name = "codeium" },
        { name = "nvim_lsp" }, -- Primary: LSP (Auto-imports come from here)
        { name = "luasnip" },  -- Secondary: Snippets
        { name = "buffer" },   -- Tertiary: Current file text
        { name = "path" },     -- File system paths
      }),
      window = {
        completion = cmp.config.window.bordered(), -- Rounded VS Code style
        documentation = cmp.config.window.bordered(),
      },
    })
  end,
}
