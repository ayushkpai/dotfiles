local c = require("theme.palette").c
local hl = vim.api.nvim_set_hl

vim.cmd("highlight clear")

hl(0, "Normal", { fg = c.fg, bg = c.bg })
hl(0, "NormalFloat", { fg = c.fg, bg = c.bg_float })
hl(0, "FloatBorder", { fg = c.border })

hl(0, "CursorLine", { bg = c.line })
hl(0, "CursorLineNr", { fg = c.blue })
hl(0, "LineNr", { fg = "#5966cc" })

hl(0, "Visual", { bg = c.selection })

hl(0, "Comment", {
  fg = c.comment,
  italic = true,
})

hl(0, "String", {
  fg = c.pink,
})

hl(0, "Number", {
  fg = c.pink_light,
})

hl(0, "Keyword", {
  fg = c.purple,
  bold = true,
})

hl(0, "Function", {
  fg = c.blue,
})

hl(0, "Type", {
  fg = c.magenta,
})

hl(0, "Constant", {
  fg = c.purple,
})

hl(0, "StatusLine", {
  fg = "#c4cbff",
  bg = c.status,
})

hl(0, "Pmenu", {
  fg = c.fg,
  bg = c.bg_float,
})

hl(0, "PmenuSel", {
  fg = c.fg,
  bg = "#5966cc",
})

hl(0, "DiagnosticError", {
  fg = c.red,
})

hl(0, "DiagnosticWarn", {
  fg = c.yellow,
})

hl(0, "DiagnosticInfo", {
  fg = c.blue,
})

hl(0, "DiagnosticHint", {
  fg = c.green,
})
