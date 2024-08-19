return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "rust_analyzer", "pyright" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		init = function()
			-- this snippet enables auto-completion
			local lspCapabilities = vim.lsp.protocol.make_client_capabilities()
			lspCapabilities.textDocument.completion.completionItem.snippetSupport = true

			-- set up harper for spell checking
			require("lspconfig").harper_ls.setup({
				settings = {
					["harper-ls"] = {
						linters = {
							spell_check = true,
							spelled_numbers = false,
							an_a = true,
							sentence_capitalization = false,
							unclosed_quotes = true,
							wrong_quotes = false,
							long_sentences = true,
							repeated_words = false,
							spaces = true,
							matcher = true,
							correct_number_suffix = true,
							number_suffix_capitalization = true,
							multiple_sequential_pronouns = true,
						},
					},
				},
			})

			-- setup pyright with completion capabilities
			require("lspconfig").pyright.setup({
				capabilities = lspCapabilities,
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "off",
							autoSearchPaths = true,
							useLibraryCodeForTypes = false,
							diagnosticMode = "openFilesOnly", -- or 'workspace'
							logLevel = "Hint",
							autoImportCompletions = true,
						},
					},
				},
			})
		end,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
