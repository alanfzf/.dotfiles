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

-- kulala
require("kulala").setup({
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
})
