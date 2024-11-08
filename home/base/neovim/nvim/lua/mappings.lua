-- use mappings from nvchad.
require "nvchad.mappings"

--------------------------
-- delete existing keymap.
local del = vim.keymap.del

-- toggle line number
del("n", "<leader>n")
-- toggle comment
del({ "n", "v" }, "<leader>/")
-- terminal new horizontal term
del("n", "<leader>h")
-- terminal new vertical term
del("n", "<leader>v")
-- nvimtree focus window
del("n", "<leader>e")
-- telescope git status (by nvchad)
del("n", "<leader>gt")
-- telescope pick term (by nvchad)
del("n", "<leader>pt")

---------------------
-- add custom keymap.
local map = vim.keymap.set

-- press ctrl-s to save current buffer.
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- toggle inlay hints
map("n", "<leader>cl", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { noremap = true, desc = "toggle inlay hints" })
-- toggle outline (provided by outline.vim)
map("n", "<leader>co", "<cmd>Outline<cr>", { desc = "toggle outline" })
-- toggle markdown preview ( provided by markdown-preview.nvim)
map("n", "<leader>mv", "<cmd>MarkdownPreviewToggle<cr>", { desc = "toggle markdown preview" })
-- toggle markdown rendering ( provided by render-markdown.nvim)
map("n", "<leader>mr", "<cmd>RenderMarkdown toggle<cr>", { desc = "toggle render markdown" })
-- telescope git status
map("n", "<leader>fg", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
-- reset the hunk around cursor
map("n", "<leader>cr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "git reset hunk" })
