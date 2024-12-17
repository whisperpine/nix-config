-- MeanderingProgrammer/render-markdown.nvim
return {
  -- Whether Markdown should be rendered by default or not
  enabled = true,

  -- Maximum file size (in MB) that this plugin will attempt to render
  -- Any file larger than this will effectively be ignored
  max_file_size = 10.0,

  -- Filetypes this plugin will run on
  file_types = { "markdown" },

  -- Vim modes that will show a rendered view of the markdown file
  -- All other modes will be unaffected by this plugin
  render_modes = { "n", "c" },

  anti_conceal = {
    -- This enables hiding any added text on the line the cursor is on
    enabled = true,
    -- Which elements to always show, ignoring anti conceal behavior. Values can either be booleans
    -- to fix the behavior or string lists representing modes where anti conceal behavior will be
    -- ignored. Possible keys are:
    --  head_icon, head_background, head_border, code_language, code_background, code_border
    --  dash, bullet, check_icon, check_scope, quote, table_border, callout, link, sign
    ignore = {
      head_icon = true,
      code_background = true,
      sign = true,
    },
    -- Number of lines above cursor to show
    above = 0,
    -- Number of lines below cursor to show
    below = 0,
  },

  on = {
    -- Called when plugin initially attaches to a buffer
    attach = function() end,
  },

  heading = {
    -- Turn on / off any sign column related rendering
    sign = true,
    -- Replaces '#+' of 'atx_h._marker'
    -- The number of '#' in the heading determines the 'level'
    -- The 'level' is used to index into the list using a cycle
    icons = { "# ", "## ", "### ", "#### ", "##### ", "###### " },
    -- The 'level' is used to index into the list using a clamp
    -- Highlight for the heading icon and extends through the entire line
    backgrounds = {
      "RenderMarkdownH1Bg",
      "RenderMarkdownH1Bg",
      "RenderMarkdownH1Bg",
      "RenderMarkdownH1Bg",
      "RenderMarkdownH1Bg",
      "RenderMarkdownH1Bg",
    },
    -- The 'level' is used to index into the list using a clamp
    -- Highlight for the heading and sign icons
    foregrounds = {
      "RenderMarkdownH1",
      "RenderMarkdownH1",
      "RenderMarkdownH1",
      "RenderMarkdownH1",
      "RenderMarkdownH1",
      "RenderMarkdownH1",
    },
  },

  bullet = {
    -- Turn on / off list bullet rendering
    enabled = true,
    -- Replaces '-'|'+'|'*' of 'list_item'
    -- How deeply nested the list is determines the 'level' which is used to index into the list using a cycle
    -- The item number in the list is used to index into the value using a clamp if the value is also a list
    -- If the item is a 'checkbox' a conceal is used to hide the bullet instead
    -- icons = { "", "", "󰨐", "󱓜" },
    icons = { "󰨐", "󱓜", "󰨐", "󱓜" },
    -- icons = { "", "", "", "" },
  },

  checkbox = {
    -- Turn on / off checkbox state rendering
    enabled = true,
    -- Determines how icons fill the available space:
    --  inline: underlying text is concealed resulting in a left aligned icon
    --  overlay: result is left padded with spaces to hide any additional text
    position = "inline",
    unchecked = {
      -- Replaces '[ ]' of 'task_list_marker_unchecked'
      icon = "󰄱",
      -- Highlight for the unchecked icon
      highlight = "RenderMarkdownUnchecked",
      -- Highlight for item associated with unchecked checkbox
      scope_highlight = nil,
    },
    checked = {
      -- Replaces '[x]' of 'task_list_marker_checked'
      -- icon = "󰄲",
      icon = "󰡖",
      -- Highlight for the checked icon
      highlight = "RenderMarkdownChecked",
      -- Highlight for item associated with checked checkbox
      scope_highlight = nil,
    },
    -- Define custom checkbox states, more involved as they are not part of the markdown grammar
    -- As a result this requires neovim >= 0.10.0 since it relies on 'inline' extmarks
    -- Can specify as many additional states as you like following the 'todo' pattern below
    --   The key in this case 'todo' is for health check and to allow users to change its values
    --   'raw': Matched against the raw text of a 'shortcut_link'
    --   'rendered': Replaces the 'raw' value when rendering
    --   'highlight': Highlight for the 'rendered' icon
    --   'scope_highlight': Highlight for item associated with custom checkbox
    custom = {
      todo = {
        raw = "[~]",
        rendered = "󱋭 ",
        highlight = "RenderMarkdownUnchecked",
        scope_highlight = nil,
      },
    },
  },

  quote = {
    -- Replaces '>' of 'block_quote'
    icon = "▎", -- ▏▎▍▌▋
  },

  pipe_table = {
    -- Determines how the table as a whole is rendered:
    --  none: disables all rendering
    --  normal: applies the 'cell' style rendering to each row of the table
    --  full: normal + a top & bottom line that fill out the table when lengths match
    style = "normal",
    -- Amount of space to put between cell contents and border
    padding = 1,
    -- Characters used to replace table border
    -- Correspond to top(3), delimiter(3), bottom(3), vertical, & horizontal
    -- stylua: ignore
    border = {
        '┌', '┬', '┐',
        '─', '─', '─',
        '└', '┴', '┘',
        ' ', '─',
    },
  },
}
