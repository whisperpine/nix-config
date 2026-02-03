local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- User event that loads after UIEnter.
-- Modified from: https://github.com/NvChad/NvChad/blob/6f25b2739684389ca69ea8229386c098c566c408/lua/nvchad/autocmds.lua
autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
  group = augroup("NvFilePost", { clear = true }),
  callback = function(args)
    if not vim.g.ui_entered and args.event == "UIEnter" then
      vim.g.ui_entered = true
    end

    if vim.g.ui_entered then
      vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
      vim.api.nvim_del_augroup_by_name "NvFilePost"

      vim.schedule(function()
        vim.api.nvim_exec_autocmds("FileType", {})
        if vim.g.editorconfig then
          require("editorconfig").config(args.buf)
        end
      end)
    end
  end,
})

-- Make generated directories and files readonly.
autocmd("BufRead", {
  group = augroup("DirFileReadonly", { clear = true }),
  pattern = {
    "**/.local/share/nvim/lazy/**",
    "**/.cargo/registry/**",
    "**/node_modules/**",
    "**/.venv/**",
    "**/target/**",
    "**/.direnv/**",
    "*.lock",
  },
  callback = function()
    vim.bo.readonly = true
  end,
})

-- Disable indentexpr for certain filetypes.
-- This prevents auto indenting when typeing in insert mode.
autocmd("Filetype", {
  group = augroup("DisableIndentExpr", { clear = true }),
  pattern = { "yaml", "yaml.ansible", "yaml.cloudformation", "sh", "bash", "zsh" },
  callback = function()
    vim.opt_local.indentexpr = ""
  end,
})

-- Use the neovim's native indentexpr for rust.
autocmd("Filetype", {
  group = augroup("SetIndentExprRust", { clear = true }),
  pattern = "rust",
  command = "set indentexpr=GetRustIndent(v:lnum)",
})

-- When current buffer is readonly,
-- set no modifiable and disable diagnostics.
autocmd("BufReadPost", {
  group = augroup("ReadonlyNoModifiableDiagnostics", { clear = true }),
  callback = function()
    vim.bo.modifiable = not vim.bo.readonly
    vim.diagnostic.enable(not vim.bo.readonly, { bufnr = 0 })
  end,
})

-- Set indent size by filetype.
autocmd("Filetype", {
  group = augroup("SetIndentSizeByFiletype", { clear = true }),
  command = "setlocal shiftwidth=2 softtabstop=2",
  pattern = {
    "javascriptreact",
    "javascript",
    "typescriptreact",
    "typescript",
    "terraform",
    "terraform-test",
    "sshconfig",
    "markdown",
    "graphql",
    "xhtml",
    "query",
    "json",
    "jsonc",
    "hurl",
    "html",
    "scss",
    "yaml",
    "helm",
    "toml",
    "yml",
    "xml",
    "css",
    "nix",
    "lua",
    "hcl",
    "just",
    "bash",
    "zsh",
    "sh",
  },
})

-- Restore cursor position on file open.
autocmd("BufReadPost", {
  group = augroup("RestoreCursorPosition", { clear = true }),
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

-- Set the formatter for "yaml.ansible" and "yaml.cloudformation".
autocmd("Filetype", {
  group = augroup("SetYamlFormatter", { clear = true }),
  pattern = { "yaml.ansible", "yaml.cloudformation" },
  callback = function()
    require("conform").formatters.deno_fmt = {
      args = { "fmt", "-", "--ext", "yaml" },
    }
  end,
})

-- Disable vim.diagnostic in floating windows.
autocmd("BufWinEnter", {
  group = augroup("NoDiagnosticInFloatingWindow", { clear = true }),
  callback = function(args)
    local bufnr = args.buf
    local winid = vim.fn.bufwinid(bufnr)
    if winid ~= -1 and vim.api.nvim_win_get_config(winid).relative ~= "" then
      -- this buffer is in a floating window
      vim.diagnostic.enable(false, { bufnr = 0 })
    end
  end,
})

-- Modify formatoptions for all filetypes.
autocmd("Filetype", {
  group = augroup("SetFormatOptionsForAll", { clear = true }),
  command = "set formatoptions-=ro",
  pattern = "*",
})
