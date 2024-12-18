local function is_plugin_installed(plugin_name)
  local plugin_path = vim.fn.stdpath "data" .. "/lazy/" .. plugin_name
  return vim.fn.isdirectory(plugin_path) == 1
end

local function map(...)
  vim.api.nvim_buf_set_keymap(0, ...)
end

-- render-markdown.nvim
if is_plugin_installed "render-markdown.nvim" then
  map("n", "<leader>mr", "<cmd> RenderMarkdown toggle <cr>", { desc = "render markdown" })
end

-- markdown-preview.nvim
if is_plugin_installed "markdown-preview.nvim" then
  map(
    "n",
    "<leader>mv",
    "<cmd> MarkdownPreviewToggle <cr>",
    { desc = "preview markdown" }
  )
end

-- zk-nvim
-- Add the key mappings only for Markdown files in a zk notebook.
if require("zk.util").notebook_root(vim.fn.expand "%:p") ~= nil then
  local opts = { noremap = true, silent = false }
  -- Create a new note after asking for its title.
  map(
    "n",
    "<leader>mn",
    "<Cmd> ZkNew { dir = vim.fn.expand('%:p:h') } <CR>",
    vim.tbl_deep_extend("force", opts, { desc = "zk new" })
  )
  -- Open notes linking to the current buffer.
  map(
    "n",
    "<leader>mb",
    "<Cmd> ZkBacklinks <CR>",
    vim.tbl_deep_extend("force", opts, { desc = "zk backlinks" })
  )
  -- Open notes linked by the current buffer.
  map(
    "n",
    "<leader>ml",
    "<Cmd> ZkLinks <CR>",
    vim.tbl_deep_extend("force", opts, { desc = "zk links" })
  )
end
