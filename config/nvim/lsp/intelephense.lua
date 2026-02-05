return {
  cmd = { "intelephense", "--stdio" },
  filetypes = { "php" },
  root_markers = { "composer.json" },
  init_options = {
    globalStoragePath = vim.fn.expand("$HOME/.intelephense"),
    licenceKey = vim.fn.expand("$HOME/.intelephense/licence.txt"),
  },
  settings = {
    intelephense = {
      files = {
        maxSize = 1000000,
        exclude = { "**/.direnv/**", "**/node_modules/**" },
      },
    },
  },
}
