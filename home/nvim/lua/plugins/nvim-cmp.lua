local plugin = {}

-- Load luasnips + cmp related in insert mode only.
plugin = {
  enabled = false, -- disable this plugin, use blink.cmp instead
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      opts = { history = true, updateevents = "TextChanged,TextChangedI" },
      config = function(_, opts)
        require("luasnip").config.set_config(opts)
        require "configs.snip"
        require("luasnip.loaders.from_vscode").load {
          paths = { "./snippets" },
        }
        vim.keymap.set({ "i", "s" }, "<C-l>", function()
          require("luasnip").jump(1)
        end, { silent = true })
      end,
    },
    -- "cmp" sources plugins.
    {
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
  },
}

plugin.opts = function()
  -- Originates from:
  -- https://github.com/NvChad/NvChad/blob/6f25b2739684389ca69ea8229386c098c566c408/lua/nvchad/configs/cmp.lua

  dofile(vim.g.base46_cache .. "cmp")
  local cmp = require "cmp"

  local options = {
    completion = { completeopt = "menu,menuone" },

    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },

    mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      ["<Tab>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
    },

    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "nvim_lua" },
      { name = "path" },
    },
  }

  return vim.tbl_deep_extend("force", options, require "nvchad.cmp")
end

return plugin
