-- MeanderingProgrammer/render-markdown.nvim
require("render-markdown").setup {
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
    enabled = false,
  },

  -- Checkboxes are a special instance of a 'list_item' that start with a 'shortcut_link'
  -- There are two special states for unchecked & checked defined in the markdown grammar
  checkbox = {
    -- Turn on / off checkbox state rendering
    enabled = false,
  },

  quote = {
    -- Replaces '>' of 'block_quote'
    icon = "▎", -- ▏▎▍▌▋
  },

  pipe_table = {
    -- Determines how the table as a whole is rendered:
    --  none:   disables all rendering
    --  normal: applies the 'cell' style rendering to each row of the table
    --  full:   normal + a top & bottom line that fill out the table when lengths match
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
