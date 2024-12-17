return {
  lsp = {
    progress = {
      enabled = true,
    },
    hover = {
      enabled = false,
    },
    signature = {
      enabled = false,
    },
  },

  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = false, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popup menu together
    long_message_to_split = true, -- long messages will be sent to a split
  },

  messages = {
    -- NOTE: If you enable messages, then the cmdline is enabled automatically.
    -- This is a current Neovim limitation.
    enabled = false, -- enables the Noice messages UI
    view = "notify", -- default view for messages
    view_error = "notify", -- view for errors
    view_warn = "notify", -- view for warnings
    view_history = "messages", -- view for :messages
    view_search = false, -- view for search count messages. Set to `false` to disable
  },

  cmdline = {
    enabled = true, -- enables the Noice cmdline UI
    view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
    opts = {}, -- global options for the cmdline. See section on views
    format = {
      -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
      -- view: (default is cmdline view)
      -- opts: any options passed to the view
      -- icon_hl_group: optional hl_group for the icon
      -- title: set to anything or empty string to hide
      cmdline = { pattern = "^:", icon = ":", lang = "vim" },
      search_down = { kind = "search", pattern = "^/", icon = "/", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = "?", lang = "regex" },
      filter = { conceal = false, pattern = "^:%s*!", icon = "$", lang = "bash" },
      lua = {
        conceal = false,
        pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" },
        icon = "",
        lang = "lua",
      },
      help = { conceal = false, pattern = "^:%s*he?l?p?%s+", icon = "󰈙" },
      map = { conceal = false, pattern = "^:%s*map%s+", icon = "󰥻" },
      input = { view = "cmdline_input", icon = "" }, -- Used by input()
      -- lua = false, -- to disable a format, set to `false`
    },
  },

  routes = {
    {
      filter = {
        event = "notify",
        find = "No information available",
      },
      opts = {
        skip = true,
      },
    },
  },
}
