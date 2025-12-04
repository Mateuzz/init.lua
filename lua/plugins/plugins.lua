return {
	{
		'https://github.com/tpope/vim-surround',
	},
	{
		'https://github.com/mattn/emmet-vim',
	},
	{
		'https://github.com/MagicDuck/grug-far.nvim'
	},
	{
		'https://github.com/puremourning/vimspector',
		config = function()
			vim.g.vimspector_enable_mappings = 'HUMAN'
		end
	},
	{
		'https://github.com/Mateuzz/dark-obsidian.vim',
		config = function()
			vim.cmd [[colorscheme rust]]
		end
	},
	{
		'https://github.com/mbbill/undotree'
	},
	{
		'https://github.com/tpope/vim-fugitive'
	},
	{
		'https://github.com/sindrets/diffview.nvim'
	},
	{
		'https://github.com/lewis6991/gitsigns.nvim',
		config = function()
			local keyset = vim.keymap.set
			keyset('n', '<leader>gl', '<cmd>Gitsigns toggle_linehl<cr>')
			keyset('n', '<leader>gd ', '<cmd>Gitsigns toggle_deleted<cr>')
			keyset('n', '<leader>gw', '<cmd>Gitsigns toggle_word_diff<cr>')
			keyset('n', '<leader>gs', '<cmd>Gitsigns toggle_signs<cr>')
		end
	},
	{
		'https://github.com/honza/vim-snippets'
	},
	{
		'nvim-tree/nvim-web-devicons'
	},
	{
		'https://github.com/nvim-tree/nvim-tree.lua',
		lazy = false,
		opts = {
			disable_netrw = true,
			diagnostics = {
				enable = true,
			}
		},
		keys = {
			{ '<c-n>', '<cmd>NvimTreeToggle<CR>' },
			{ '<c-m>', '<cmd>NvimTreeToggle %:h<CR>' }
		}
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require('harpoon')
			harpoon:setup()
			vim.keymap.set("n", "<c-,>", function() harpoon:list():add() end)
			vim.keymap.set("n", "<c-.>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
		end
	},
}
