return {
	"folke/trouble.nvim",
	opts = {}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	keys = {
		{
			"<leader>tr",
			":Trouble diagnostics toggle<CR>",
			desc = "Diagnostics (Trouble)",
		},
		-- {
		-- 	"<leader>xX",
		-- 	"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
		-- 	desc = "Buffer Diagnostics (Trouble)",
		-- },
		-- {
		-- 	"<leader>cl",
		-- 	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
		-- 	desc = "LSP Definitions / references / ... (Trouble)",
		-- },
	-- 	{
	-- 		"<leader>xL",
	-- 		"<cmd>Trouble loclist toggle<cr>",
	-- 		desc = "Location List (Trouble)",
	-- 	},
	-- 	{
	-- 		"<leader>xQ",
	-- 		"<cmd>Trouble qflist toggle<cr>",
	-- 		desc = "Quickfix List (Trouble)",
	-- 	},
	},
    -- config = function ()
    --     vim.keymap.set("n", "<leader>tr", ":Trouble diagnostics toggle<CR>")
    -- end
}