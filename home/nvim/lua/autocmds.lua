local autocmd = vim.api.nvim_create_autocmd

-- user event that loads after UIEnter
-- modified from: https://github.com/NvChad/NvChad/blob/6f25b2739684389ca69ea8229386c098c566c408/lua/nvchad/autocmds.lua
autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("NvFilePost", { clear = true }),
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
  pattern = {
    "**/.local/share/nvim/**",
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
  callback = function()
    vim.bo.modifiable = not vim.bo.readonly
    vim.diagnostic.enable(not vim.bo.readonly, { bufnr = 0 })
  end,
})

-- set indent size by filetype
autocmd("Filetype", {
  command = "setlocal shiftwidth=2 tabstop=2 softtabstop=2",
  pattern = {
    "javascript",
    "typescript",
    "terraform",
    "sshconfig",
    "markdown",
    "xhtml",
    "json",
    "jsonc",
    "html",
    "scss",
    "yaml",
    "yml",
    "xml",
    "css",
    "nix",
    "lua",
  },
})

-- set `textwidth` in markdown files.
autocmd("Filetype", {
  pattern = { "markdown" },
  command = "setlocal textwidth=80",
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
