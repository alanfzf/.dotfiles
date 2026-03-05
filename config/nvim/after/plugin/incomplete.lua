local ok, incomplete = pcall(require, "incomplete")

if not ok then
  return
end

vim.o.completefunc = "v:lua.require'incomplete'.completefunc"
incomplete.extend_filetype("php", { "phpdoc" })
