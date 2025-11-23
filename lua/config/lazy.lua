-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filte = blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"
vim.g.t_vb = ''
vim.g.c_no_curly_error = true
vim.g.shell = '/bin/zsh'

vim.o.showmode = false
vim.o.errorbells = false
vim.o.cursorline = true
vim.o.showmatch = false
vim.o.expandtab = false
vim.o.autochdir = false
vim.o.wrap = false
vim.o.termguicolors = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.sidescroll = 1
vim.o.splitbelow = true
vim.o.conceallevel = 3
vim.o.splitright = true
vim.o.inccommand = 'split'
vim.o.laststatus = 2
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.ruler = true
vim.o.scrolloff = 2
vim.o.sidescrolloff = 5
vim.o.foldcolumn = 'auto'
vim.o.hidden = true
vim.o.lazyredraw = true
vim.o.confirm = true
vim.o.encoding = 'UTF-8'
vim.o.smarttab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = -1
vim.o.backspace = 'indent,eol,start'
vim.o.undofile = true
vim.o.timeoutlen = 500
vim.o.autoindent = true
vim.o.cindent = true
vim.o.signcolumn = 'auto'
vim.o.colorcolumn = '90'
vim.o.updatetime = 250
vim.o.shortmess = 'cFWlat'
vim.o.pumheight = 10
vim.o.writebackup = true
vim.o.backup = true
vim.o.dir = '/tmp/nvim/dir'
vim.o.backupdir = '/tmp/nvim/bdir'
vim.o.mouse = 'a'
vim.o.background = 'dark'
vim.opt.iskeyword:append("-")
vim.opt.tags:append("./tags")
vim.o.grepprg = 'rg --vimgrep --no-heading'
vim.o.grepformat = '%f:%l:%c:%m'
vim.o.guicursor = 'n-v-c:block-cursor/lCursor'

local keyset = vim.keymap.set

keyset('n', 'dd', 'D')
keyset('n', 'D', 'dd')
keyset('n', 'cc', 'C')
keyset('n', 'C', 'cc')
keyset('n', '<c-enter>', '<esc>o')
keyset({'n', 'v'}, '<c-c>', '"+y"')
keyset('n', '<c-v>', '"+p"')
keyset('i', 'jk', '<esc>')
keyset('t', 'jk', [[<c-\><c-n>]])
keyset('t', '<esc>', [[<c-\><c-n>]])
keyset('i', '<c-D>', 'X<esc>lbce')
keyset('i', '<c-BS>', '<C-W>')

vim.cmd('cnoreabbrev E e')
vim.cmd('filetype plugin indent on')
vim.cmd('au! BufRead,BufNewFile *.php* setlocal filetype=php | setlocal syntax=php | set cindent | set indentexpr=')
vim.cmd('au! FileType blade  set filetype=html | set syntax=php ')

keyset('n', '<c-j>', '<C-W>j')
keyset('n', '<c-h>', '<C-W>h')
keyset('n', '<c-k>', '<C-W>k')
keyset('n', '<c-l>', '<C-W>l')
keyset('n', '<esc>', '<cmd>noh<cr>', { silent = true })

keyset('n', '>', '>>')
keyset('n', '<', '<<')

keyset('n', '<jeader>op', '<cmd>copen<cr>')
keyset('n', '<leader>co', '<cmd>cclose<cr>')

keyset('n', '<a-2>', '<cmd>bn<cr>')
keyset('n', '<a-1>', '<cmd>bp<cr>')
keyset('n', '<a-->', '<cmd>cn<cr>')
keyset('n', '<a-0>', '<cmd>cp<cr>')

keyset('n', '<leader>vi', '<cmd>e  $MYVIMRC<cr>')

keyset('n', '<leader>;', 'A;')
keyset('i', '<leader>;', '<esc>A;')

keyset({'n', 'i'}, '<c-q>', '<cmd>q<cr>')
keyset({'n', 'i'}, '<c-5>', '<cmd>qa!<cr>')
keyset({'n', 'i'}, '<c-4>', '<cmd>qa<cr>')
keyset({'n', 'i'}, '<c-3>', '<cmd>wqa!<cr>')
keyset({'n', 'i'}, '<c-2>', '<cmd>wa<cr>')
keyset({'n', 'i'}, '<c-1>', '<cmd>w<cr>')

keyset('n', '<leader>cd', '<cmd>cd %:h<cr>')

keyset('i', '<s-cr>', '<cr>', { remap = true })

keyset('n', '<leader>gl', '<cmd>Gitsigns toggle_linehl<cr>')
keyset('n', '<leader>gd ', '<cmd>Gitsigns toggle_deleted<cr>')
keyset('n', '<leader>gw', '<cmd>Gitsigns toggle_word_diff<cr>')
keyset('n', '<leader>gs', '<cmd>Gitsigns toggle_signs<cr>')

keyset('n', '<leader>ph', function() vim.bo.filetype = 'php' end )
keyset('n', '<leader>ht', function() vim.bo.filetype = 'html' end )

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
