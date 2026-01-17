return {
	"azorng/goose.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				anti_conceal = { enabled = false },
			},
		},
	},
	config = function()
		require("goose").setup({
			openrouter = {
				[[
          ollama = {
            "qwen3-coder:latest",
          }
        ]],
			},
		})
	end,
}
