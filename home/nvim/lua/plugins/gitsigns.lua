local M = {}

M = {
  "lewis6991/gitsigns.nvim",
  event = "User FilePost",
}

M.opts = function()
  if vim.fn.filereadable(vim.g.base46_cache .. "git") == 1 then
    dofile(vim.g.base46_cache .. "git")
  end
  return {
    signs = {
      delete = { text = "󰍵" },
      changedelete = { text = "󱕖" },
    },
  }
end

M.keys = {
  { "<leader>rr", "<cmd> Gitsigns reset_hunk <cr>", desc = "git reset hunk" },
  { "<leader>rs", "<cmd> Gitsigns stage_hunk <cr>", desc = "git stage hunk" },
}

return M
