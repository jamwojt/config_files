return{
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({with_sync = true})()
    end,
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            auto_install = true,
            ensure_installed = {"lua", "python", "rust", "bash", "markdown_inline"},
            highlight = {enable = true},
            indent = {enable = true},
        })
    end
}
