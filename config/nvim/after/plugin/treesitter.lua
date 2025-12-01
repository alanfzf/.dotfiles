vim.api.nvim_create_autocmd("FileType", {
  pattern = { "*" },
  callback = function(args)
    local ft = vim.bo[args.buf].filetype
    local lang = vim.treesitter.language.get_lang(ft) or ft

    if vim.treesitter.language.add(lang) then
      vim.treesitter.start(args.buf, lang)
      vim.wo.foldmethod = "expr"
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      vim.wo.foldlevel = 99
    end
  end,
})

-- autotag
require("nvim-ts-autotag").setup({})

-- ts context comment string
require("ts-comments").setup({})
