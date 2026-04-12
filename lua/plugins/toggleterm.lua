return {
	'akinsho/toggleterm.nvim',
	config = function()
		local Terminal  = require('toggleterm.terminal').Terminal

		require("toggleterm").setup()

		local lazygit = Terminal:new({
			cmd = "lazygit",
			dir = "git_dir",
			direction = "float",
			float_opts = {
				border = "double",
			},
			-- function to run on opening the terminal
			on_open = function(term)
				vim.cmd("startinsert!")
				vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
			end,
			-- function to run on closing the terminal
			on_close = function(term)
				vim.cmd("startinsert!")
			end,
		})

		local rootTerm = Terminal:new({
			cmd = 'zsh',
			dir = 'git_dir',
			direction = "horizontal",

			on_close = function(term)
				vim.cmd("startinsert!")
			end,

			on_open = function(term)
				vim.cmd("startinsert!")
				vim.api.nvim_buf_set_keymap(term.bufnr, 't', "<c-q>", "<cmd>close<CR>", {noremap = true, silent = true})
				vim.api.nvim_buf_set_keymap(term.bufnr, 't', "<leader>t", "<cmd>close<CR>", {noremap = true, silent = true})
			end,
		})

		function _lazygit_toggle()
			lazygit:toggle()
		end

		function _root_term_toggle()
			rootTerm:toggle()
		end

		local hereTerm = Terminal:new({
			cmd = 'zsh',
			direction = "float",
			dir = '.',
			close_on_exit = true,

			on_close = function(term)
				vim.cmd("startinsert!")
			end,

			on_open = function(term)
				vim.cmd("startinsert!")
				vim.api.nvim_buf_set_keymap(term.bufnr, 't', "<c-q>", "<cmd>close<CR>", {noremap = true, silent = true})
			end,
		})

		function _here_term_toggle()
			hereTerm:toggle()
		end

		vim.api.nvim_set_keymap("n", "<c-g>", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
		vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>lua _root_term_toggle()<CR>", {noremap = true, silent = true})
		vim.api.nvim_set_keymap("n", "<leader>he", "<cmd>lua _here_term_toggle()<CR>", {noremap = true, silent = true})
	end
}
