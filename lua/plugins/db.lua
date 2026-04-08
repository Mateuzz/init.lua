return {
	{
		"tpope/vim-dadbod",
	},
	{
		"kristijanhusak/vim-dadbod-completion",
	},
	{
		"kristijanhusak/vim-dadbod-ui",

		init = function ()
			vim.g.db_ui_auto_execute_table_helpers = 1
			vim.g.db_ui_tmp_query_location = '/home/user/archive/tmp/queries'
			vim.g.db_ui_show_database_icon = 1
			vim.g.db_ui_use_nvim_notify = 0
			vim.g.db_ui_use_nerd_fonts = 1
		end
	},

	-- "kndndrj/nvim-dbee",
	-- dependencies = {
	-- 	"MunifTanjim/nui.nvim",
	-- },
	-- build = function()
	-- 	-- Install tries to automatically detect the install method.
	-- 	-- if it fails, try calling it with one of these parameters:
	-- 	--    "curl", "wget", "bitsadmin", "go"
	-- 	require("dbee").install()
	-- end,
	-- config = function()
	-- 	require("dbee").setup()
	-- 	require("dbee.sources").FileSource:new("./.vim/dbee.json")
	-- 	--
	-- 	-- require('dbee.sources').MemorySource:new({
	-- 	-- 	{
	-- 	-- 		name = 'mysql',
	-- 	-- 		type = 'mysql',
	-- 	-- 		url = "username:password@tcp(host)/database-name",
	-- 	-- 	}
	-- 	-- })
	-- end,
}
