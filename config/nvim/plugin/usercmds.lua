vim.api.nvim_create_user_command("PackUpdate", function()
  local inactive = {}

  for _, plugin in ipairs(vim.pack.get()) do
    if not plugin.active then
      table.insert(inactive, plugin.spec.name)
    end
  end
  vim.pack.del(inactive)
  vim.pack.update()
end, { nargs = 0 })

-- remove annoying windows line endings
vim.api.nvim_create_user_command("FixM", function()
  vim.cmd([[
  w
  e ++ff=dos
  set ff=unix
  ]])
end, { nargs = 0 })
