-- lua/autopair.lua

local M = {}

-- Table of simple pairs (auto-close on typing opening char)
local auto_pairs = {
  ['('] = ')',
  ['['] = ']',
  ['{'] = '}',
  ['"'] = '"',
  ["'"] = "'",
}

-- Setup function to create mappings
function M.setup()
  -- Setup mappings for simple pairs
  for open, close in pairs(auto_pairs) do
    vim.keymap.set("i", open, function()
      return open .. close .. "<Left>"
    end, { expr = true, noremap = true })
  end

  -- Special handling for '<'
  vim.keymap.set("i", "<", function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local line = vim.api.nvim_get_current_line()
    local before_cursor = line:sub(1, col)

    if before_cursor:match("#include%s*$") then
      -- Insert paired <>
      return "<>" .. "<Left>"
    else
      -- Just insert literal <
      return "<"
    end
  end, { expr = true, noremap = true })

  -- Smart Backspace: deletes pair if between matching chars
  vim.keymap.set("i", "<BS>", function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local line = vim.api.nvim_get_current_line()

    local prev = line:sub(col, col)
    local next = line:sub(col + 1, col + 1)

    local matching = {}
    for k, v in pairs(auto_pairs) do
      matching[k] = v
    end
    matching["<"] = ">"

    if matching[prev] and next == matching[prev] then
      -- Remove both chars
      local new_line = line:sub(1, col - 1) .. line:sub(col + 2)
      vim.api.nvim_set_current_line(new_line)
      vim.api.nvim_win_set_cursor(0, { row, col - 1 })
    else
      -- Default backspace
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<BS>", true, true, true), "n", false)
    end
  end, { noremap = true })
end

return M

