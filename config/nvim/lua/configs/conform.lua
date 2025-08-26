local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    typescript = { "prettier" }, -- Add Prettier for TypeScript
    typescriptreact = { "prettier" },
    javascript = { "prettier" },
  },
  formatters = {
    isort = {
      prepend_args = {
        "--profile",
        "black",
      },
    },
    black = {
      prepend_args = { "--line-length", "80" },
    },
    prettier = {
      prepend_args = {
        "--print-width",
        "80",
        "--tab-width",
        "4",
        "--use-tabs",
        "false",
      },
    },
  },

  format_on_save = {
    timeout_ms = 1500,
    lsp_fallback = true,
  },
}

return options

