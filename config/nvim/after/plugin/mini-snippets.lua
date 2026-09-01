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
  mappings = {
    expand = "<M-j>",
    jump_next = "<M-l>",
    jump_prev = "<M-h>",
    stop = "<C-c>",
  },
})

-- so default auto complete catches it
-- mini_snippets.start_lsp_server()
