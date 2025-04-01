-- originates from:
-- https://github.com/neovim/nvim-lspconfig/blob/master/lua/lspconfig/configs/tailwindcss.lua

---@type vim.lsp.Config
local M = {
  cmd = { "tailwindcss-language-server", "--stdio" },
  root_markers = {
    "tailwind.config.js",
    "tailwind.config.cjs",
    "tailwind.config.mjs",
    "tailwind.config.ts",
    "postcss.config.js",
    "postcss.config.cjs",
    "postcss.config.mjs",
    "postcss.config.ts",
  },
}

M.filetypes = {
  "vue",
  "mdx",
  "css",
  "less",
  "postcss",
  "sass",
  "scss",
  "html",
  "sugarss",
  "javascript",
  "typescript",
  "svelte",
}

M.settings = {
  tailwindCSS = {
    validate = true,
    lint = {
      cssConflict = "warning",
      invalidApply = "error",
      invalidScreen = "error",
      invalidVariant = "error",
      invalidConfigPath = "error",
      invalidTailwindDirective = "error",
      recommendedVariantOrder = "warning",
    },
    classAttributes = {
      "class",
      "className",
      "class:list",
      "classList",
      "ngClass",
    },
    includeLanguages = {
      eelixir = "html-eex",
      eruby = "erb",
      templ = "html",
      htmlangular = "html",
    },
  },
}

return M

-- -- configuring single server: tailwindcss
-- lspconfig.tailwindcss.setup {
--   on_attach = on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
--   filetypes = {
--     "vue",
--     "mdx",
--     "css",
--     "less",
--     "postcss",
--     "sass",
--     "scss",
--     "html",
--     "sugarss",
--     "javascript",
--     "typescript",
--     "svelte",
--   },
-- }
