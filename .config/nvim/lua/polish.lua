

-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here while  2026-01-11T06:57:24
--
-- lua/polish.lua

-- مابينج للتيرمينال العائم (Floating)

-- lua/polish.lua

-- مابينج للتيرمينال العرضي (Horizontal) - شغال بس بنأكده
vim.keymap.set({ "n", "t" }, "<C-\\>", function()
  require("toggleterm").toggle(1, 15, nil, "horizontal")
end, { desc = "Horizontal Terminal" })

-- مابينج للتيرمينال العائم (Floating) - بأسلوب الإجبار
vim.keymap.set({ "n", "t" }, "<C-u>", function()
  -- جربنا نغير الرقم لـ 5 عشان نضمن إنه ID بعيد عن التضارب
  require("toggleterm").toggle(5, nil, nil, "float")
end, { desc = "Floating Terminal" })
