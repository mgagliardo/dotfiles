return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local treesitter = require("nvim-treesitter")

			treesitter.install({

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

				indent = { enable = true },

				highlight = {
					enable = true,
					-- List of languages that will be disabled
					disable = { "" },
					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
					-- Using this option may slow down your editor, and you may see some duplicate highlights.
					-- Instead of true it can also be a list of languages
					-- additional_vim_regex_highlighting = false,
					additional_vim_regex_highlighting = false,
				},

				textobjects = {
					select = {
						enable = true,
						lookahead = true,
					},
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
	},
}
