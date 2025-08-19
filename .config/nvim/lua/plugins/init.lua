return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "lua","vim","bash","python","c","rust" },
			highlight = {
				enable = true,
				disable = function(lang, buf)
					local ok, val = pcall(vim.api.nvim_buf_get_var, buf, "bigfile")
					return ok and val
				end,
			},
			indent = { enable = true, disable = { "python","latex" } },
			incremental_selection = { enable = false },
		},
		config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end,
	},

	{
		"lervag/vimtex",
		ft = { "tex" },
		init = function()
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_quickfix_mode = 0	
			vim.g.vimtex_mappings_enabled = 1
			vim.g.vimtex_complete_enabled = 0
			vim.g.vimtex_compiler_latexmk = {
				options = { "-pdf", "-interaction=nonstopmode", "-file-line-error", "-synctex=1" },
			}
		end,
	},

	{
		"neovim/nvim-lspconfig",
		event = "BufReadPre",
		config = function()
			local lsp = require("lspconfig")
			local on_attach = function(client, bufnr)
				client.server_capabilities.semanticTokensProvider = nil
				vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
			end
			local function start(server, cfg)
				if vim.fn.executable(server) == 1 then cfg.on_attach = on_attach; lsp[cfg.name].setup(cfg) end
			end

			if vim.fn.executable("texlab") == 1 then
				lsp.texlab.setup({
					on_attach = on_attach,
					settings = {
						texlab = {
							build = { executable = "latexmk", args = { "-pdf","-interaction=nonstopmode","-synctex=1","%f" }, forwardSearchAfter = false },
							forwardSearch = { executable = "zathura", args = { "--synctex-forward", "%l:1:%f", "%p" } },
						},
					},
				})
			end

			if vim.fn.executable("clangd") == 1 then
				lsp.clangd.setup({ on_attach = on_attach, cmd = { "clangd", "--background-index", "--header-insertion=never" } })
			end

			if vim.fn.executable("pyright-langserver") == 1 then
				lsp.pyright.setup({ on_attach = on_attach })
			end

			if vim.fn.executable("lua-language-server") == 1 then
				lsp.lua_ls.setup({
					on_attach = on_attach,
					settings = { Lua = { diagnostics = { globals = { "vim" } }, workspace = { checkThirdParty = false } } },
				})
			end

			local map = vim.keymap.set
			map("n","gd", vim.lsp.buf.definition,	 {silent=true})
			map("n","gr", vim.lsp.buf.references,	 {silent=true})
			map("n","K",	vim.lsp.buf.hover,				{silent=true})
			map("n","gi", vim.lsp.buf.implementation,{silent=true})
			map("n","ga", vim.lsp.buf.code_action,	{silent=true})
			map("n","gR", vim.lsp.buf.rename,			 {silent=true})
			map("n","gD", vim.lsp.buf.declaration,	{silent=true})
		end,
	},

	-- Tiny, fast essentials
	{ "echasnovski/mini.nvim", version = false, config = function()
			require("mini.comment").setup()
			require("mini.surround").setup()
		end
	},
}
