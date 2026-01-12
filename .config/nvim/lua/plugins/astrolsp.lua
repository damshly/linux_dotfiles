-- lua/plugins/astrocore.lua
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    mappings = {
      n = {
        ["<leader>rn"] = { function() vim.lsp.buf.rename() end, desc = "LSP Rename" },
        ["<leader>nh"] = { ":nohlsearch<CR>", desc = "No Highlight" },
      },
    },
  },
}
