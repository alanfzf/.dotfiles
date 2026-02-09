vim.loader.enable()
vim.pack.add({
  -- misc/dependencies
  "https://github.com/NotAShelf/direnv.nvim",
  "https://github.com/brenoprata10/nvim-highlight-colors",
  "https://github.com/junegunn/vim-easy-align",
  "https://github.com/mistweaverco/kulala.nvim",
  "https://github.com/nvim-orgmode/orgmode",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/otavioschwanck/arrow.nvim",
  -- git
  "https://github.com/lewis6991/gitsigns.nvim",
  -- treesitter
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  "https://github.com/folke/ts-comments.nvim",
  "https://github.com/windwp/nvim-ts-autotag",
  "https://github.com/windwp/nvim-autopairs",
  -- snippets
  "https://github.com/konradmalik/incomplete.nvim",
  "https://github.com/rafamadriz/friendly-snippets",
  -- code formatting
  "https://github.com/stevearc/conform.nvim",
  -- debug
  "https://github.com/mfussenegger/nvim-dap",
  -- file navigation
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/ibhagwan/fzf-lua",
  -- colorscheme
  "https://github.com/2962fe22-10b3-43f8-8a33-252bd4b7435a/prasiolite",
  -- ai
  "https://github.com/folke/sidekick.nvim",
}, { confirm = false })
