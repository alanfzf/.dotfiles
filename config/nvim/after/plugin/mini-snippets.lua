local ok, mini_snippets = pcall(require, "mini.snippets")

if not ok then
  return
end

local gen_loader = mini_snippets.gen_loader

mini_snippets.setup({
  snippets = {
    -- `snippets/` subdirectories from 'runtimepath' directories.
    gen_loader.from_lang(),
  },
})

-- so default auto complete catches it
mini_snippets.start_lsp_server()
