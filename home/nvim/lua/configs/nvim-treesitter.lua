pcall(function()
  dofile(vim.g.base46_cache .. "syntax")
  dofile(vim.g.base46_cache .. "treesitter")
end)

return {
  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },

  -- all the supported languages by tree-sitter:
  -- https://github.com/nvim-treesitter/nvim-treesitter
  ensure_installed = {
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
    "nu",
    "c",
  },
}
