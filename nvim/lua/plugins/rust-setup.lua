return {
	{
		"simrat39/rust-tools.nvim",
		config = function()
			require("rust-tools").setup({
				server = {
					on_attach = function(_, bufnr)
						vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
						vim.keymap.set("n", "<leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
					end,
				},
			})
		end,
	},
	-- {
	-- 	"mrcjkb/rustaceanvim",
	-- 	version = "^5", -- Recommended
	-- 	lazy = false, -- This plugin is already lazy
 --        config = function()
 --            require("rustaceanvim").setup({})
 --        end
	-- },
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
}
