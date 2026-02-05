require("kulala").setup({
  lsp = { enable = false },
  additional_curl_options = { "-L" },
  environment_scope = "b",
  global_keymaps = true,
  global_keymaps_prefix = "<leader>h",
  kulala_keymaps_prefix = "<leader>s",
  ui = {
    default_view = "body",
    winbar = true,
    show_icons = "signcolumn",
  },
  contenttypes = {
    ["text/xml"] = {
      ft = "xml",
      formatter = vim.fn.executable("xmlstarlet") == 1 and { "xmlstarlet", "fo" },
      pathresolver = nil,
    },
    ["text/html"] = {
      ft = "html",
      formatter = vim.fn.executable("html-render") == 1 and { "html-render" },
      pathresolver = nil,
    },
  },
})
