require("kulala").setup({
  show_icons = "above_request",
  default_view = "headers_body",
  additional_curl_options = { "-L" },
  environment_scope = "g",
  kulala_keymaps = false,
})

require("nvim-highlight-colors").setup({
  render = "background",
  virtual_symbol = "■",
  enable_named_colors = false,
  enable_tailwind = false,
})

-- ARROW setup
require("arrow").setup({
  show_icons = true,
  leader_key = ";",
  buffer_leader_key = "m",
  custom_actions = {
    open = function(target_file_name)
      vim.cmd("tabnew " .. target_file_name)
    end,
  },
})

require("orgmode").setup({})

-- vimtex
vim.g.maplocalleader = " "
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.vimtex_quickfix_mode = 0
