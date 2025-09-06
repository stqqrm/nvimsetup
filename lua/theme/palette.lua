-- theme.lua

local M = {}

function M.setup()
  -- Color palette
  local colors = {
    bg         = "#000000",  -- Black background
    fg         = "#A0A0A0",  -- Darker gray for plain text

    gray       = "#606060",
    dark_gray  = "#3A3A3A",

    orange     = "#FFA500",  -- For types, keywords
    soft_orange= "#D19A66",  -- Strings
    deep_orange= "#CC8400",
    red        = "#D16969",
    yellow     = "#FFD700",
    type       = "#FFA500",

    comment    = "#5C6370",
    string     = "#D19A66",
    number     = "#B5CEA8",
    constant   = "#569CD6",
    function_  = "#C586C0",
    operator   = "#D4D4D4",

    preproc    = "#3A3A3A", -- deep gray for #define, #else, etc
  }

  local set = vim.api.nvim_set_hl
  local ns = 0

  -- UI
  set(ns, "Normal",         { fg = colors.fg, bg = colors.bg })
  set(ns, "CursorLine",     { bg = colors.dark_gray })
  set(ns, "Visual",         { bg = colors.dark_gray })
  set(ns, "LineNr",         { fg = colors.gray })
  set(ns, "CursorLineNr",   { fg = colors.orange })
  set(ns, "StatusLine",     { fg = colors.fg, bg = colors.dark_gray })
  set(ns, "VertSplit",      { fg = colors.dark_gray })

  -- Syntax Highlighting
  set(ns, "Comment",        { fg = colors.comment, italic = true })
  set(ns, "String",         { fg = colors.string })
  set(ns, "Character",      { fg = colors.string })
  set(ns, "Number",         { fg = colors.number })
  set(ns, "Boolean",        { fg = colors.constant })
  set(ns, "Float",          { fg = colors.number })

  set(ns, "Identifier",     { fg = colors.fg }) -- plain variables
  set(ns, "Function",       { fg = colors.function_ })

  set(ns, "Keyword",        { fg = colors.orange, italic = true })
  set(ns, "Conditional",    { fg = colors.orange })
  set(ns, "Repeat",         { fg = colors.orange })
  set(ns, "Operator",       { fg = colors.operator })
  set(ns, "Constant",       { fg = colors.constant })
  set(ns, "Type",           { fg = colors.type })
  set(ns, "StorageClass",   { fg = colors.orange })
  set(ns, "Structure",      { fg = colors.type })
  set(ns, "Typedef",        { fg = colors.orange })

  -- Preprocessor
  set(ns, "PreProc",        { fg = colors.preproc })
  set(ns, "Define",         { fg = colors.preproc })
  set(ns, "Macro",          { fg = colors.preproc })
  set(ns, "Include",        { fg = colors.preproc })

  -- Diagnostic
  set(ns, "DiagnosticError",       { fg = colors.red })
  set(ns, "DiagnosticWarn",        { fg = colors.orange })
  set(ns, "DiagnosticInfo",        { fg = colors.gray })
  set(ns, "DiagnosticHint",        { fg = colors.gray })

  -- Misc
  set(ns, "Title",          { fg = colors.orange, bold = true })
  set(ns, "Todo",           { fg = colors.red, bold = true })
  set(ns, "Error",          { fg = colors.red, bold = true })
  set(ns, "WarningMsg",     { fg = colors.orange })

  -- Treesitter
  set(ns, "@function",      { fg = colors.function_ })
  set(ns, "@variable",      { fg = colors.fg })
  set(ns, "@constant",      { fg = colors.constant })
  set(ns, "@type",          { fg = colors.type })
  set(ns, "@keyword",       { fg = colors.orange })
  set(ns, "@string",        { fg = colors.string })
  set(ns, "@number",        { fg = colors.number })
  set(ns, "@comment",       { fg = colors.comment })
  set(ns, "@operator",      { fg = colors.operator })
  set(ns, "@preproc",       { fg = colors.preproc })
end

return M

