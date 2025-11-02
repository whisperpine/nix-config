local plugin = {}

plugin = { "kristijanhusak/vim-dadbod-ui" }

plugin.dependencies = {
  {
    "tpope/vim-dadbod",
    ft = { "sql", "mysql", "plsql" },
  },
  {
    "kristijanhusak/vim-dadbod-completion",
    ft = { "sql", "mysql", "plsql" },
    lazy = true,
    init = function()
      -- -- setup auto-completion for nvim-cmp
      -- vim.api.nvim_create_autocmd("FileType", {
      --   pattern = { "sql", "mysql", "plsql" },
      --   callback = function()
      --     require("cmp").setup.buffer {
      --       sources = {
      --         { name = "vim-dadbod-completion" },
      --       },
      --     }
      --   end,
      -- })

      local wk = require "which-key"
      wk.add {
        { "<leader>db", icon = { icon = "󰆼 ", color = "yellow" } },
      }
    end,
    keys = {
      {
        "<leader>db",
        "<cmd> DBCompletionClearCache <cr>",
        desc = "refresh db auto completion",
      },
    },
  },
}

plugin.cmd = {
  "DBUI",
  "DBUIToggle",
  "DBUIAddConnection",
  "DBUIFindBuffer",
}

plugin.init = function()
  vim.g.db_ui_use_nerd_fonts = 1
  vim.g.db_ui_winwidth = 30
  vim.g.db_ui_icons = {
    expanded = " ",
    collapsed = "+",
    connection_ok = "ok",
    connection_error = "err",
  }
  -- set shiftwidth of the buffer whose name ends with "dbui".
  vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
      local bufname = vim.api.nvim_buf_get_name(0)
      if bufname:match "dbui$" then
        vim.bo.shiftwidth = 2
      end
    end,
  })
end

return plugin
