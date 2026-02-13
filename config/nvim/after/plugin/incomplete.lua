vim.o.completefunc = "v:lua.require'incomplete'.completefunc"
require("incomplete").extend_filetype("php", { "phpdoc" })
