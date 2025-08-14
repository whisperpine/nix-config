local plugin = {}

plugin = {
  "folke/which-key.nvim",
  lazy = false,
  cmd = "WhichKey",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = { delay = 0 },
  keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
}

plugin.init = function()
  if vim.fn.filereadable(vim.g.base46_cache .. "whichkey") == 1 then
    dofile(vim.g.base46_cache .. "whichkey")
  end
  local wk = require "which-key"
  wk.add {
    {
      "<leader>cp",
      function()
        print(vim.fn.expand "%")
      end,
      desc = "print relative path",
      icon = { icon = "", color = "white" },
    },
    {
      "<leader>cP",
      function()
        print(vim.fn.expand "%:p")
      end,
      desc = "print absolute path",
      icon = { icon = "", color = "white" },
    },
  }
end

return plugin
