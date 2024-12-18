return {
  {
    "zk-org/zk-nvim",
    main = "zk",
    opts = {
      -- can be "telescope", "fzf", "fzf_lua", "minipick", or "select" (`vim.ui.select`)
      -- it's recommended to use "telescope", "fzf", "fzf_lua", or "minipick"
      picker = "telescope",
      lsp = {
        auto_attach = { enabled = false },
      },
    },
    -- other keymaps are defined in nvim/ftplugin/markdown.lua
    keys = {
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
      -- create a new note
      {
        "<leader>mn",
        "<Cmd> ZkNew { dir = vim.fn.expand('%:p:h') } <CR>",
        desc = "zk new",
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
    },
  },
}
