local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        typescript = { "prettier" }, -- Add Prettier for TypeScript
        typescriptreact = { "prettier" },
        javascript = { "prettier" },
        java = { "google-java-format" },
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
        -- ["clang-format"] = {
        --     command = "clang-format",
        --     args = { "--assume-filename", "Test.java", },
        --     stdin = true,
        -- },
        ["google-java-format"] = {
            command = "/usr/bin/google-java-format",
            args = { "--aosp", "-" },
            stdin = true,
        },
    },

    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 1500,
        lsp_fallback = true,
    },
}

return options
