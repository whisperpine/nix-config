--------------------------
-- -- delete existing keymap.
-- local del = vim.keymap.del
-- del("n", "<C-PgUp>")
-- del("n", "<C-PgDn>")

---------------------
-- add custom keymap.
local map = vim.keymap.set

-- press `ctrl-s` to save current buffer.
map({ "n" }, "<C-s>", "<cmd> w <cr>")

-- only take effect in insert mode
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })

-- only take effect in normal mode
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })
map("n", "<Esc>", "<cmd> noh <cr>", { desc = "general clear highlights" })
map("n", "<C-s>", "<cmd> w <cr>", { desc = "general save file" })
map("n", "<C-c>", "<cmd> %y+ <cr>", { desc = "general copy whole file" })
map("n", "<leader>rn", "<cmd> set rnu! <cr>", { desc = "toggle relative number" })
map("n", "<leader>ch", "<cmd> NvCheatsheet <cr>", { desc = "toggle nvcheatsheet" })

-- toggle inlay hints
map("n", "<leader>cl", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { noremap = true, desc = "toggle inlay hints" })

-- tabufline
map("n", "<Tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })
map("n", "<S-Tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })
map("n", "<leader>x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })
map("n", "<leader>b", function()
  require("nvchad.tabufline").closeAllBufs(false)
end, { desc = "buffer only" })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
map({ "n", "t" }, "<A-v>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })
map({ "n", "t" }, "<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })
map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })

-- diagnostic
map("n", "<leader>dt", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled { bufnr = 0 }, { bufnr = 0 })
end, { noremap = true, desc = "toggle buffer diagnostic" })
map("n", "<leader>dT", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled { bufnr = 0 })
end, { noremap = true, desc = "toggle workspace diagnostic" })

-- by default lsp config sets K in normal mode to hover with no border.
-- https://github.com/neovim/nvim-lspconfig?tab=readme-ov-file#configuration
-- manually overriding the mapping passing in the border style.
map("n", "K", function()
  local clients = vim.lsp.get_clients { bufnr = vim.api.nvim_get_current_buf() }
  if #clients <= 0 then
    return
  end
  local ft = vim.bo.filetype
  local lspsaga_hover_filetypes = { "json", "yaml", "css", "python", "yaml.ansible" }
  if vim.tbl_contains(lspsaga_hover_filetypes, ft) then
    -- The native keymap for "K" in normal mode is `vim.lsp.buf.hover`.
    -- But some language servers will show unexpected backslash before certain
    -- punctuation (e.g. vscode-langservers-extracted, basedpyright).
    -- By leveraging lspsaga, we can work around this issues.
    require("lspsaga.hover"):render_hover_doc()
  else
    vim.lsp.buf.hover { border = "single" }
  end
end, { desc = "LSP show details", silent = true, noremap = true })
