return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>e", "<cmd>NvimTreeOpen<cr>", desc = "NvimTreeOpen" },
	},
	config = function()
		require("nvim-tree").setup()
		require("nvim-web-devicons").setup()
		vim.keymap.set("n", "<C-e>", ":NvimTreeOpen<CR>", {})
		vim.keymap.set("n", "<C-c>", ":NvimTreeClose<CR>", {})
	end,
}
