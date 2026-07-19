return {
	{
		"mason-org/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"gopls",
					"ruff",
					"tofu_ls",
					"stylua",
					"pyrefly",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,

		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- LSP Servers
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
			})
			vim.lsp.config("gopls", {
				capabilities = capabilities,
			})
			-- Pyrefly + Ruff
			vim.lsp.config("ruff", {
				capabilities = capabilities,
				init_options = {
					settings = {
						lineLength = 110,
					},
				},
			})
			vim.lsp.config("pyrefly", {
				capabilities = capabilities,
			})
			vim.lsp.config("tofu_ls", {
				capabilities = capabilities,
			})

			-- Key Bindings
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
