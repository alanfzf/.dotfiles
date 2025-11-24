local function buf_build(client, bufnr)
  local win = vim.api.nvim_get_current_win()
  local params = vim.lsp.util.make_position_params(win, client.offset_encoding)
  client:request("textDocument/build", params, function(err, result)
    if err then
      error(tostring(err))
    end
    local texlab_build_status = {
      [0] = "Success",
      [1] = "Error",
      [2] = "Failure",
      [3] = "Cancelled",
    }
    vim.notify("Build " .. texlab_build_status[result.status], vim.log.levels.INFO)
  end, bufnr)
end

local function buf_search(client, bufnr)
  local win = vim.api.nvim_get_current_win()
  local params = vim.lsp.util.make_position_params(win, client.offset_encoding)
  client:request("textDocument/forwardSearch", params, function(err, result)
    if err then
      error(tostring(err))
    end
    local texlab_forward_status = {
      [0] = "Success",
      [1] = "Error",
      [2] = "Failure",
      [3] = "Unconfigured",
    }
    vim.notify("Search " .. texlab_forward_status[result.status], vim.log.levels.INFO)
  end, bufnr)
end

local function buf_cancel_build(client, bufnr)
  return client:exec_cmd({
    title = "cancel",
    command = "texlab.cancelBuild",
  }, { bufnr = bufnr })
end

local function command_factory(cmd)
  local cmd_tbl = {
    Auxiliary = "texlab.cleanAuxiliary",
    Artifacts = "texlab.cleanArtifacts",
  }
  return function(client, bufnr)
    return client:exec_cmd({
      title = ("clean_%s"):format(cmd),
      command = cmd_tbl[cmd],
      arguments = { { uri = vim.uri_from_bufnr(bufnr) } },
    }, { bufnr = bufnr }, function(err, _)
      if err then
        vim.notify(("Failed to clean %s files: %s"):format(cmd, err.message), vim.log.levels.ERROR)
      else
        vim.notify(("Command %s executed successfully"):format(cmd), vim.log.levels.INFO)
      end
    end)
  end
end

local function buf_clean_build(client, bufnr)
  local clean_aux = command_factory("Auxiliary")
  local clean_art = command_factory("Artifacts")

  -- run auxiliary first, then artifacts
  clean_aux(client, bufnr)
  clean_art(client, bufnr)
end

---@type vim.lsp.Config
return {
  cmd = { "texlab" },
  filetypes = { "tex", "plaintex", "bib" },
  root_markers = { ".git", ".latexmkrc", "latexmkrc", ".texlabroot", "texlabroot", "Tectonic.toml" },
  settings = {
    texlab = {
      rootDirectory = nil,
      auxDirectory = "build",
      build = {
        forwardSearchAfter = false,
        onSave = true,
      },
      forwardSearch = {
        executable = "zathura",
        args = { "--synctex-forward", "%l:1:%f", "%p" },
        onSave = true,
      },
      diagnosticsDelay = 300,
    },
  },
  on_attach = function(client, bufnr)
    for _, cmd in ipairs({
      { name = "TexlabBuild", fn = buf_build, desc = "Build the current buffer" },
      { name = "TexlabForward", fn = buf_search, desc = "Forward search from current position" },
      { name = "TexlabCancelBuild", fn = buf_cancel_build, desc = "Cancel the current build" },
      { name = "TexlabCleanBuild", fn = buf_clean_build, desc = "Clean the artifacts" },
    }) do
      vim.api.nvim_buf_create_user_command(bufnr, "Lsp" .. cmd.name, function()
        cmd.fn(client, bufnr)
      end, { desc = cmd.desc })
    end

    vim.keymap.set("n", "<leader>lb", "<CMD>LspTexlabBuild<CR>", { buffer = bufnr, desc = "LSP: Texlab Build" })
    vim.keymap.set("n", "<leader>lf", "<CMD>LspTexlabForward<CR>", { buffer = bufnr, desc = "LSP: Texlab Forward" })
    vim.keymap.set(
      "n",
      "<leader>lc",
      "<CMD>LspTexlabCleanBuild<CR>",
      { buffer = bufnr, desc = "LSP: Texlab Cancel Build" }
    )
  end,
}
