return {
  "akinsho/toggleterm.nvim",
  -- نضمن إنها تتحمل فوراً بمجرد الضغط على الكبسة
  keys = { [[<C-j>]] }, 
  opts = {
    direction = "float",
    close_on_exit = true,
    float_opts = {
      border = "curved",
      winblend = 3,
    },
  },
}
