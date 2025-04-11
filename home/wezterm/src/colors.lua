-- This is the module table that we will export.
local module = {
	-- The default text color.
	foreground = "#bdbdbd",
	-- The default background color.
	background = "#202020",

	-- Overrides the cell background color when the current cell is occupied by the
	-- cursor and the cursor style is set to Block.
	cursor_bg = "#bdbdbd",
	-- Overrides the text color when the current cell is occupied by the cursor.
	cursor_fg = "#202020",
	-- Specifies the border color of the cursor when the cursor style is set to Block,
	-- or the color of the vertical or horizontal bar when the cursor style is set to
	-- Bar or Underline.
	cursor_border = "#bdbdbd",

	-- The foreground color of selected text.
	selection_fg = "#c8c8c8",
	-- The background color of selected text.
	selection_bg = "#363636",

	-- The color of the scrollbar "thumb".
	-- The portion that represents the current viewport.
	scrollbar_thumb = "#222222",

	-- The color of the split lines between panes
	split = "#121212",

	ansi = {
		"#161616", -- black -- yazi shortcut background
		"#cc6666", -- red
		"#879c54", -- green
		"#e6be6f", -- yellow
		"#6c95b8", -- blue
		"#b18fbb", -- purple
		"#79af98", -- cyan
		"#bdbdbd", -- white
	},
	brights = {
		"#777777", -- black -- nushell command suggestion
		"#cc6666", -- red
		"#879c54", -- green
		"#e6be6f", -- yellow
		"#6c95b8", -- blue
		"#b18fbb", -- purple
		"#79af98", -- cyan
		"#bdbdbd", -- white
	},
}

return module
