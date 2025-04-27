local M = {}

M = {
  lsp = {
    progress = { enabled = true },
    hover = { enabled = false },
    signature = { enabled = false },
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },

  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = false, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popup menu together
    long_message_to_split = true, -- long messages will be sent to a split
  },

  views = {
    popup = { border = { style = "single" } },
    confirm = { border = { style = "single" } },
    cmdline_input = { border = { style = "single" } },
    cmdline_popupmenu = { border = { style = "single" } },
    cmdline_popup = {
      border = { style = "single" },
    },
  },

  messages = { enabled = false },
}

M.cmdline = {
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
    imap = { conceal = false, pattern = "^:%s*imap%s+", icon = "󰥻" },
    input = { view = "cmdline_input", icon = "" }, -- Used by input()
    -- lua = false, -- to disable a format, set to `false`
  },
}

M.routes = {
  -- neovim native man.lua
  { filter = { find = "man.lua: no manual entry for" }, opts = { skip = true } },
  -- trouble.nvim --
  { filter = { find = "No information available" }, opts = { skip = true } },
  -- vim.lsp.buf.code_action --
  { filter = { find = "No code actions available" }, opts = { skip = true } },
  -- telescope.nvim --
  { filter = { find = "Nothing currently selected" }, opts = { skip = true } },
  { filter = { find = "No diagnostics found" }, opts = { skip = true } },
  { filter = { find = "No changes found" }, opts = { skip = true } },
  -- lspsaga
  {
    filter = { find = "response of request method textDocument/definition is empty" },
    opts = { skip = true },
  },
  -- nvim-tree.lua --
  { filter = { find = "added to clipboard" }, view = "mini" },
  { filter = { find = "removed from clipboard" }, view = "mini" },
  { filter = { find = "to system clipboard" }, view = "mini" },
  { filter = { find = "was properly created" }, view = "mini" },
  { filter = { find = "was properly removed" }, view = "mini" },
  { filter = { find = "%->" }, view = "mini" },
  -- nvim-treesitter
  { filter = { find = "All parsers are up-to-date!" }, opts = { skip = true } },
  -- zk-nvim --
  {
    filter = {
      find = "{%s*addedCount = %d+,%s*duration = %d+,%s*modifiedCount = %d+,%s*removedCount = %d+,%s*sourceCount = %d+%s*}",
    },
    opts = { skip = true },
  },
}

return M
