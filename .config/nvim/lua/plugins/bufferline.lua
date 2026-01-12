return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          text_align = "center",
          separator = true,
        },
      },
      separator_style = "slant",
      show_close_icon = true,
      show_buffer_close_icons = true,
    },
  },
  keys = {
    -- التنقل مثل VS Code تماماً
    { "<C-Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "<C-S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    
    -- بديل سريع في حال كان نظامك يمنع Ctrl+Tab
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    
    -- إغلاق الملف (مثل Ctrl+W في الكود، لكن هنا سنستخدم leader + x لعدم تضارب النظام)
    { "<leader>x", "<cmd>bp|sp|bn|bd<cr>", desc = "Close Buffer" },
  },
}
