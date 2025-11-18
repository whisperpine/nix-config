local plugin = {}

plugin = {
  "zk-org/zk-nvim",
  main = "zk",
  cond = function()
    -- Only enable this plugin when `.zk` exists.
    return vim.uv.fs_stat(vim.fs.joinpath(vim.fn.getcwd(), ".zk")) ~= nil
  end,
}

plugin.dependencies = { "folke/which-key.nvim" }
plugin.init = function()
  local wk = require "which-key"
  wk.add {
    { "<leader>ma", icon = { icon = "", color = "grey" } },
    { "<leader>md", icon = { icon = "", color = "grey" } },
    { "<leader>mi", icon = { icon = "", color = "grey" } },
  }
end

plugin.opts = {
  -- Can be "telescope", "fzf", "fzf_lua", "minipick", or "select" (`vim.ui.select`).
  -- It's recommended to use "telescope", "fzf", "fzf_lua", or "minipick".
  picker = "telescope",
  lsp = { auto_attach = { enabled = false } },
}

-- Other keymaps are defined in nvim/ftplugin/markdown.lua
plugin.keys = {
  -- Index notes.
  { "<leader>mi", "<Cmd> ZkIndex <CR>", desc = "zk index" },
  -- Find notes.
  {
    "<leader>mm",
    "<Cmd> ZkNotes { sort = { 'modified' } } <CR>",
    desc = "telescope zk notes",
  },
  -- Open notes tags.
  { "<leader>mt", "<Cmd> ZkTags <CR>", desc = "telescope zk tags" },
  -- Create a new note under "zettelkasten".
  { "<leader>ma", "<Cmd> ZkNew { dir = 'zettelkasten' } <CR>", desc = "zk new abs" },
  -- Create a new dail note.
  {
    "<leader>md",
    "<Cmd> ZkNew { dir = vim.fn.getcwd() .. '/dailynotes' } <CR>",
    desc = "zk daily notes",
  },
  -- Open notes linking to the current buffer.
  { "<leader>mb", "<Cmd> ZkBacklinks <CR>", desc = "zk backlinks", ft = "markdown" },
  -- Open notes linked by the current buffer.
  { "<leader>ml", "<Cmd> ZkLinks <CR>", desc = "zk links", ft = "markdown" },
}

return plugin
