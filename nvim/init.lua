vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "88"

vim.g.lua_host_prog = '~/lua_env/bin/lua'
vim.g.luarocks_host_prog = '~/lua_env/bin/luarocks'
-- opts.rocks.enabled = true

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		lazyrepo,
		lazypath,
	})
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

-- set line numbers and stuff in there
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.signcolumn = "yes"

-- set font
vim.o.guifont = "Hack Nerd Font"

-- Setup lazy.nvim and call all plugins
require("lazy").setup("plugins")

-- Function to open Csvlens menu for a given file path
local function open_csvlens_menu(file_path)
	-- Check if the file path is provided and not empty
	if file_path and file_path ~= "" then
		vim.cmd("sp " .. file_path)
		vim.cmd("Csvlens")
	else
		print("Please provide a valid file path.")
	end
end

-- Create the custom command
vim.api.nvim_create_user_command("DV", function(opts)
	open_csvlens_menu(opts.args)
end, { nargs = 1, complete = "file" })
