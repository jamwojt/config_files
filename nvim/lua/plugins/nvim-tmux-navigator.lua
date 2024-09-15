return {
	"christoomey/vim-tmux-navigator",
	vim.keymap.set("n", "<C-h>", ":TmuxNavigateLeft<CR>"),
	vim.keymap.set("n", "<C-j>", ":TmuxNavigateRight<CR>"),
	vim.keymap.set("n", "<C-k>", ":TmuxNavigateUp<CR>"),
	vim.keymap.set("n", "<C-l>", ":TmuxNavigateDown<CR>"),
}