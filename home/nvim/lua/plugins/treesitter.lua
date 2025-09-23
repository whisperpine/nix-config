local plugin = {}

plugin = {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  init = function()
    if
      vim.fn.filereadable(vim.g.base46_cache .. "syntax") == 1
      and vim.fn.filereadable(vim.g.base46_cache .. "treesitter") == 1
    then
      pcall(function()
        dofile(vim.g.base46_cache .. "syntax")
        dofile(vim.g.base46_cache .. "treesitter")
      end)
    end
  end,
}

plugin.config = function(_, opts)
  ---@type string[]
  local ensure_installed = opts.ensure_installed -- (list of your parsers)
  ---@type string[]
  local already_installed = require("nvim-treesitter").get_installed()
  ---@type string[]
  local parsers_to_install = vim
    .iter(ensure_installed)
    :filter(function(parser)
      return not vim.tbl_contains(already_installed, parser)
    end)
    :totable()
  ---@type string[]
  local parsers_to_uninstall = vim
    .iter(already_installed)
    :filter(function(parser)
      return not vim.tbl_contains(ensure_installed, parser)
    end)
    :totable()

  require("nvim-treesitter").install(parsers_to_install)
  require("nvim-treesitter").uninstall(parsers_to_uninstall, { summary = true })

  ---@type string[]
  local start_pattern = vim.tbl_extend("force", opts.ensure_installed, { "sh" })
  for index, value in ipairs(start_pattern) do
    -- Only use dockerfile parse in markdown files (code block). Don't start
    -- treesitter when the filetype is dockerfile, because of existing issues.
    if value == "dockerfile" then
      table.remove(start_pattern, index)
    end
  end

  -- add autocmd to start treesitter
  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("TreesitterStart", { clear = true }),
    pattern = start_pattern,
    callback = function(args)
      -- syntax highlighting, provided by Neovim
      vim.treesitter.start(args.buf)
      -- indentation, provided by nvim-treesitter
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  })
end

plugin.opts = {
  -- all the supported languages by tree-sitter:
  -- https://github.com/nvim-treesitter/nvim-treesitter
  ---@type string[]
  ensure_installed = {
    "markdown_inline",
    "markdown",
    "ecma",
    "javascript",
    "jsx",
    "typescript",
    "tsx",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "editorconfig",
    "ssh_config",
    "terraform",
    "hcl",
    "dockerfile",
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
    "html_tags",
    "css",
    "yaml",
    "toml",
    "json",
    "jsonc",
    "ruby",
    "hurl",
    "helm",
    "xml",
    "dtd",
    "zig",
    "nu",
    "c",
  },
}

return plugin
