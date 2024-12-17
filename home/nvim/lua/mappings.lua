--------------------------
-- -- delete existing keymap.
-- local del = vim.keymap.del
-- del("n", "<C-PgUp>")
-- del("n", "<C-PgDn>")

---------------------
-- add custom keymap.
local map = vim.keymap.set

-- press `ctrl-s` to save current buffer.
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- only take effect in insert mode
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- only take effect in insert mode
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
