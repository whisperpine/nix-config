local M = {}

M = {
  "yetone/avante.nvim",
  build = "make", -- gnumake should be installed in your OS
  cmd = "AvanteAsk",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional.
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "folke/which-key.nvim", -- for which-key icon customization
  },
  keys = {
    { "<leader>aa", "<cmd>AvanteAsk<cr>", desc = "avante: ask" },
  },
}

M.init = function()
  if vim.fn.filereadable(vim.g.base46_cache .. "avante") == 1 then
    dofile(vim.g.base46_cache .. "avante")
  end
  local wk = require "which-key"
  wk.add {
    { "<leader>aa", icon = { icon = "󰍦 ", color = "azure" } },
  }
end

M.opts = {
  ---@alias Provider "claude" | "openai" | "gemini" | "copilot" | string
  ---@type Provider
  provider = "deepseek",

  -- "agentic" uses tools to automatically generate code.
  -- "legacy" uses the old planning method to generate code.
  ---@type "agentic" | "legacy"
  mode = "legacy",

  -- https://github.com/yetone/avante.nvim#web-search-engines
  web_search_engine = {
    ---@type "tavily" | "serpapi" | "google" | "kagi" | "brave" | "searxng"
    provider = "tavily", -- "tavily" requires TAVILY_API_KEY
  },

  selection = {
    enabled = true,
    ---@type "delayed" | "immediate" | "none"
    hint_display = "none",
  },

  windows = {
    width = 50, -- default % based on available width
    sidebar_header = {
      align = "left", -- left, center, right for title
      rounded = false,
    },
    input = {
      prefix = "",
      height = 8, -- height of the input window in vertical layout
    },
    edit = {
      border = "single",
    },
  },

  mappings = {
    sidebar = {
      close_from_input = { normal = "<Esc>", insert = "<C-c>" },
    },
  },

  behaviour = {
    enable_token_counting = false,
  },
}

M.opts.providers = {
  openai = {
    endpoint = "https://api.openai.com/v1",
    model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
    timeout = 30000, -- timeout in milliseconds, increase this for reasoning models
    extra_request_body = {
      temperature = 0,
      max_tokens = 16384,
    },
  },
  deepseek = {
    __inherited_from = "openai",
    api_key_name = "AVANTE_DEEPSEEK_API_KEY",
    endpoint = "https://api.deepseek.com",
    ---@type "deepseek-v4-flash" | "deepseek-v4-pro"
    model = "deepseek-v4-flash",
    extra_request_body = {
      max_tokens = 16384,
      -- https://api-docs.deepseek.com/guides/thinking_mode
      thinking = {
        ---@type "enabled" | "disabled"
        type = "disabled",
      },
    },
  },
}

return M
