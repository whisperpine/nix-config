-- use options from nvchad
require "nvchad.options"

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
-- remember to run command (":mkspell") to generate .spl.
o.spelllang = "en_us,cjk,yusong"
-- fold by treesitter
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldlevelstart = 99
-- indenting
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4

-- autocmd --
local autocmd = vim.api.nvim_create_autocmd

-- set no modifiable when the buffer is readonly
autocmd("BufReadPost", { command = "let &l:modifiable = !&readonly" })

-- set indent size by filetype
autocmd("Filetype", {
  command = "setlocal shiftwidth=2 tabstop=2 softtabstop=2",
  pattern = {
    "javascript",
    "typescript",
    "terraform",
    "markdown",
    "xhtml",
    "json",
    "jsonc",
    "html",
    "scss",
    "yaml",
    "yml",
    "xml",
    "css",
    "nix",
    "lua",
  },
})

-- set textwidth in markdown files.
autocmd("Filetype", {
  command = "setlocal textwidth=80",
  pattern = { "markdown" },
})

-- restore cursor position on file open
autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line "'\""
    if
      line > 1
      and line <= vim.fn.line "$"
      and vim.bo.filetype ~= "commit"
      and vim.fn.index({ "xxd", "gitrebase" }, vim.bo.filetype) == -1
    then
      vim.cmd 'normal! g`"'
    end
  end,
})

-- turn off spell checking in terminal mode
autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    vim.o.spell = false
  end,
})
