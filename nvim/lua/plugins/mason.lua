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
			-- require("mason
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "rust_analyzer", "pyright", "ruff" },
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

			-- setup pyright with completion capabilities
			require("lspconfig").pyright.setup({
				capabilities = lspCapabilities,
			})

			-- ruff uses an LSP proxy, therefore it needs to be enabled as if it
			-- were a LSP. In practice, ruff only provides linter-like diagnostics
			-- and some code actions, and is not a full LSP yet.
			require("lspconfig").ruff.setup({
				-- organize imports disabled, since we are already using `isort` for that
				-- alternative, this can be enabled to make `organize imports`
				-- available as code action
				settings = {
					organizeImports = false,
				},
				-- disable ruff as hover provider to avoid conflicts with pyright
				on_attach = function(client)
					client.server_capabilities.hoverProvider = false
				end,
			})
		end,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.pylsp.setup({
				capabilities = capabilities,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
