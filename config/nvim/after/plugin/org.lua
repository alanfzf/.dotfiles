require("orgmode").setup({
  org_agenda_files = "~/dropbox/org/**/*",
  org_default_notes_file = "~/dropbox/org/refile.org",
  ui = {
    input = {
      use_vim_ui = true,
    },
  },
})
