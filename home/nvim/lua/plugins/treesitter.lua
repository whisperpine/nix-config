local M = {}

M = {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
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

M.config = function(_, opts)
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

  -- for index, value in ipairs(ensure_installed) do
  --   -- Only use dockerfile parse in markdown files (code block). Don't start
  --   -- treesitter when the filetype is dockerfile, because of existing issues.
  --   if value == "dockerfile" then
  --     table.remove(ensure_installed, index)
  --   end
  -- end

  -- Add autocmd to start treesitter.
  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("TreesitterStart", { clear = true }),
    pattern = ensure_installed,
    callback = function(args)
      -- Syntax highlighting, provided by Neovim.
      vim.treesitter.start(args.buf)
      -- Indentation, provided by nvim-treesitter.
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  })

  -- Add autocmd to start treesitter (for "sh" filetype).
  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("TreesitterStartSh", { clear = true }),
    pattern = { "sh", "dotenv" },
    callback = function(args)
      vim.treesitter.start(args.buf, "bash")
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  })

  -- Add autocmd to start treesitter (for "terraform-test" filetype).
  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("TreesitterStartTerraform", { clear = true }),
    pattern = { "terraform-test" },
    callback = function(args)
      vim.treesitter.start(args.buf, "terraform")
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  })

  -- Add autocmd to start treesitter (for "qml" filetype).
  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("TreesitterStartQML", { clear = true }),
    pattern = { "qml" },
    callback = function(args)
      vim.treesitter.start(args.buf, "qmljs")
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  })

  -- Add autocmd to start treesitter (for "javascriptreact" and "typescriptreact").
  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("TreesitterStartJsTs", { clear = true }),
    pattern = { "javascriptreact", "typescriptreact" },
    callback = function(args)
      vim.treesitter.start(args.buf)
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  })

  -- Add autocmd to start treesitter (for "yaml.ansible" and "yaml.cloudformation" filetype).
  vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("TreesitterStartAnsible", { clear = true }),
    pattern = { "yaml.ansible", "yaml.cloudformation" },
    callback = function(args)
      vim.treesitter.start(args.buf, "yaml")
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  })
end

M.opts = {
  -- Install treesitter parsers under "/home/yusong/.local/share/nvim/site/".
  install_dir = vim.fn.stdpath "data" .. "/site",

  -- All the supported languages by tree-sitter:
  -- https://github.com/nvim-treesitter/nvim-treesitter
  ---@type string[]
  ensure_installed = {
    "kdl",
    "http",
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
    "hyprlang",
    "wgsl_bevy",
    "wgsl",
    "c_sharp",
    "python",
    "vimdoc",
    "printf",
    "latex",
    "typst",
    "qmljs",
    "vim",
    "proto",
    "nix",
    "bash",
    "zsh",
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
    "go",
    "c",
  },
}

return M
