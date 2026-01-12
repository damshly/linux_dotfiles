return {
  {
    "oxfist/night-owl.nvim",
    lazy = false, -- تحميله فوراً عند التشغيل
    priority = 1000, -- إعطاؤه الأولوية القصوى
    config = function()
      -- إعدادات الثيم
      require("night-owl").setup({
        transparent_background = false,
        italic_comments = true,
      })
      -- تفعيل الثيم
      vim.cmd.colorscheme("night-owl")
    end,
  },
}
