local plugin = {}

plugin = {
  "luckasRanarison/tailwind-tools.nvim",
  build = ":UpdateRemotePlugins",
}

plugin.ft = {
  "css",
  "html",
  "javascript",
  "typescript",
  "javascriptreact",
  "typescriptreact",
  "svelte",
  "vue",
  "mdx",
}

plugin.dependencies = {
  "nvim-treesitter/nvim-treesitter",
  "nvim-telescope/telescope.nvim", -- optional
  "neovim/nvim-lspconfig", -- optional
  "folke/which-key.nvim", -- optional
}

plugin.opts = {
  document_color = { enabled = false },
  conceal = {
    symbol = ".", -- 󱏿 only a single character is allowed
    highlight = { -- extmark highlight options, see :h 'highlight'
      fg = "#8abeb7",
    },
  },
}

plugin.init = function()
  local wk = require "which-key"
  wk.add {
    { "<leader>rt", icon = { icon = "󱏿 ", color = "azure" } },
  }
end

plugin.keys = {
  {
    "<leader>ft",
    "<cmd> Telescope tailwind classes <cr>",
    desc = "telescope tailwind classes",
  },
  {
    "<leader>rt",
    "<cmd> TailwindConcealToggle <cr>",
    desc = "tailwind conceal toggle",
  },
}

return plugin
