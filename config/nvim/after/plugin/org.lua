local function export_to_pdf(exporter)
  local current_file = vim.api.nvim_buf_get_name(0)
  local target = vim.fs.joinpath(vim.fn.expand("$HOME"), vim.fn.fnamemodify(current_file, ":t:r") .. ".pdf")

  local command = {
    "curl",
    "--fail-with-body",
    "-sS",
    "-X",
    "POST",
    "https://org-converter.fly.dev/convert",
    "-F",
    "file=@" .. current_file,
    "-o",
    target,
  }
  local on_success = function(output)
    if #output > 0 then
      vim.api.nvim_echo({ { table.concat(output, "\n") } }, true, {})
    end
    vim.api.nvim_echo({ { "Success, saved: " .. target } }, true, {})
  end

  local on_error = function(err)
    print("Error!")
    vim.api.nvim_echo({ { table.concat(err, "\n"), "ErrorMsg" } }, true, {})
  end
  return exporter(command, target, on_success, on_error)
end

require("orgmode").setup({
  org_agenda_files = "~/webdav/**/*",
  org_default_notes_file = "~/webdav/refile.org",
  org_adapt_indentation = false,
  org_capture_templates = {},
  org_custom_exports = {
    f = {
      label = "Export to PDF via org-converter",
      action = export_to_pdf,
    },
  },
})
