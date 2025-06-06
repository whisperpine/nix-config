local plugin = {}

plugin = {
  "yetone/avante.nvim",
  build = "make", -- gnumake should be installed in your OS
  cmd = "AvanteAsk",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "folke/which-key.nvim", -- for which-key icon customization
  },
  keys = {
    { "<leader>aa", "<cmd>AvanteAsk<cr>", desc = "avante: ask" },
  },
}

plugin.init = function()
  dofile(vim.g.base46_cache .. "avante")
  local wk = require "which-key"
  wk.add {
    { "<leader>aa", icon = { icon = "󰍦 ", color = "azure" } },
  }
end

plugin.opts = {
  hints = { enabled = false },
  provider = "deepseek",
  windows = {
    width = 50, -- default % based on available width
    sidebar_header = {
      align = "left", -- left, center, right for title
      rounded = false,
    },
    input = {
      prefix = "",
      height = 8, -- Height of the input window in vertical layout
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

plugin.opts.providers = {
  openai = {
    endpoint = "https://api.openai.com/v1",
    model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
    timeout = 30000, -- Timeout in milliseconds, increase this for reasoning models
    extra_request_body = {
      temperature = 0,
      max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
      reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
    },
  },
  ollama = {
    endpoint = "http://127.0.0.1:11434", -- Note that there is no /v1 at the end.
    model = "qwq:32b",
  },
  deepseek = {
    __inherited_from = "openai",
    api_key_name = "DEEPSEEK_API_KEY",
    endpoint = "https://api.deepseek.com",
    model = "deepseek-chat",
  },
}

-- return { plugin }
return plugin
