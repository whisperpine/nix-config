require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- press ";" in normal mode to enter command
-- map("n", ";", ":", { desc = "CMD enter command mode" })

-- press ctrl-s to save current buffer.
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- toggle outline (provided by outline.vim)
map("n", "<leader>o", "<cmd>Outline<cr>", { desc = "Toggle outline" })
