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

local opt = vim.opt

-- to enable cursorline
opt.cursorlineopt = "both"
-- enables 24-bit RGB color
opt.termguicolors = true
-- avoid error when displaying Chinese
opt.encoding = "utf-8"
-- don't wrap lines when it's longer than the window width
opt.wrap = false
-- -- cursor will always be 3 lines above the window edge
-- opt.scrolloff = 3
-- disable search highlighting
opt.hlsearch = false
-- enable spell checking
opt.spell = true
-- "yusong" refers to nvim/spell/yusong.utf-8.spl
-- every time after nvim/spell/yusong being modified,
-- remember to run command (":mkspell") to generate `.spl`.
opt.spelllang = "en_us,cjk,yusong"
-- fold by treesitter
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevelstart = 99
-- indenting
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
-- disable right-click menu
opt.mousemodel = "extend"
-- always show status in the last window
opt.laststatus = 3
-- `c:ver25` set the cursor as a vertical line
vim.o.guicursor =
  "n-v-sm:block,c:ver25,i-ci-ve:ver25,r-cr-o:hor20,t:block-blinkon500-blinkoff500-TermCursor"
