-- useful features
vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_auto_execute_table_helpers = 1
vim.g.db_ui_force_echo_notifications = 1
-- disable mappings
vim.g.db_ui_disable_mappings_dbui = 0
vim.g.db_ui_disable_mappings_dbout = 1
vim.g.db_ui_disable_mappings_sql = 1
vim.g.db_ui_disable_mappings_javascript = 1

vim.api.nvim_create_autocmd("FileType", {
  pattern = "dbout",
  callback = function()
    vim.opt_local.foldenable = false
  end,
})
