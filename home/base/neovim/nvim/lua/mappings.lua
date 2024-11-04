require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- press ctrl-s to save current buffer.
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- toggle outline (provided by outline.vim)
map("n", "<leader>o", "<cmd>Outline<cr>", { desc = "toggle outline" })
-- toggle inlay hints
map("n", "<leader>cl", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { noremap = true, desc = "toggle inlay hints" })
