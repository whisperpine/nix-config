dofile(vim.g.base46_cache .. "nvimtree")

local M = {}

M = {
  disable_netrw = true,
  hijack_cursor = true,
  sync_root_with_cwd = true,

  update_focused_file = {
    enable = true,
    update_root = false,
  },

  view = {
    width = 30,
    preserve_window_proportions = true,
  },

  filters = {
    custom = { "^\\.git$", "^\\.direnv$" },
    git_ignored = false,
  },

  git = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = true,
  },

  actions = {
    open_file = { quit_on_open = true },
  },
}

M.diagnostics = {
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
}

M.renderer = {
  root_folder_label = false,
  indent_markers = { enable = true },
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
        --     
        default = "",
        open = "",
        empty = "",
        empty_open = "",
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
        -- ignored = "i",
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
}

M.on_attach = function(bufnr)
  local api = require "nvim-tree.api"

  ---@param desc string
  ---@return table
  local function opts(desc)
    return {
      desc = "nvim-tree: " .. desc,
      buffer = bufnr,
      noremap = true,
      silent = true,
      nowait = true,
    }
  end

  -- see ":h nvim-tree-mappings-default"
  vim.keymap.set("n", "l", api.node.open.edit, opts "Open")
  vim.keymap.set("n", "h", api.node.navigate.parent_close, opts "Close Directory")

  -- BEGIN_DEFAULT_ON_ATTACH
  vim.keymap.set("n", "<C-r>", api.fs.rename_sub, opts "Rename: Omit Filename")
  vim.keymap.set("n", "<C-t>", api.node.open.tab, opts "Open: New Tab")
  vim.keymap.set("n", "<C-v>", api.node.open.vertical, opts "Open: Vertical Split")
  vim.keymap.set("n", "<C-x>", api.node.open.horizontal, opts "Open: Horizontal Split")
  vim.keymap.set("n", "<CR>", api.node.open.edit, opts "Open")
  vim.keymap.set("n", ">", api.node.navigate.sibling.next, opts "Next Sibling")
  vim.keymap.set("n", "<", api.node.navigate.sibling.prev, opts "Previous Sibling")
  vim.keymap.set("n", ".", api.node.run.cmd, opts "Run Command")
  vim.keymap.set("n", "a", api.fs.create, opts "Create File Or Directory")
  vim.keymap.set(
    "n",
    "B",
    api.tree.toggle_no_buffer_filter,
    opts "Toggle Filter: No Buffer"
  )
  vim.keymap.set("n", "c", api.fs.copy.node, opts "Copy")
  vim.keymap.set(
    "n",
    "C",
    api.tree.toggle_git_clean_filter,
    opts "Toggle Filter: Git Clean"
  )
  vim.keymap.set("n", "d", api.fs.remove, opts "Delete")
  vim.keymap.set("n", "E", api.tree.expand_all, opts "Expand All")
  vim.keymap.set("n", "e", api.fs.rename_basename, opts "Rename: Basename")
  vim.keymap.set("n", "F", api.live_filter.clear, opts "Live Filter: Clear")
  vim.keymap.set("n", "f", api.live_filter.start, opts "Live Filter: Start")
  vim.keymap.set("n", "g?", api.tree.toggle_help, opts "Help")
  vim.keymap.set("n", "ge", api.fs.copy.basename, opts "Copy Basename")
  vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts "Toggle Filter: Dotfiles")
  vim.keymap.set(
    "n",
    "I",
    api.tree.toggle_gitignore_filter,
    opts "Toggle Filter: Git Ignore"
  )
  vim.keymap.set("n", "J", api.node.navigate.sibling.last, opts "Last Sibling")
  vim.keymap.set("n", "K", api.node.navigate.sibling.first, opts "First Sibling")
  vim.keymap.set("n", "o", api.node.open.edit, opts "Open")
  vim.keymap.set("n", "p", api.fs.paste, opts "Paste")
  vim.keymap.set("n", "q", api.tree.close, opts "Close")
  vim.keymap.set("n", "r", api.fs.rename, opts "Rename")
  vim.keymap.set("n", "R", api.tree.reload, opts "Refresh")
  vim.keymap.set("n", "U", api.tree.toggle_custom_filter, opts "Toggle Filter: Hidden")
  vim.keymap.set("n", "W", api.tree.collapse_all, opts "Collapse")
  vim.keymap.set("n", "x", api.fs.cut, opts "Cut")
  vim.keymap.set("n", "y", api.fs.copy.filename, opts "Copy Name")
  -- END_DEFAULT_ON_ATTACH
end

return M
