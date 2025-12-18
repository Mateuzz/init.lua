return {
	"kndndrj/nvim-dbee",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	build = function()
		-- Install tries to automatically detect the install method.
		-- if it fails, try calling it with one of these parameters:
		--    "curl", "wget", "bitsadmin", "go"
		require("dbee").install()
	end,
	config = function()
		require("dbee").setup()
		require("dbee.sources").FileSource:new("./.vim/dbee.json")
		--
		-- require('dbee.sources').MemorySource:new({
		-- 	{
		-- 		name = 'mysql',
		-- 		type = 'mysql',
		-- 		url = "username:password@tcp(host)/database-name",
		-- 	}
		-- })
	end,
}
