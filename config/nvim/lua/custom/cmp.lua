local cmp = require "cmp"

cmp.setup {
    completion = {
        autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
        delay = 200,
        completeopt = "menu,menuone,noselect",
    },
    mapping = {
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),

        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<Up>"] = cmp.mapping.select_prev_item(),
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    sources = {
        { name = "jdtls" },
        { name = "ts_ls" },
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "path",       trigger_characters = { "/", "./" } },
        { name = "buffer" },
        { name = "spell",      option = { enable_in_comment = true } },                 -- Spell-check
        { name = "cmp-react" }
    },
    preselect = cmp.PreselectMode.Item,
}

