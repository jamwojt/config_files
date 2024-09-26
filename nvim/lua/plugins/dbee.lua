return {
	"kndndrj/nvim-dbee",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"kkharji/sqlite.lua",
	},
	build = function()
		-- Install tries to automatically detect the install method.
		-- if it fails, try calling it with one of these parameters:
		--    "curl", "wget", "bitsadmin", "go"
		require("dbee").install()
	end,
	config = function()
		require("dbee").setup({
			sources = {
				require("dbee.sources").MemorySource:new({
					name = "argaleo.db",
					type = "SQLite",
					url = "~/uni/2024-25ab-fai3-specialisation-project-team-argaleo-1/argaleo.db",
				}),
				require("dbee.sources").EnvSource:new("DBEE_CONNECTIONS"),
				require("dbee.sources").FileSource:new(vim.fn.stdpath("cache") .. "/dbee/persistence.json"),
			},
		})
	end,
}
