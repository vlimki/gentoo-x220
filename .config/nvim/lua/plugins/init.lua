return {
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
			require("config/lsp")
		end,
	},

	{
		"ggandor/leap.nvim",
		event = "VeryLazy",
		config = function()
			require("leap").add_default_mappings(true)
		end
	},

	{
		"ibhagwan/fzf-lua",
		cmd = { "FzfLua" },
		opts = {
			files = { cmd = "fd --type f --hidden --follow --exclude .git" },
			grep = { rg_opts = "rg --vimgrep --hidden --smart-case -g '!.git'" },
			winopts = { preview = { default = false } },
		},

		keys = {
			{
				"ff",
				function()
					vim.cmd("FzfLua files")
				end
			},
			{
				"fg",
				function()
					vim.cmd("FzfLua grep_project")
				end
			}
		},

		config = function(_, opts)
			require("fzf-lua").setup({ "skim" })
		end
			
	},

	{ "echasnovski/mini.nvim", version = false, config = function()
			require("mini.comment").setup()
			require("mini.surround").setup()
		end
	},
}
