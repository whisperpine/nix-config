local plugins = {}

plugins = {
  "saghen/blink.cmp",
  event = { "InsertEnter", "CmdLineEnter" },
  -- use a release tag to download pre-built binaries
  version = "1.*",
}

local opts = {
  keymap = {
    ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
    ["<C-e>"] = { "hide", "fallback" },
    ["<C-y>"] = { "select_and_accept", "fallback" },
    ["<cr>"] = { "select_and_accept", "fallback" },
    ["<Tab>"] = { "select_and_accept", "fallback" },

    ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
    ["<C-n>"] = { "select_next", "fallback_to_mappings" },

    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },
  },

  appearance = {
    nerd_font_variant = "normal", -- "mono" or "normal"
  },

  completion = {
    ghost_text = {
      enabled = true,
      show_with_menu = false,
    },
    list = {
      selection = {
        preselect = true,
        auto_insert = false,
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 0,
      window = { border = "single" },
    },
    -- from nvchad/ui plugin:
    -- https://github.com/NvChad/ui/blob/v3.0/lua/nvchad/blink/init.lua
    menu = require("nvchad.blink").menu,
  },

  -- default list of enabled providers defined so that you can extend it
  -- elsewhere in your config, without redefining it, due to `opts_extend`
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
    per_filetype = {
      sql = { "lsp", "dadbod", "path", "snippets", "buffer" },
    },
    providers = {
      snippets = { opts = { friendly_snippets = false } },
      dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
    },
  },

  -- rust fuzzy matcher for typo resistance and significantly better performance
  fuzzy = { implementation = "prefer_rust_with_warning" },
}

plugins.opts = function()
  dofile(vim.g.base46_cache .. "blink")
  return opts
end

return plugins
