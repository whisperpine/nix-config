return {
  "sphamba/smear-cursor.nvim",
  cmd = { "SmearCursorToggle" },
  opts = {
    -- Draw the smear in buffer space instead of screen space when scrolling
    scroll_buffer_space = true,
    -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
    -- Smears will blend better on all backgrounds.
    legacy_computing_symbols_support = true,
  },
  keys = {
    {
      "<leader>rm",
      "<cmd> SmearCursorToggle <cr>",
      desc = "toggle smear cursor",
    },
  },
}
