-- undotree.lua
-- Simple undo/redo mappings for insert mode

local M = {}

M.setup = function()
  -- Undo: Ctrl+Z in insert mode
  vim.keymap.set('i', '<C-z>', '<Esc>ui', { noremap = true, silent = true })
  
  -- Redo: Ctrl+X in insert mode  
  vim.keymap.set('i', '<C-x>', '<Esc><C-r>i', { noremap = true, silent = true })
end

return M
