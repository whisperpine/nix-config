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
    [".*/templates/.*%.yaml"] = "helm",
    [".*/templates/.*%.tpl"] = "helm",
  },
}

-- enable inlay hints
vim.lsp.inlay_hint.enable(true, { 0 })

local opt = vim.opt
local o = vim.o
local g = vim.g

-- config highlight groups
-- local highlights = {
--   -- CursorLine = { bg = "#313131" },
-- }
-- for group, opts in pairs(highlights) do
--   vim.api.nvim_set_hl(0, group, opts)
-- end

-------------------------------------- options ------------------------------------------
o.showmode = false

o.clipboard = "unnamedplus"
o.cursorline = true

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true

-- Numbers
o.number = true
o.numberwidth = 2
o.ruler = false

-- disable nvim intro
opt.shortmess:append "sI"

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
o.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

-- disable some default providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

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
-- disable spell checking
o.spell = false
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
o.expandtab = true
o.smartindent = false
-- disable right-click menu
o.mousemodel = "extend"
o.mouse = "a"
-- always show status in the last window
o.laststatus = 3
-- `c:ver25` set the cursor as a vertical line
o.guicursor = "n-v-sm:block,c:ver25,i-ci-ve:ver25,r-cr-o:hor20"
