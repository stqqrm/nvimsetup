-- keymaps.lua

-- Save current buffer with Ctrl+S in all modes
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file" })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a", { desc = "Save file (insert mode)" })
vim.keymap.set("v", "<C-s>", "<Esc>:w<CR>gv", { desc = "Save file (visual mode)" })


-- Function to fully reload init.lua and reapply theme
local function reload_config()
  -- Unload the theme module so it reloads
  package.loaded["theme.theme"] = nil

  -- Re-run init.lua (which re-requires theme and others)
  dofile(vim.fn.stdpath("config") .. "/init.lua")

  -- OPTIONAL: directly re-apply theme if not called inside init.lua
  -- require("theme.theme").setup()

  print("🔁 Reloaded init.lua and theme")
end

-- Bind F2 in normal, insert, and visual modes
vim.keymap.set("n", "<F2>", reload_config, { desc = "Reload init.lua" })
vim.keymap.set("i", "<F2>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
  reload_config()
end, { desc = "Reload init.lua (insert mode)" })
vim.keymap.set("v", "<F2>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
  reload_config()
end, { desc = "Reload init.lua (visual mode)" })

