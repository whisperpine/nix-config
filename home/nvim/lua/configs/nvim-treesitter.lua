pcall(function()
  dofile(vim.g.base46_cache .. "syntax")
  dofile(vim.g.base46_cache .. "treesitter")
end)

local M = {}

M.highlight = {
  enable = true,
  use_languagetree = true,
}

M.indent = {
  enable = true, -- this will set `indentexpr`
  disable = { "python" }, -- disable for python
}

-- all the supported languages by tree-sitter:
-- https://github.com/nvim-treesitter/nvim-treesitter
M.ensure_installed = {
  "markdown_inline",
  "markdown",
  "javascript",
  "typescript",
  "git_config",
  "git_rebase",
  "gitattributes",
  "gitcommit",
  "gitignore",
  "editorconfig",
  "ssh_config",
  "terraform",
  "mermaid",
  "graphql",
  "svelte",
  "wgsl_bevy",
  "wgsl",
  "c_sharp",
  "python",
  "vimdoc",
  "printf",
  "latex",
  "typst",
  "vim",
  "proto",
  "nix",
  "bash",
  "ini",
  "regex",
  "nginx",
  "just",
  "sql",
  "cpp",
  "rust",
  "luadoc",
  "lua",
  "html",
  "css",
  "yaml",
  "toml",
  "json",
  "ruby",
  "xml",
  "nu",
  "c",
}

return M
