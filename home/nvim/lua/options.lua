-- use options from nvchad
require "nvchad.options"

-- additional filetype bindings
vim.filetype.add {
  extension = {
    env = "conf",
  },
  filename = {
    ["terraform.tfstate"] = "json",
    ["terraform.tfstate.backup"] = "json",
  },
  pattern = {
    [".env.*"] = "conf",
  },
}

-- enable inlay hints
vim.lsp.inlay_hint.enable(true, { 0 })

local o = vim.o

-- to enable cursorline
o.cursorlineopt = "both"
-- enables 24-bit RGB color
o.termguicolors = true
-- avoid error when displaying Chinese
o.encoding = "utf-8"
-- don't wrap lines when it's longer than the window width
o.wrap = false
-- -- cursor will always be 3 lines above the window edge
-- o.scrolloff = 3
-- disable search highlighting
o.hlsearch = false
-- enable spell checking
o.spell = true
-- "yusong" refers to nvim/spell/yusong.utf-8.spl
-- every time after nvim/spell/yusong being modified,
-- remember to run command (":mkspell") to generate `.spl`.
o.spelllang = "en_us,cjk,yusong"
-- fold by treesitter
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldlevelstart = 99
-- indenting
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
-- disable right-click menu
o.mousemodel = "extend"
-- always show status in the last window
o.laststatus = 3
-- `c:ver25` set the cursor as a vertical line
vim.o.guicursor =
  "n-v-sm:block,c:ver25,i-ci-ve:ver25,r-cr-o:hor20,t:block-blinkon500-blinkoff500-TermCursor"
