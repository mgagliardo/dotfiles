return {
  "nvim-treesitter/nvim-treesitter",
  version = "v0.10.0",
  lazy = false,
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local treesitter = require("nvim-treesitter.configs")
    -- configure treesitter
    treesitter.setup({ -- enable syntax highlighting

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
      },

      sync_install = false,

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
      -- enable indentation
      indent = { enable = true },
    })
  end,
}

