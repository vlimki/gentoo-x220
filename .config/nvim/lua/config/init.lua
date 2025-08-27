local o, wo, bo = vim.opt, vim.wo, vim.bo

vim.g.mapleader = " "
vim.g.maplocalleader = " "

o.lazyredraw      	= true
o.updatetime      	= 250
o.timeoutlen      	= 400
o.swapfile       	= false
o.backup          	= false
o.undofile        	= true
o.undolevels      	= 1000
o.shada          	= "!,'50,<50,s10,h"
o.hidden          	= true
o.completeopt     	= "menuone,noselect"
o.inccommand      	= "nosplit"
o.grepprg         	= "rg --vimgrep --no-heading --smart-case"
o.grepformat      	= "%f:%l:%c:%m"
o.scrolloff       	= 0
o.sidescrolloff   	= 0
o.showmode        	= false
o.ruler           	= false
o.cursorline      	= false
o.list            	= false
o.number	  		= true
o.relativenumber 	= true
o.shiftwidth 		= 4
o.tabstop 			= 4
o.foldenable      	= false
o.conceallevel    	= 2
wo.signcolumn     	= "no"

vim.cmd("set fillchars+=vert:▕")

require("config/colors")

vim.keymap.set("n","<leader>ss", function()
  vim.wo.spell = not vim.wo.spell
end, { silent = true, desc = "Toggle spell" })

vim.keymap.set("n","<leader>q", "<cmd>cclose<cr>", {silent=true})
vim.keymap.set("n","<leader>w", "<cmd>update<cr>", {silent=true})
vim.keymap.set("n","<leader>e", "<cmd>edit<cr>", {silent=true})

vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "*.tex",
	callback = function(args)
		vim.cmd("0r ~/.config/nvim/template.tex")
	end,
})

-- Markdown stuff --

local function md_pdf_paths(buf)
  local src = vim.api.nvim_buf_get_name(buf)
  if src == "" then src = vim.fn.expand("%:p") end
  local pdf = "/tmp/" .. vim.fn.fnamemodify(src, ":t:r") .. ".pdf"
  return src, pdf
end

vim.api.nvim_create_user_command("MDPdf", function()
  if vim.bo.filetype ~= "markdown" and not vim.fn.expand("%:t"):match("%.md$") then return end
  local src, pdf = md_pdf_paths(0)
  vim.fn.jobstart({ "pandoc", src, "--pdf-engine=pdflatex", "--pdf-engine-opt=-synctex=1", "-o", pdf }, { detach = true })
end, { desc = "Compile current Markdown to /tmp PDF" })

vim.api.nvim_create_user_command("MDView", function()
  local _, pdf = md_pdf_paths(0)
  vim.fn.jobstart({ "zathura", pdf }, { detach = true })
end, { desc = "Open /tmp PDF in zathura" })

vim.keymap.set("n","<leader>lr", "<cmd>MDPdf<cr>", {silent=true})
vim.keymap.set("n","<leader>ll", "<cmd>MDView<cr>", {silent=true})
