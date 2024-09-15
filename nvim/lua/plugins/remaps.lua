return {

    -- set esc alternatives
    vim.keymap.set("i", "<M-c>", "<Esc>", {}),
    vim.keymap.set("v", "<M-c>", "<Esc>", {}),

    -- moving between nvim split windows
    vim.keymap.set("n", "<C-h>", "<C-w>h", {}),
    vim.keymap.set("n", "<C-j>", "<C-w>j", {}),
    vim.keymap.set("n", "<C-k>", "<C-w>k", {}),
    vim.keymap.set("n", "<C-l>", "<C-w>l", {}),

    -- better half page scroll
    vim.keymap.set("n", "<C-d>", "<C-d>zz", {}),
    vim.keymap.set("n", "<C-u>", "<C-u>zz", {}),

    -- disable highlight
    vim.keymap.set("n", "<leader>nh", ":noh<CR>", {}),

    -- copy/paste using system clipboard
    vim.keymap.set("v", "<leader>y", '"+y', {}),
    vim.keymap.set("n", "<leader>p", '"+p', {}),

    -- paste over highlighted text
    vim.keymap.set("x", "<leader>P", '"_dP'),

    -- open markdown preview
    vim.keymap.set("n", "<leader>mp", ":MarkdownPreviewToggle<CR>"),

    --navigate vim-tmux panes
    vim.keymap.set("n", "<C-h>", ":wincmd h<CR>"),
    vim.keymap.set("n", "<C-j>", ":wincmd j<CR>"),
    vim.keymap.set("n", "<C-k>", ":wincmd k<CR>"),
    vim.keymap.set("n", "<C-l>", ":wincmd l<CR>"),
}
