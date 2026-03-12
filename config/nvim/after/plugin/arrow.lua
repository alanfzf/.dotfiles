require("arrow").setup({
  show_icons = true,
  leader_key = ";",
  separate_save_and_remove = true,
  buffer_leader_key = "m",
  custom_actions = {
    open = function(target_file_name)
      vim.cmd("tabnew " .. target_file_name)
    end,
  },
})
