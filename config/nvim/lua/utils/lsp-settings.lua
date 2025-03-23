local M = {}

-- most common language servers: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

local function ts_org_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = "",
  }
  vim.lsp.buf.execute_command(params)
end

-- lsp servers
local lsp_servers = {
  omnisharp = {
    cmd = { "OmniSharp" },
  },
  -- PHP
  intelephense = {
    init_options = {
      globalStoragePath = vim.fn.expand("$HOME/.intelephense"),
      licenceKey = vim.fn.expand("$HOME/.intelephense/licence.txt"),
    },
  },
  -- MARKDOWN
  marksman = {},
  -- LUA
  lua_ls = {
    single_file_support = false,
    settings = {
      Lua = {
        runtime = { version = "LuaJIT" },
        diagnostics = {
          globals = { "vim" },
          disable = {
            "missing-fields",
            "incomplete-signature-doc",
          },
          unusedLocalExclude = { "_*" },
        },
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME,
          },
        },
        telemetry = { enable = false },
      },
    },
  },
  -- TS & JS
  ts_ls = {
    single_file_support = false,
    commands = {
      OrganizeImports = {
        ts_org_imports,
        description = "Organize Imports",
      },
    },
  },
  -- PYTHON
  pyright = {
    single_file_support = false,
    settings = {
      python = {
        analysis = {},
      },
    },
  },
}

M.lsp_configs = lsp_servers

return M
