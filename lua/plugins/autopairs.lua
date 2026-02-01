return {
	-- {
	-- 	'https://github.com/Raimondi/delimitMate',
	-- 	config = function ()
	-- 		vim.g.delimitMate_matchpairs = '(:),[:],{:}'
	-- 	end
	-- },
	{
		'altermo/ultimate-autopair.nvim',
		event={'InsertEnter','CmdlineEnter'},
		branch='v0.6', --recommended as each new version will have breaking changes
		opts={
			--Config goes here
		},
	}
	-- {
	-- 	'windwp/nvim-autopairs',
	-- 	opts = {},
	-- },
	-- {
	-- 	'nvim-mini/mini.pairs',
	-- 	opts = {},
	-- },
}
