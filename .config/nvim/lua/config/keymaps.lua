-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- jj always acts as ESC in insert mode
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true, nowait = true })

vim.o.timeoutlen = 200
