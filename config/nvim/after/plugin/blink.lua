local blink = require("blink-cmp")

-- handle blink setup
blink.setup({
  snippets = {
    preset = "mini_snippets",
  },
  -- fuzzy
  fuzzy = {
    implementation = "prefer_rust",
    frecency = {
      enabled = true,
    },
    use_proximity = true,
    sorts = { "exact", "score", "sort_text" },
  },

  -- ** start sources **
  cmdline = {
    enabled = false,
  },
  sources = {
    providers = {
      lsp = {
        name = "LSP",
        module = "blink.cmp.sources.lsp",
        enabled = true,
        min_keyword_length = 2,
        fallbacks = {},
      },
      path = {
        name = "Path",
        module = "blink.cmp.sources.path",
        score_offset = 3,
      },
      buffer = {
        name = "Buffer",
        module = "blink.cmp.sources.buffer",
        score_offset = -5,
      },
    },
  },
  completion = {
    documentation = {
      auto_show = true,
    },
    list = {
      max_items = 10,
      selection = {
        preselect = false,
        auto_insert = false,
      },
    },
    accept = {
      auto_brackets = {
        enabled = true,
      },
    },
  },
})
