local stylua = require('efmls-configs.formatters.stylua')

local languages = {
  lua = { stylua },
}

return {
  filetypes = vim.tbl_keys(languages),
init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
  },
  cmd = { "efm-langserver" },
root_markers = { ".git" },
  settings = {
    rootMarkers = { '.git/' },
    languages = languages,
  },
}
