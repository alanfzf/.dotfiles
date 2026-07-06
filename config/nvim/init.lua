vim.loader.enable()
vim.pack.add({
  -- misc/dependencies
  "https://github.com/NotAShelf/direnv.nvim",
  "https://github.com/brenoprata10/nvim-highlight-colors",
  "https://github.com/nvim-orgmode/orgmode",
  "https://github.com/nvim-tree/nvim-web-devicons",
  -- git
  "https://github.com/lewis6991/gitsigns.nvim",
  -- treesitter
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  "https://github.com/folke/ts-comments.nvim",
  "https://github.com/windwp/nvim-ts-autotag",
  "https://github.com/windwp/nvim-autopairs",
  -- snippets
  "https://github.com/nvim-mini/mini.snippets",
  "https://github.com/rafamadriz/friendly-snippets",
  -- code formatting
  "https://github.com/stevearc/conform.nvim",
  -- debug
  "https://github.com/mfussenegger/nvim-dap",
  -- file navigation
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/ibhagwan/fzf-lua",
  -- colorscheme
  "https://github.com/ellisonleao/gruvbox.nvim",
}, { confirm = false })
