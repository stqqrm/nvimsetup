-- settings.lua

-- Enable syntax
vim.cmd("syntax enable")

-- Set tab width to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true      -- Convert tabs to spaces

-- Indentation
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Mouse support
vim.opt.mouse = "a"

-- Enable syntax highlighting (optional if you're using a plugin)
vim.cmd("syntax enable")

-- Use system clipboard (optional)
vim.opt.clipboard = "unnamedplus"

-- Show matching brackets
vim.opt.showmatch = true

-- Enable true color support
vim.opt.termguicolors = true

-- Decrease update time
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500

-- Scroll offset
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- Smart left arrow key
vim.keymap.set("n", "<Left>", function()
  local col = vim.fn.col(".")
  local line = vim.fn.line(".")
  if col == 1 and line > 1 then
    vim.api.nvim_win_set_cursor(0, { line - 1, #vim.fn.getline(line - 1) })
  else
    vim.cmd("normal! h")
  end
end, { noremap = true, silent = true })




vim.keymap.set("i", "<Left>", function()
  local col = vim.fn.col(".")
  local line = vim.fn.line(".")

  if col == 1 and line > 1 then
    -- Move to end of previous line and stay in insert mode
    local prev_line_len = #vim.fn.getline(line - 1)
    vim.api.nvim_win_set_cursor(0, { line - 1, prev_line_len })
  else
    -- Normal left movement
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Left>", true, true, true), "n", false)
  end
end, { noremap = true, silent = true })

