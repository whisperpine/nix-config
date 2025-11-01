local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- user event that loads after UIEnter
-- modified from: https://github.com/NvChad/NvChad/blob/6f25b2739684389ca69ea8229386c098c566c408/lua/nvchad/autocmds.lua
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

-- make generated directories and files readonly
autocmd({ "BufRead" }, {
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

-- when current buffer is readonly,
-- set no modifiable and disable diagnostics
autocmd("BufReadPost", {
  group = augroup("ReadonlyNoModifiableDiagnostics", { clear = true }),
  callback = function()
    vim.bo.modifiable = not vim.bo.readonly
    vim.diagnostic.enable(not vim.bo.readonly, { bufnr = 0 })
  end,
})

-- set indent size by filetype
autocmd("Filetype", {
  group = augroup("SetIndentSizeByFiletype", { clear = true }),
  command = "setlocal shiftwidth=2 softtabstop=2",
  pattern = {
    "javascriptreact",
    "javascript",
    "typescriptreact",
    "typescript",
    "terraform",
    "sshconfig",
    "markdown",
    "graphql",
    "xhtml",
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
    "just",
    "bash",
    "zsh",
    "sh",
  },
})

-- set `textwidth` in markdown files.
autocmd("BufEnter", {
  group = augroup("SetTextwidthForMarkdown", { clear = true }),
  pattern = { "*.md" },
  command = "setlocal textwidth=80",
})

-- restore cursor position on file open
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

-- turn off spell checking in terminal mode
autocmd("TermOpen", {
  group = augroup("TerminalDisableSpellChecking", { clear = true }),
  pattern = "*",
  callback = function()
    vim.o.spell = false
  end,
})

-- clear indentexpr for python
autocmd("BufEnter", {
  group = augroup("SetPythonIndentexpr", { clear = true }),
  pattern = "*.py",
  command = "setlocal indentexpr=",
})

-- clear indentexpr for yaml
autocmd("BufEnter", {
  group = augroup("SetYamlIndentexpr", { clear = true }),
  pattern = "*.yaml",
  command = "setlocal indentexpr=",
})

-- reconfigure the comment string for ini filetype
autocmd("Filetype", {
  group = augroup("SetIniCommentString", { clear = true }),
  pattern = "ini",
  callback = function()
    -- the default value is "; %s"
    vim.bo.commentstring = "# %s"
  end,
})

-- set the formatter for "yaml.ansible" filetype
autocmd("Filetype", {
  group = augroup("SetAnsibleFormatter", { clear = true }),
  pattern = "yaml.ansible",
  callback = function()
    require("conform").formatters.deno_fmt = {
      args = { "fmt", "-", "--ext", "yaml" },
    }
  end,
})

-- set the formatter for "yaml.cloudformation" filetype
autocmd("Filetype", {
  group = augroup("SetAnsibleFormatter", { clear = true }),
  pattern = "yaml.cloudformation",
  callback = function()
    require("conform").formatters.deno_fmt = {
      args = { "fmt", "-", "--ext", "yaml" },
    }
  end,
})
