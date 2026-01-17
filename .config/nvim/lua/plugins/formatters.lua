return {
	"stevearc/conform.nvim",
	config = function()
		local cnf = require("conform")

		cnf.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports", "gofmt" },
				python = { "ruff_fix", "ruff_format" },
				terraform = { "tofu_fmt" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			formatters = {
				ty = {
					-- This can be a string or a function that returns a string.
					-- When defining a new formatter, this is the only field that is required
					command = "ty check",
					stdin = true,
					append_args = { "--trailing-comma" },
				},
			},
			notify_on_error = true,
			notify_no_formatters = true,
			log_level = vim.log.levels.ERROR,
		})
		vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, {})
	end,
}
