local group = vim.api.nvim_create_augroup("treesitter-conf", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "*" },
  callback = function(args)
    local ft = args.match
    local bufnr = args.buf
    if not vim.api.nvim_buf_is_valid(bufnr) then
      return
    end

    local lang = vim.treesitter.language.get_lang(ft)
    if not lang then
      return
    end

    local ok, _ = vim.treesitter.language.add(lang)
    if not ok then
      return
    end

    if vim.treesitter.query.get(lang, "highlights") then
      vim.treesitter.start(args.buf, lang)
    end

    if vim.treesitter.query.get(lang, "indents") then
      vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end

    if vim.treesitter.query.get(lang, "folds") then
      local win = vim.wo[vim.api.nvim_get_current_win()][0]
      win.foldmethod = "expr"
      win.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      win.foldtext = "v:lua.vim.treesitter.foldtext()"
      vim.wo.foldlevel = 99
    end
  end,
})

-- autotag
require("nvim-ts-autotag").setup({})

-- ts context comment string
require("ts-comments").setup({})
