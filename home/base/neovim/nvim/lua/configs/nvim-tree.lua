return {
  git = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
  },

  diagnostics = {
    enable = true,
    show_on_dirs = false,
    show_on_open_dirs = true,
    severity = {
      min = vim.diagnostic.severity.HINT,
      max = vim.diagnostic.severity.ERROR,
    },
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },

  actions = {
    open_file = {
      quit_on_open = true,
    },
  },

  renderer = {
    -- "none", "icon", "name", "all"
    highlight_git = "none",
    highlight_diagnostics = "name",

    icons = {
      git_placement = "after",
      diagnostics_placement = "signcolumn",
      padding = " ",
      symlink_arrow = " -> ",
      show = {
        file = true,
        folder = true,
        folder_arrow = false,
        git = true,
        modified = true,
        hidden = false,
        diagnostics = true,
        bookmarks = true,
      },

      glyphs = {
        default = "󰈚",
        symlink = "",
        bookmark = "󰆤",
        modified = "●",
        hidden = "󰜌",
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          arrow_closed = "",
          arrow_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          -- unstaged = "!",
          -- staged = "+",
          -- unmerged = "=",
          -- renamed = "r",
          -- untracked = "?",
          -- deleted = "-",
          -- ignored = "◌",
          unstaged = "󰜄",
          staged = "󰐖",
          unmerged = "󰰏",
          renamed = "󰬙",
          untracked = "󰰧",
          deleted = "󰍵",
          ignored = "󰰃",
        },
      },
    },
  },
}
