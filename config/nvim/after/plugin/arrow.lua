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
