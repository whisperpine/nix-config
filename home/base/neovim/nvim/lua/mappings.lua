--------------------------
-- -- delete existing keymap.
-- local del = vim.keymap.del
-- del("n", "<C-PgUp>")
-- del("n", "<C-PgDn>")

---------------------
-- add custom keymap.
local map = vim.keymap.set

-- press ctrl-s to save current buffer.
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- toggle inlay hints
map("n", "<leader>cl", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { noremap = true, desc = "toggle inlay hints" })
-- toggle markdown preview ( provided by markdown-preview.nvim)
map("n", "<leader>mv", "<cmd> MarkdownPreviewToggle <cr>", { desc = "toggle markdown preview" })
-- toggle markdown rendering ( provided by render-markdown.nvim)
map("n", "<leader>mr", "<cmd> RenderMarkdown toggle <cr>", { desc = "toggle render markdown" })
-- reset the hunk around cursor
map("n", "<leader>cr", "<cmd> Gitsigns reset_hunk <cr>", { desc = "git reset hunk" })
-- stage the hunk around cursor
map("n", "<leader>cs", "<cmd> Gitsigns stage_hunk <cr>", { desc = "git stage hunk" })

map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

map("n", "<Esc>", "<cmd> noh <cr>", { desc = "general clear highlights" })

map("n", "<C-s>", "<cmd> w <cr>", { desc = "general save file" })
map("n", "<C-c>", "<cmd> %y+ <cr>", { desc = "general copy whole file" })

map("n", "<leader>rn", "<cmd> set rnu! <cr>", { desc = "toggle relative number" })
map("n", "<leader>ch", "<cmd> NvCheatsheet <cr>", { desc = "toggle nvcheatsheet" })

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

-- nvimtree
map("n", "<C-n>", "<cmd> NvimTreeToggle <cr>", { desc = "nvimtree toggle window" })

-- telescope
map("n", "<leader>fw", "<cmd> Telescope live_grep <cr>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd> Telescope buffers <cr>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd> Telescope help_tags <cr>", { desc = "telescope help page" })
map("n", "<leader>ma", "<cmd> Telescope marks <cr>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd> Telescope oldfiles <cr>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd> Telescope current_buffer_fuzzy_find <cr>", { desc = "telescope find in current buffer" })
map("n", "<leader>fm", "<cmd> Telescope git_bcommits <cr>", { desc = "telescope git buffer commits" })
map("n", "<leader>fg", "<cmd> Telescope git_status <cr>", { desc = "telescope git status" })
map("n", "<leader>ft", "<cmd> Telescope terms <cr>", { desc = "telescope pick hidden term" })

map("n", "<leader>th", function()
  require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })

map("n", "<leader>ff", "<cmd> Telescope find_files <cr>", { desc = "telescope find files" })
map(
  "n",
  "<leader>fa",
  "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <cr>",
  { desc = "telescope find all files" }
)

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
