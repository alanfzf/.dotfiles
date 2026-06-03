local ok, trackdown = pcall(require, "trackdown")

if not ok then
  return
end

trackdown.setup({
  notes_folder = "~/dropbox/notes/",
  default_notes_file = "~/dropbox/notes/refile.md",
})
