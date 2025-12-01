-- Directory to store sessions
local session_dir = vim.fn.expand("~/.nvim_sessions")

-- Make sure the session directory exists
if vim.fn.isdirectory(session_dir) == 0 then
  vim.fn.mkdir(session_dir, "p")
end

-- Function to get session file path based on current folder
local function session_file()
  local folder = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
  return session_dir .. "/" .. folder .. "_session.vim"
end

vim.keymap.set("n", "<leader>ms", function()
  local file = session_file()
  vim.cmd("mksession! " .. file)
  print("Session saved to " .. file)
end, { noremap = true, desc = "Save session" })

vim.keymap.set("n", "<leader>ml", function()
  local file = session_file()
  if vim.fn.filereadable(file) == 1 then
    vim.cmd("source " .. file)
    print("Session loaded from " .. file)
  else
    print("No session found for this folder")
  end
end, { noremap = true, desc = "Load session" })
