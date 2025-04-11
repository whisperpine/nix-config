local plugin = {}

plugin = {
  "zk-org/zk-nvim",
  main = "zk",
  cond = function()
    -- only enable this plugin when `.zk` exists
    return vim.uv.fs_stat(vim.fs.joinpath(vim.fn.getcwd(), ".zk")) ~= nil
  end,
}

plugin.dependencies = { "folke/which-key.nvim" }
plugin.init = function()
  local wk = require "which-key"
  wk.add {
    -- { "<leader>mn", icon = { icon = "", color = "grey" } },
    { "<leader>ma", icon = { icon = "", color = "grey" } },
    { "<leader>md", icon = { icon = "", color = "grey" } },
    { "<leader>mi", icon = { icon = "", color = "grey" } },
  }
end

plugin.opts = {
  -- can be "telescope", "fzf", "fzf_lua", "minipick", or "select" (`vim.ui.select`)
  -- it's recommended to use "telescope", "fzf", "fzf_lua", or "minipick"
  picker = "telescope",
  lsp = {
    auto_attach = { enabled = false },
  },
}

-- other keymaps are defined in nvim/ftplugin/markdown.lua
plugin.keys = {
  -- index notes
  {
    "<leader>mi",
    "<Cmd> ZkIndex <CR>",
    desc = "zk index",
  },
  -- find notes
  {
    "<leader>mm",
    "<Cmd> ZkNotes { sort = { 'modified' } } <CR>",
    desc = "telescope zk notes",
  },
  -- open notes tags
  {
    "<leader>mt",
    "<Cmd> ZkTags <CR>",
    desc = "telescope zk tags",
  },
  -- -- create a new note
  -- {
  --   "<leader>mn",
  --   "<Cmd> ZkNew { dir = vim.fn.expand('%:p:h') } <CR>",
  --   desc = "zk new cwd",
  -- },
  -- create a new note under "zettelkasten"
  {
    "<leader>ma",
    "<Cmd> ZkNew { dir = 'zettelkasten' } <CR>",
    desc = "zk new abs",
  },
  -- create a new dail note
  {
    "<leader>md",
    "<Cmd> ZkNew { dir = vim.fn.getcwd() .. '/dailynotes' } <CR>",
    desc = "zk daily notes",
  },
  -- Open notes linking to the current buffer.
  {
    "<leader>mb",
    "<Cmd> ZkBacklinks <CR>",
    desc = "zk backlinks",
    ft = "markdown",
  },
  -- Open notes linked by the current buffer.
  {
    "<leader>ml",
    "<Cmd> ZkLinks <CR>",
    desc = "zk links",
    ft = "markdown",
  },
}

return plugin
