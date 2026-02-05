vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
    prefix = "●",
    severity = vim.diagnostic.severity.ERROR,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
  underline = false,
  severity_sort = true,
})

local configs = {}

for _, v in ipairs(vim.api.nvim_get_runtime_file("lsp/*", true)) do
  local name = vim.fn.fnamemodify(v, ":t:r")
  configs[name] = true
end

vim.lsp.enable(vim.tbl_keys(configs))

vim.lsp.config("*", {
  capabilities = {
    semanticTokensProvider = false,
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    local bufnr = args.buf

    local keymap = function(map, action, description, mode)
      mode = mode or "n"
      vim.keymap.set(mode, map, action, {
        buffer = bufnr,
        desc = description,
        noremap = true,
        silent = true,
      })
    end

    -- disable lsp semantic tokens
    client.server_capabilities.semanticTokensProvider = nil

    -- references & definitions
    keymap("gD", vim.lsp.buf.declaration, "Go to declaration")
    keymap("gd", vim.lsp.buf.definition, "Go to definition")
    keymap("gI", vim.lsp.buf.implementation, "Implementation")
    keymap("gr", vim.lsp.buf.references, "References")
    -- documentation
    keymap("<S-k>", vim.lsp.buf.hover, "Hover")
    keymap("<M-k>", vim.lsp.buf.signature_help, "Signature help")
    -- actions
    keymap("<leader>rn", vim.lsp.buf.rename, "Rename definition")
    keymap("<leader>la", vim.lsp.buf.code_action, "Code action")
    -- diagnostics
    keymap("<leader>lq", vim.diagnostic.setloclist, "Loc list")
    keymap("gl", vim.diagnostic.open_float, "Diagnostics")

    -- copilot specific code handling
    if client:supports_method(vim.lsp.protocol.Methods.textDocument_inlineCompletion, bufnr) then
      vim.lsp.inline_completion.enable(true, { bufnr = bufnr })
      keymap("<A-o>", vim.lsp.inline_completion.get, "LSP: accept inline completion", "i")
      keymap("<C-G>", vim.lsp.inline_completion.select, "LSP: switch inline completion", "i")
    end

    -- "textDocument/completion"
    if client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
      vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
    end
  end,
})
