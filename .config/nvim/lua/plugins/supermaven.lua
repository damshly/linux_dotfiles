return {
  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<C-g>", -- نفس اختصارنا القديم
        clear_suggestion = "<C-x>",
      },
      ignore_filetypes = { "cpp" }, -- مثال لو بدك تعطل ملفات معينة
      color = {
        suggestion_color = "#ffffff",
        cterm = 244,
      }
    })
  end,
}
