local keymap = vim.keymap.set
local opts = { silent = true }

vim.g.mapleader = vim.keycode("<space>")
vim.g.maplocalleader = vim.keycode("<space>")

--[[ * ALL MODES * ]]
keymap("", "<S-h>", "^", { remap = true })
keymap("", "<S-l>", "$", { remap = true })

--[[ * COMMAND MODE *  ]]
keymap("c", "<C-a>", "<Home>", { noremap = true })
keymap("c", "<C-b>", "<Left>", { noremap = true })
keymap("c", "<C-d>", "<Del>", { noremap = true })
keymap("c", "<C-e>", "<End>", { noremap = true })
keymap("c", "<C-f>", "<Right>", { noremap = true })
keymap("c", "<C-n>", "<Down>", { noremap = true })
keymap("c", "<C-p>", "<Up>", { noremap = true })
keymap("c", "<M-b>", "<S-Left>", { noremap = true })
keymap("c", "<M-f>", "<S-Right>", { noremap = true })
keymap("c", "<C-k>", [[<C-\>estrpart(getcmdline(), 0, getcmdpos()-1)<CR>]], { noremap = true })

--[[ * NORMAL MODE *  ]]
-- fix j,k on virtual lines
keymap("n", "j", "gj")
keymap("n", "k", "gk")
-- better ctrl u and d movements
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
-- Go to specific directories
keymap("n", "<leader>c", "<CMD>tabnew $MYVIMRC<CR><CMD>tcd %:p:h<CR>")
keymap("n", "<leader>n", function()
  local path = "~/webdav/"

  vim.cmd("tabnew " .. path)
  vim.cmd("tcd " .. path)
end)
-- Clear highlights
keymap("n", "<leader>h", "<CMD>nohlsearch<CR>")
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")
-- Resize with arrows
keymap("n", "<C-Up>", "<CMD>resize -2<CR>")
keymap("n", "<C-Down>", "<CMD>resize +2<CR>")
keymap("n", "<C-Right>", "<CMD>vertical resize -2<CR>")
keymap("n", "<C-Left>", "<CMD>vertical resize +2<CR>")
-- Navigate tabs
keymap("n", "<leader>tn", "<CMD>tabnew<CR>")
keymap("n", "<C-f>", "q:i")

--[[ * VISUAL MODE * ]]
-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")
-- Move text up and down
keymap("v", "p", '"_dP')
-- align by char
keymap("x", "<leader>ac", function()
  local region = vim.fn.getregionpos(vim.fn.getpos("v"), vim.fn.getpos("."), {
    type = "v",
    exclusive = false,
    eol = false,
  })
  local sline = region[1][1][2]
  local eline = region[#region][1][2]

  vim.ui.input({ prompt = "Align by char: ", default = "" }, function(input)
    local command = "column -t"
    local range = string.format("%d,%d", sline, eline)

    if input and input ~= "" then
      command = string.format("%s -s '%s' -o '%s'", command, input, input)
    end

    vim.cmd(range .. "!" .. command)
  end)
end, { desc = "Align by char", noremap = true, silent = true })

--[[ * OTHER PLUGINS *  ]]
-- FZF LUA
keymap("n", "<leader>ff", "<CMD>FzfLua files<CR>", opts)
keymap("n", "<leader>fg", "<CMD>FzfLua live_grep<CR>", opts)
keymap("n", "<leader>fb", "<CMD>FzfLua buffers<CR>", opts)
keymap("n", "<leader>fc", "<CMD>FzfLua colorschemes<CR>", opts)
keymap("n", "<leader>fs", "<CMD>FzfLua git_status<CR>", opts)
keymap("n", "<leader>fh", "<CMD>FzfLua git_bcommits<CR>", opts)
keymap("n", "<leader>fr", "<CMD>FzfLua resume<CR>", opts)
keymap("n", "<leader>fz", "<CMD>FzfLua zoxide<CR>", opts)
-- OIL NVIM
keymap("n", "<leader>e", "<CMD>Oil<CR>", opts)
-- LSP
keymap("n", "<leader>li", "<CMD>checkhealth vim.lsp<CR>")
-- GIT SIGNGS
keymap("n", "<leader>gh", "<CMD>Gitsigns next_hunk<CR>", opts)
keymap("n", "<leader>gH", "<CMD>Gitsigns prev_hunk<CR>", opts)
keymap("n", "<leader>gp", "<CMD>Gitsigns preview_hunk<CR>", opts)
keymap("n", "<leader>gb", "<CMD>Gitsigns blame_line<CR>", opts)
-- DAP
keymap("n", "<leader>dc", "<CMD>lua require'dap'.continue()<CR>", opts)
keymap("n", "<leader>db", "<CMD>lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<leader>do", "<CMD>lua require'dap'.step_over()<CR>", opts)
keymap("n", "<leader>di", "<CMD>lua require'dap'.step_into()<CR>", opts)
keymap("n", "<leader>dr", "<CMD>lua require'dap'.repl.open()<CR>", opts)
keymap("n", "<leader>dcb", "<CMD>lua require'dap'.clear_breakpoints()<CR>", opts)
-- DIFF
keymap("n", "<leader>1", "<CMD>diffget LOCAL<CR>", opts)
keymap("n", "<leader>2", "<CMD>diffget BASE<CR>", opts)
keymap("n", "<leader>3", "<CMD>diffget REMOTE<CR>", opts)
keymap("n", "<leader>df", "<CMD>windo diffthis<CR>", opts)
keymap("n", "<leader>do", "<CMD>windo diffoff<CR>", opts)
-- MACROS
keymap("n", "<leader>q", "@q<CR>", opts)

-- CUSTOM SESSION
keymap("n", "<leader>ms", "<CMD>lua require('utils.session').create_session()<CR>", opts)
keymap("n", "<leader>ml", "<CMD>lua require('utils.session').load_session()<CR>", opts)
