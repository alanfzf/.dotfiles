require("direnv").setup({
  autoload_direnv = true,
  keybindings = {
    allow = "<Leader>dva",
    deny = "<Leader>dvd",
    reload = "<Leader>dvr",
    edit = "<Leader>dve",
  },
})
