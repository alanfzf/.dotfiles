require("sidekick").setup({
  nes = { enabled = false },
  cli = {
    picker = "fzf-lua",
    mux = {
      backend = "tmux",
      enabled = true,
    },
  },
})

vim.keymap.set("n", "<leader>st", function()
  require("sidekick.cli").toggle({ name = "copilot", focus = true })
end, { desc = "Sidekick AI" })

vim.keymap.set("n", "<leader>sf", function()
  require("sidekick.cli").send({ name = "copilot", msg = "{file}" })
end, { desc = "Sidekick send file" })

vim.keymap.set("x", "<leader>ss", function()
  require("sidekick.cli").send({ name = "copilot", msg = "{selection}" })
end, { desc = "Sidekick send selection" })
