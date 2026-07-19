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
				toml = { "tombi" },
				yml = { "yamlfmt" },
				yaml = { "yamlfmt" },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			notify_on_error = true,
			notify_no_formatters = true,
			log_level = vim.log.levels.ERROR,
		})
		vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, {})
	end,
}
