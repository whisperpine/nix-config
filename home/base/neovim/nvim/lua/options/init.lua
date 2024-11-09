-- use options from nvchad
require "nvchad.options"

-- config stevearc/conform.nvim
require "options.conform"
-- config MeanderingProgrammer/render-markdown.nvim
require "options.render-markdown"
-- config iamcco/markdown-preview.nvim
require "options.markdown-preview"
-- config L3MON4D3/LuaSnip
require("luasnip.loaders.from_vscode").load {
  paths = { "./snippets" },
}

-- enable inlay hints
vim.lsp.inlay_hint.enable(true, { 0 })

local o = vim.o

-- -- show column line
-- o.colorcolumn = 80
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
-- disable search highlighting
o.hlsearch = false
-- enable spell checking
o.spell = true
o.spelllang = "en_us,cjk"
-- fold by treesitter
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldlevelstart = 99
-- indenting
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4

-- autocmd --
local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- set no modifiable when the buffer is readonly
augroup("NoModWhenReadOnly", { clear = true })
autocmd("BufReadPost", {
  group = "NoModWhenReadOnly",
  command = "let &l:modifiable = !&readonly",
})

-- set indent size by filetype
augroup("SetIndent", { clear = true })
autocmd("Filetype", {
  group = "SetIndent",
  command = "setlocal shiftwidth=2 tabstop=2 softtabstop=2",
  pattern = {
    "javascript",
    "typescript",
    "terraform",
    "xhtml",
    "json",
    "html",
    "scss",
    "xml",
    "css",
    "nix",
    "yaml",
    "lua",
  },
})
