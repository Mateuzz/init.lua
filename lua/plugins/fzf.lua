return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "nvim-mini/mini.icons" },
  opts = {},
  

  config = function()
	  local kset = vim.keymap.set
	  local fzf = require('fzf-lua')

	  kset('n', '<space>f', function() fzf.files({ no_ignore = true }) end)
	  kset('n', '<space>g', function() fzf.git_files() end)
	  kset('n', '<space>u', function() fzf.oldfiles() end)
	  kset('n', '<space>r', function() fzf.live_grep() end)
	  kset('n', '<space>b', function() fzf.buffers() end)
	  kset('n', '<space>z', function() fzf.zoxide() end)
  end
}
