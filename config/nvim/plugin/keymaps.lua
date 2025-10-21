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
keymap("n", "cc", '"_cc')
-- fix j,k on virtual lines
keymap("n", "j", "gj")
keymap("n", "k", "gk")
-- better ctrl u and d movements
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
-- Go to specific directories
keymap("n", "<leader>c", "<CMD>tabnew $MYVIMRC<CR><cmd>tcd %:p:h<CR>")
keymap("n", "<leader>n", "<CMD>tabnew ~/Metanote/README.org<CR><CMD>tcd %:p:h<CR>")
-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>")
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")
-- Resize with arrows
keymap("n", "<C-Up>", "<cmd>resize -2<CR>")
keymap("n", "<C-Down>", "<cmd>resize +2<CR>")
keymap("n", "<C-Right>", "<cmd>vertical resize -2<CR>")
keymap("n", "<C-Left>", "<cmd>vertical resize +2<CR>")
-- Navigate tabs
keymap("n", "<leader>tn", "<cmd>tabnew<CR>")
keymap("n", "<C-f>", "q:i")

--[[ * VISUAL MODE * ]]
-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")
-- Move text up and down
keymap("v", "<A-j>", "<cmd>m .+1<CR>==")
keymap("v", "<A-k>", "<cmd>m .-2<CR>==")
keymap("v", "p", '"_dP')

--[[ * VISUAL BLOCK *  ]]
-- Move text up and down
keymap("x", "<A-j>", "<cmd>move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", "<cmd>move '<-2<CR>gv-gv", opts)

--[[ * OTHER PLUGINS *  ]]
-- FZF LUA
keymap("n", "<leader>ff", "<cmd>FzfLua files<CR>", opts)
keymap("n", "<leader>fg", "<cmd>FzfLua live_grep<CR>", opts)
keymap("n", "<leader>fb", "<cmd>FzfLua buffers<CR>", opts)
keymap("n", "<leader>fc", "<cmd>FzfLua colorschemes<CR>", opts)
keymap("n", "<leader>fs", "<cmd>FzfLua git_status<CR>", opts)
keymap("n", "<leader>fh", "<cmd>FzfLua git_bcommits<CR>", opts)
keymap("n", "<leader>fr", "<cmd>FzfLua resume<CR>", opts)
keymap("n", "<leader>fz", "<cmd>FzfLua zoxide<CR>", opts)
-- OIL NVIM
keymap("n", "<leader>e", "<cmd>Oil<CR>", opts)
-- LSP
keymap("n", "<leader>li", "<cmd>checkhealth vim.lsp<CR>")
-- GIT SIGNGS
keymap("n", "<leader>gh", "<cmd>Gitsigns next_hunk<CR>", opts)
keymap("n", "<leader>gH", "<cmd>Gitsigns prev_hunk<CR>", opts)
keymap("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", opts)
keymap("n", "<leader>gb", "<cmd>Gitsigns blame_line<CR>", opts)
-- DAP
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", opts)
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<CR>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<CR>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<CR>", opts)
keymap("n", "<leader>dcb", "<cmd>lua require'dap'.clear_breakpoints()<CR>", opts)
-- DIFF
keymap("n", "<leader>1", "<cmd>diffget LOCAL<CR>", opts)
keymap("n", "<leader>2", "<cmd>diffget BASE<CR>", opts)
keymap("n", "<leader>3", "<cmd>diffget REMOTE<CR>", opts)
keymap("n", "<leader>df", "<cmd>windo diffthis<CR>", opts)
keymap("n", "<leader>do", "<cmd>windo diffoff<CR>", opts)
-- MACROS
keymap("n", "<leader>q", "@q<CR>", opts)
