local plugin = {}

plugin = {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  event = "VeryLazy",
  build = ":TSUpdate",
  init = function()
    pcall(function()
      dofile(vim.g.base46_cache .. "syntax")
      dofile(vim.g.base46_cache .. "treesitter")
    end)
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
  require("nvim-treesitter").install(parsers_to_install)

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
  ---@type string[]
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
    "css",
    "yaml",
    "toml",
    "json",
    "jsonc",
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
