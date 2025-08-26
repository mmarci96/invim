-- Load defaults from NvChad
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

lspconfig.bashls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "sh", "zsh", "make", "bash" },
}

-- Python LSP setup
lspconfig.pyright.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  settings = {
    python = {
      analysis = {
        diagnosticMode = "openFilesOnly", -- Lint only open files (saves resources)
        typeCheckingMode = "basic", -- "off", "basic", or "strict"
        autoSearchPaths = true, -- Adds common libs like site-packages to path
      },
    },
  },
}

lspconfig.ruff.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
}

-- TypeScript/JavaScript (tsserver) setup
lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  root_dir = lspconfig.util.root_pattern "package.json",
  single_file_support = false,
}

-- Enable gopls
lspconfig.gopls.setup {}

lspconfig.golangci_lint_ls.setup { autostart = false }
-- Optionally: enable golangci_lint_ls
lspconfig.golangci_lint_ls.setup {
  filetypes = { "go", "gomod" },
  root_dir = lspconfig.util.root_pattern("go.mod", "go.work", ".git"),
}
