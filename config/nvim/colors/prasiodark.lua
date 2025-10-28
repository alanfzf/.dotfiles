vim.g.colors_name = "prasiodark"
vim.cmd.hi("clear")
if vim.fn.exists("syntax_on") then
  vim.cmd.syntax("on")
end

local C = {
  fg = "#B9C9CA",
  delim = "#919DA2",
  comment = "#576E76",
  highlight = "#3B4349",
  bg = "#1F2428",
  forest = "#3E987D",
  green = "#55AB4D",
  lime = "#9FD83E",
  pastel = "#9DD3B0",
  khaki = "#A5BB82",
  swamp = "#5A7C20",
  gold = "#FDAF00",
  red = "#E91F2D",
  blue = "#00BBDE",
}
C.operator = C.delim

local function set_highlights()
  local highlights = {
    Normal = { bg = C.bg, fg = C.fg },
    Error = { link = "Normal" },
    ColorColumn = { bg = C.highlight },
    CurSearch = { bg = C.khaki, fg = C.bg },
    Search = { bg = C.swamp, fg = C.bg },
    CursorColumn = { link = "ColorColumn" },
    CursorLine = { bg = C.highlight },
    Directory = { fg = C.lime },
    Winseparator = { fg = C.fg },
    MatchParen = { bg = C.swamp, fg = C.fg },
    StatusLine = { bg = C.highlight },
    StatusLineNC = { link = "StatusLine" },
    Visual = { bg = C.highlight },

    -- Syntax Groups
    Comment = { fg = C.comment },
    Identifier = { fg = C.fg },
    Function = { fg = C.green },
    Statement = { fg = C.fg },
    Operator = { fg = C.operator },
    Special = { fg = C.lime },
    Delimiter = { fg = C.delim },
    Type = { fg = C.forest },
    String = { fg = C.lime },
    Character = { link = "String" },
    SpecialChar = { fg = C.swamp },
    Constant = { fg = C.pastel },
    ["@variable"] = { link = "Identifier" },
    ["@constructor"] = { link = "Type" },
    ["@type.builtin"] = { link = "Type" },
    ["@function.builtin"] = { link = "Function" },
    ["@constant.builtin"] = { link = "Constant" },
    ["@punctuation.special"] = { link = "Operator" },
    ["@string.documentation"] = { fg = C.lime },
    ["@variable.parameter"] = { link = "Parameter" },
    -- Uncomment this if you want function parameters highlighted
    -- Parameter = { fg = C.khaki },

    GitSignsAdd = { fg = C.green },
    GitSignsChange = { fg = C.blue },
    GitSignsDelete = { fg = C.red },

    MiniStatuslineModeVisual = { bg = C.fg, fg = C.bg, bold = true },
    MiniStatuslineModeReplace = { bg = C.gold, fg = C.bg, bold = true },
    MiniStatuslineModeOther = { bg = C.gold, fg = C.bg, bold = true },
    MiniStatuslineModeNormal = { bg = C.pastel, fg = C.bg, bold = true },
    MiniStatuslineModeInsert = { bg = C.green, fg = C.bg, bold = true },
    MiniStatuslineModeCommand = { bg = C.khaki, fg = C.bg, bold = true },

    ["@lsp.type.macro"] = { bold = true, italic = true },
    ["@module"] = { fg = C.forest },
    ["@module.builtin"] = { link = "@module" },
    ["@tag"] = { link = "Type" },
    ["@tag.builtin"] = { link = "Function" },
    ["@tag.attribute"] = { fg = C.khaki },
    ["@tag.delimiter"] = { link = "Delimiter" },

    DiagnosticError = { fg = C.red },
    DiagnosticWarn = { fg = C.gold },
    DiagnosticInfo = { fg = C.blue },
    DiagnosticHint = { fg = C.forest },
    DiagnosticOk = { fg = C.lime },
  }

  for group, settings in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

set_highlights()

vim.g.terminal_color_0 = C.bg
vim.g.terminal_color_8 = C.delim
vim.g.terminal_color_1 = C.red
vim.g.terminal_color_9 = C.red
vim.g.terminal_color_2 = C.green
vim.g.terminal_color_10 = C.lime
vim.g.terminal_color_3 = C.gold
vim.g.terminal_color_11 = C.gold
vim.g.terminal_color_4 = C.blue
vim.g.terminal_color_12 = C.blue
vim.g.terminal_color_5 = C.pastel -- don't have purple but oh well
vim.g.terminal_color_13 = C.pastel
vim.g.terminal_color_6 = C.forest
vim.g.terminal_color_14 = C.forest
vim.g.terminal_color_7 = C.fg
vim.g.terminal_color_15 = C.fg
