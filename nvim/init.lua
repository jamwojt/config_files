vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- vim.cmd("set number")
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.signcolumn = "number"
vim.o.guifont = "Hack Nerd Font"

-- set esc alternatives
vim.keymap.set("i", "jk", "<Esc>l", {})
vim.keymap.set("i", "kj", "<Esc>", {})
vim.keymap.set("v", "jk", "<Esc>l", {})
vim.keymap.set("v", "kj", "<Esc>", {})

-- moving between nvim split windows
vim.keymap.set("n", "<C-h>", "<C-w>h", {})
vim.keymap.set("n", "<C-j>", "<C-w>j", {})
vim.keymap.set("n", "<C-k>", "<C-w>k", {})
vim.keymap.set("n", "<C-l>", "<C-w>l", {})

-- better halh page scroll
vim.keymap.set("n", "<C-d>", "<C-d>M", {})
vim.keymap.set("n", "<C-u>", "<C-u>M", {})

-- disable highlight
vim.keymap.set("n", "<leader>nh", ":noh<CR>", {})

-- copy/paste using system clipboard
vim.keymap.set("v", "<leader>y", '"+y', {})
vim.keymap.set("n", "<leader>p", '"+p', {})

-- Setup lazy.nvim
require("lazy").setup("plugins")

-- set moving lines commands
local opts = { noremap = true, silent = true }
-- Normal-mode commands
vim.keymap.set('n', '<A-j>', ':MoveLine(1)<CR>', opts)
vim.keymap.set('n', '<A-k>', ':MoveLine(-1)<CR>', opts)
vim.keymap.set('n', '<A-h>', ':MoveHChar(-1)<CR>', opts)
vim.keymap.set('n', '<A-l>', ':MoveHChar(1)<CR>', opts)
vim.keymap.set('n', '<leader>wf', ':MoveWord(1)<CR>', opts)
vim.keymap.set('n', '<leader>wb', ':MoveWord(-1)<CR>', opts)

-- Visual-mode commands
vim.keymap.set('v', '<A-j>', ':MoveBlock(1)<CR>', opts)
vim.keymap.set('v', '<A-k>', ':MoveBlock(-1)<CR>', opts)
vim.keymap.set('v', '<A-h>', ':MoveHBlock(-1)<CR>', opts)
vim.keymap.set('v', '<A-l>', ':MoveHBlock(1)<CR>', opts)

-- Function to open Csvlens menu for a given file path
local function open_csvlens_menu(file_path)
	-- Check if the file path is provided and not empty
	if file_path and file_path ~= "" then
        vim.cmd("sp "..file_path)
        vim.cmd("Csvlens")
	else
		print("Please provide a valid file path.")
	end
end

-- Create the custom command
vim.api.nvim_create_user_command(
    "DV",
    function(opts)
	    open_csvlens_menu(opts.args)
    end,
    { nargs = 1, complete = "file" }
)
