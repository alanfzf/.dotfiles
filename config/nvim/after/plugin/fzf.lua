local fzf = require("fzf-lua")
local actions = fzf.actions

fzf.setup({
  file_icon_padding = " ",
  winopts = {
    -- make fzf non floating
    split = "belowright new",
    preview = {
      default = "bat",
      title = false,
      border = "noborder",
    },
  },
  grep = {
    multiline = true,
    RIPGREP_CONFIG_PATH = vim.env.RIPGREP_CONFIG_PATH,
    rg_opts = "--column --line-number --files-with-matches",
    actions = {
      ["ctrl-r"] = {
        fn = function(_, opts)
          actions.toggle_flag(
            _,
            vim.tbl_extend("force", opts, {
              toggle_flag = "--fixed-strings",
            })
          )
        end,
        desc = "Toggle regex",
        header = "Toggle regex",
      },
    },
  },
  files = {
    cwd_header = false,
  },
  zoxide = {
    scope = "tab",
    git_root = true,
  },
  -- git start
  -- i stole this from here: https://github.com/gennaro-tedesco/dotfiles/blob/86cf4de5870a64aa8c5fad2269248db9521a1c2d/nvim/lua/plugins/fzf.lua#L45-L56
  git = {
    winopts = {
      preview = {
        hidden = "nohidden",
      },
    },
    bcommits = {
      cmd = "git log --color --pretty=format:'%C(yellow)%h%Creset %Cgreen%><(12)%cr%><|(12)%Creset %s' <file>",
      preview = "git show --stat --color --format='%C(cyan)%an%C(reset)%C(bold yellow)%d%C(reset): %s' {1} -- <file>",
      actions = {
        ["ctrl-d"] = function(...)
          fzf.actions.git_buf_vsplit(...)
          vim.cmd("windo diffthis")
          local switch = vim.api.nvim_replace_termcodes("<C-w>h", true, false, true)
          vim.api.nvim_feedkeys(switch, "t", false)
        end,
      },
    },
  },
  -- git end
  keymap = {
    fzf = {
      -- fzf '--bind=' options
      ["ctrl-j"] = "ignore",
      ["ctrl-k"] = "kill-line",

      ["ctrl-d"] = "preview-page-down",
      ["ctrl-u"] = "preview-page-up",

      ["alt-a"] = "toggle-all",
      ["ctrl-x"] = "select-all+accept",
    },
  },

  fzf_colors = {
    true,
    ["bg"] = "-1",
  },
  fzf_opts = {
    ["--border"] = "none",
    ["--cycle"] = true,
    ["--info"] = "hidden",
    ["--no-info"] = "",
    ["--header"] = " ",
  },
})

fzf.register_ui_select()
