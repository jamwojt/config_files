return {
	"kmontocam/nvim-conda",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		vim.keymap.set("n", "<leader>en", ":CondaActivate<CR>")
	end,
}
