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
-- -- cursor will always be 3 lines above the window edge
-- o.scrolloff = 3
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
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- set no modifiable when the buffer is readonly
autocmd("BufReadPost", { command = "let &l:modifiable = !&readonly" })

-- set indent size by filetype
autocmd("Filetype", {
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
