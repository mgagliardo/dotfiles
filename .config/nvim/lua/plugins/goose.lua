return {
  "azorng/goose.nvim",
  version = "v1.0.4",
  config = function()
    require("goose").setup({
      openrouter = {
        [[
          ollama = {
            "qwen3-coder:latest",
          }
        ]]
      }
    })
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        anti_conceal = { enabled = false },
      },
    },
  },
}

