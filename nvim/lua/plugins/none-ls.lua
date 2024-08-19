return {
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.stylua,
                    -- null_ls.builtins.diagnostics.ruff.with({
                    --     extra_args = {
                    --         "--line-length",
                    --         "88",
                    --     },
                    -- }),
                    null_ls.builtins.formatting.isort.with({
                        extra_args = { "--profile", "black", "--lines-after-imports", "2" },
                    }),
                    null_ls.builtins.formatting.black.with({
                        extra_args = { "--line-length=88" },
                    }),
                },
                update_in_insert = true,
            })
            vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {})
        end,
    },
}
