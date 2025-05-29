local plugin = {}

plugin = {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  init = function()
    pcall(function()
      dofile(vim.g.base46_cache .. "syntax")
      dofile(vim.g.base46_cache .. "treesitter")
    end)
  end,
}

plugin.config = function(_, opts)
  local ensure_installed = opts.ensure_installed -- (list of your parsers)
  local already_installed = require("nvim-treesitter").get_installed()
  local parsers_to_install = vim
    .iter(ensure_installed)
    :filter(function(parser)
      return not vim.tbl_contains(already_installed, parser)
    end)
    :totable()
  require("nvim-treesitter").install(parsers_to_install)

  -- add autocmd to start treesitter
  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("TreesitterStart", { clear = true }),
    pattern = opts.ensure_installed,
    callback = function(args)
      vim.treesitter.start(args.buf)
    end,
  })
end

plugin.opts = {
  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = {
    enable = true, -- this will set `indentexpr`
    disable = { "python", "yaml" }, -- disable for these languages
  },

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
    "hurl",
    "helm",
    "xml",
    "zig",
    "nu",
    "c",
  },
}

return plugin
