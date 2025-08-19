local cmd = vim.cmd
local o = vim.opt

o.termguicolors = true

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local colors = {
	black = "#000000",
	red = "#cd0000",
	green = "#00cd00",
	yellow = "#cdcd00",
	blue = "#0000ee",
	magenta = "#cd00cd",
	gray = "#484848",
	dark_gray = "#080808"
}

cmd("set background=dark")
cmd("set relativenumber")

hl("Normal", { bg = colors.black })
hl("Comment", { fg = colors.gray })
hl("String", { fg = colors.green })
hl("Number", { fg = colors.magenta })
hl("Type", { fg = colors.blue })
hl("Function", { fg = colors.blue })
hl("Statement", { fg = colors.magenta })
hl("Identifier", { fg = colors.blue})
hl("Special", { fg = "White" })
hl("PreProc", { fg = colors.magenta })
hl("StatusLine", { bg = colors.dark_gray })
hl("LineNr", { fg = "None", fg = colors.gray })
hl("WinSeparator", { fg = colors.gray })
hl("NonText", { fg = "Black" })
hl("Pmenu", { fg ="None", bg = colors.dark_gray })
hl("PmenuSel", { bg = colors.gray })
