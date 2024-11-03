require "nvchad.options"

-- add yours here!

local o = vim.o

-- to enable cursorline!
o.cursorlineopt = "both"
-- enables 24-bit RGB color
o.termguicolors = true
-- avoid error when displaying Chinese
o.encoding = "utf-8"
-- don't wrap lines when it's longer than the window width
o.wrap = false
-- cursor will always be 3 lines above the window edge
o.scrolloff = 3
-- set end of line style to LF
o.fileformat = "unix"
-- enable spell checking
o.spell = true
o.spelllang = "en_us"
-- -- show column line
-- o.colorcolumn = 80

-- -- indenting
-- o.tabstop=4
-- o.shiftwidth=4
-- o.softtabstop=4
