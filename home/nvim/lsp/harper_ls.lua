-- originates from:
-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/harper_ls.lua

---@type vim.lsp.Config
local M = {
  cmd = { "harper-ls", "--stdio" },
  root_markers = { ".git" },
  filetypes = { "markdown" },
}

M.settings = {
  ["harper-ls"] = {
    -- default userDictPath: ~/.config/harper-ls/dictionary.txt
    userDictPath = "",
    -- default fileDictPath: ~/.local/share/harper-ls/file_dictionaries
    fileDictPath = "",
    -- see all linter rules:
    -- https://writewithharper.com/docs/rules
    linters = {
      AnA = false,
      Dashes = false,
      SpellCheck = false,
      ToDoHyphen = false,
      UnclosedQuotes = false,
      SentenceCapitalization = false,
      CapitalizePersonalPronouns = false,
      ExpandStandardInput = false,
      OxfordComma = false,
      CommaFixes = false,
    },
    codeActions = {
      ForceStable = true,
    },
    markdown = {
      IgnoreLinkTitle = true,
    },
    diagnosticSeverity = "hint",
    isolateEnglish = true,
  },
}

return M
