local c = require("theme.palette").c
local hl = vim.api.nvim_set_hl

hl(0, "@comment", { link = "Comment" })

hl(0, "@keyword", { fg = c.purple, bold = true })
hl(0, "@keyword.function", { fg = c.purple, bold = true })
hl(0, "@keyword.return", { fg = c.purple, bold = true })

hl(0, "@string", { fg = c.pink })
hl(0, "@string.escape", { fg = c.pink2 })

hl(0, "@number", { fg = c.pink2 })
hl(0, "@boolean", { fg = c.pink2 })

hl(0, "@function", { fg = c.blue })
hl(0, "@function.call", { fg = c.blue })
hl(0, "@function.method", { fg = c.blue })

hl(0, "@variable", { fg = c.fg })
hl(0, "@variable.parameter", { fg = c.fg })
hl(0, "@variable.member", { fg = c.blue2 })

hl(0, "@property", { fg = c.blue2 })

hl(0, "@type", { fg = c.magenta })
hl(0, "@type.builtin", { fg = c.magenta })
hl(0, "@constructor", { fg = c.magenta })

hl(0, "@constant", { fg = c.purple })
hl(0, "@constant.builtin", { fg = c.purple })

hl(0, "@tag", { fg = c.fg, bold = true })
hl(0, "@tag.attribute", { fg = c.fg })
hl(0, "@tag.delimiter", { fg = "#adadad" })
