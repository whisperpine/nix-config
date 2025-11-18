-- Additional filetype bindings.
vim.filetype.add {
  extension = {
    env = "conf",
  },
  filename = {
    [".envrc"] = "sh",
    [".sqlfluff"] = "ini",
    ["terraform.tfstate"] = "json",
    ["terraform.tfstate.backup"] = "json",
    ["helmfile.yaml"] = "helm",
  },
  pattern = {
    [".env.*"] = "conf",
    [".*/templates/.*%.yaml"] = "helm",
    [".*/templates/.*%.tpl"] = "helm",
    [".*/conf.d/default.conf"] = "nginx",
    [".*%.conf.template"] = "nginx",
    [".*/cloudformation/.*%.ya?ml"] = "yaml.cloudformation",
    [".*/defaults/.*%.ya?ml"] = "yaml.ansible",
    [".*/host_vars/.*%.ya?ml"] = "yaml.ansible",
    [".*/group_vars/.*%.ya?ml"] = "yaml.ansible",
    [".*/group_vars/.*/.*%.ya?ml"] = "yaml.ansible",
    [".*/playbook.*%.ya?ml"] = "yaml.ansible",
    [".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
    [".*/roles/.*/tasks/.*%.ya?ml"] = "yaml.ansible",
    [".*/roles/.*/handlers/.*%.ya?ml"] = "yaml.ansible",
    [".*/tasks/.*%.ya?ml"] = "yaml.ansible",
    [".*/molecule/.*%.ya?ml"] = "yaml.ansible",
  },
}

-- Enable inlay hints.
vim.lsp.inlay_hint.enable(true, { 0 })

local opt = vim.opt
local o = vim.o
local g = vim.g

-------------------------------------- options ------------------------------------------
o.showmode = false

o.clipboard = "unnamedplus"
o.cursorline = true

opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true

-- Numbers.
o.number = true
o.numberwidth = 2
o.ruler = false

-- Disable nvim intro.
opt.shortmess:append "sI"

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true

-- Interval for writing swap file to disk, also used by gitsigns.
o.updatetime = 250

-- Go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line.
opt.whichwrap:append "<>[]hl"

-- Disable some default providers.
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- Enable cursorline.
o.cursorlineopt = "both"
-- Enables 24-bit RGB color.
o.termguicolors = true
-- Avoid error when displaying Chinese.
o.encoding = "utf-8"
-- Don't wrap lines when it's longer than the window width.
o.wrap = false
-- -- Cursor will always be 3 lines above the window edge.
-- o.scrolloff = 3
-- Disable search highlighting.
o.hlsearch = false
-- Disable spell checking.
o.spell = false
-- "yusong" refers to "nvim/spell/yusong.utf-8.spl".
-- Every time after nvim/spell/yusong being modified,
-- remember to run command (":mkspell") to generate `.spl`.
o.spelllang = "en_us,cjk,yusong"
-- Fold by treesitter.
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldlevelstart = 99
-- Indenting.
o.shiftwidth = 4 -- number of spaces to use when (auto)indenting
o.softtabstop = 4 -- number of spaces that a tab counts for
o.expandtab = true -- insert spaces instead of tab when pressing `Tab` key
o.smartindent = false -- disabled because indentexpr is a more advanced alternative
-- Disable right-click menu.
o.mousemodel = "extend"
o.mouse = "a"
-- Always show status in the last window.
o.laststatus = 3
-- `c:ver25` set the cursor as a vertical line.
o.guicursor = "n-v-sm:block,c:ver25,i-ci-ve:ver25,r-cr-o:hor20"
