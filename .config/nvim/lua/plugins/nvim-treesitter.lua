return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvim-treesitter").setup({

				ensure_installed = {
					"python",
					"yaml",
					"json",
					"dockerfile",
					"nginx",
					"bash",
					"markdown",
					"markdown_inline",
					"lua",
					"gitignore",
					"toml",
					"go",
					"regex",
					"terraform",
					"helm",
				},
				sync_install = false,
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
					},
				},
			})
			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					local ft = vim.bo[args.buf].filetype

					if ft == "" or vim.bo[args.buf].buftype ~= "" then
						return
					end

					local lang = vim.treesitter.language.get_lang(ft)
					if lang then
						pcall(vim.treesitter.start, args.buf, lang)
					end
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = "VeryLazy",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {},
		config = function()
			local hooks = require("ibl.hooks")
			-- create the highlight groups in the highlight setup hook, so they are reset
			-- every time the colorscheme changes

			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "IndentGuide", {
					fg = "#3B4261", -- subtle Tokyo Night gray
				})
			end)
			require("ibl").setup({
				indent = {
					char = "▏",
					highlight = "IndentGuide",
				},
				scope = {
					enabled = true,
					show_start = true,
					show_end = true,
				},
			})
		end,
	},
}
