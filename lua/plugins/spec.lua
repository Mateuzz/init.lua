return {
	{
		'https://github.com/Raimondi/delimitMate'
	},
	{
		'https://github.com/tpope/vim-surround',
	},
	{
		'https://github.com/mattn/emmet-vim'
	},
	{
		'https://github.com/nvim-telescope/telescope.nvim',
		dependencies = { 'https://github.com/nvim-lua/plenary.nvim' },
		config = function()
			local key = require('telescope.builtin')
			local keyset = vim.keymap.set
			keyset('n', '<space>f', key.find_files, { desc = 'Telescope Find Files ' })
			keyset('n', '<space>r', key.live_grep, { desc = 'Telescope Live Grep ' })
			keyset('n', '<space>g', key.git_files, { desc = 'Telescope Git Files ' })
			keyset('n', '<space>u', key.oldfiles, { desc = 'Telescope Old Files ' })
		end
	},
	{
		'https://github.com/MagicDuck/grug-far.nvim'
	},
	{
		'https://github.com/justinmk/vim-sneak'
	},
	{
		'nanotee/zoxide.vim'
	},
	{
		'https://github.com/puremourning/vimspector'
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
		'nanotee/zoxide.vim'
	},
	{
		'https://github.com/honza/vim-snippets'
	},
	{
		'nvim-tree/nvim-web-devicons'
	},
	{
		'https://github.com/nvim-tree/nvim-tree.lua',
		opts = {},
		keys = {
			{'<c-n>', '<cmd>NvimTreeToggle<CR>'}
		}
	}

}
