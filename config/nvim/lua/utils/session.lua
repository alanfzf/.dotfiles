-- Directory to store sessions
local M = {}
local session_dir = vim.fn.stdpath("state") .. "/sessions"

local function get_session_file()
  -- Make sure the session directory exists
  if vim.fn.isdirectory(session_dir) == 0 then
    vim.fn.mkdir(session_dir, "p")
  end

  local folder = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
  local full_path = session_dir .. "/" .. folder .. "_session.vim"
  local escaped_path = vim.fn.fnameescape(full_path)

  return escaped_path
end

-- Create a session for current vim state
-- Based on current workspace folder.
M.create_session = function()
  local file = get_session_file()

  vim.cmd("mksession! " .. file)
  vim.notify("Session saved to " .. file)
end

M.load_session = function()
  local file = get_session_file()

  if vim.fn.filereadable(file) ~= 1 then
    vim.notify("No session found for this folder", vim.log.levels.WARN)
    return
  end

  vim.cmd("source " .. file)
  vim.notify("Session loaded from " .. file)
end

return M
