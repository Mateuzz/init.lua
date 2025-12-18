vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

require("config.lazy")

vim.g.t_vb = ''
vim.g.c_no_curly_error = true
vim.g.shell = '/bin/zsh'
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.vimspector_enable_mappings = 'HUMAN'

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
vim.o.dir = '/home/mateus/.local/share/nvim/dir'
vim.o.backupdir = '/home/mateus/.local/share/nvim/bdir'
vim.o.mouse = 'a'
vim.o.background = 'dark'
vim.opt.iskeyword:append("-")
vim.opt.tags:append("./tags")
vim.o.grepprg = 'rg --vimgrep --no-heading'
vim.o.grepformat = '%f:%l:%c:%m'
vim.o.guicursor = 'n-v-c:block-cursor/lCursor,i:block-cursor/CursorInsert'
vim.o.clipboard = 'unnamedplus'
vim.o.guifont = 'Droid Sans Mono:h11'

vim.cmd([[au! InsertEnter highlight Cursor guibg=lightgreen ]])

local keyset = vim.keymap.set

keyset('n', 'dd', 'D')
keyset('n', 'D', 'dd')
keyset('n', 'cc', 'C')
keyset('n', 'C', 'cc')
keyset('n', '<c-enter>', '<esc>o')
keyset({'n', 'v'}, '<c-c>', '"+y"')
keyset({'n'}, '<c-v>', '"+p')
keyset({'i'}, '<c-v>', '<esc>"+p')

keyset('i', 'jk', '<esc>')
keyset('t', 'jk', [[<c-\><c-n>]])
keyset('t', '<esc>', [[<c-\><c-n>]])
keyset('i', '<c-D>', 'X<esc>lbce')
keyset('i', '<c-BS>', '<C-W>')

vim.cmd('cnoreabbrev E e')
vim.cmd('filetype plugin indent on')
-- Tree sitter enabled, does not need this
-- vim.cmd('au! BufRead,BufNewFile *.php* setlocal filetype=php | setlocal syntax=php | set cindent | set indentexpr= | TSEnable indent')
-- vim.cmd('au! BufRead,BufNewFile *.php* setlocal filetype=php | setlocal syntax=html')
vim.cmd('au! FileType blade  set filetype=html | set syntax=php ')

keyset('n', '<c-j>', '<C-W>j')
keyset('n', '<c-h>', '<C-W>h')
keyset('n', '<c-k>', '<C-W>k')
keyset('n', '<c-l>', '<C-W>l')
keyset('n', '<esc>', '<cmd>noh<cr>', { silent = true })

keyset('n', '>', '>>')
keyset('n', '<', '<<')

keyset('n', '<leader>op', '<cmd>copen<cr>')
keyset('n', '<leader>co', '<cmd>cclose<cr>')

keyset('n', '<a-2>', '<cmd>bn<cr>')
keyset('n', '<a-1>', '<cmd>bp<cr>')
keyset('n', '<a-->', '<cmd>cn<cr>')
keyset('n', '<a-0>', '<cmd>cp<cr>')

keyset('n', '<leader>vi', '<cmd>e  $MYVIMRC<cr>')

keyset('n', '<c-;>', 'A;')
keyset('i', '<c-;>', '<esc>A;')

keyset({'n', 'i'}, '<c-q>', '<cmd>q<cr>')
keyset('n', '<c-5>', '<cmd>qa!<cr>')
keyset('n', '<c-4>', '<cmd>qa<cr>')
keyset('n', '<c-3>', '<cmd>wqa!<cr>')
keyset({'n', 'i'}, '<c-2>', '<cmd>wa<cr>')
keyset({'n', 'i'}, '<c-1>', '<cmd>w<cr>')

keyset('n', '<leader>cd', '<cmd>cd %:h<cr>')

keyset('i', '<s-cr>', '<cr>', { remap = true })

keyset('n', '<leader>gl', '<cmd>Gitsigns toggle_linehl<cr>')
keyset('n', '<leader>gd', '<cmd>Gitsigns toggle_deleted<cr>')
keyset('n', '<leader>gw', '<cmd>Gitsigns toggle_word_diff<cr>')
keyset('n', '<leader>gs', '<cmd>Gitsigns toggle_signs<cr>')

keyset('n', "<c-'>", '<cmd>tabedit<<cr>')

keyset('n', '<leader>php',
function()
	vim.bo.filetype = 'php'
	-- vim.bo.cindent = true
	-- vim.bo.indentexpr = ''
end )

keyset('n', '<leader>pht',
function()
	vim.bo.filetype = 'php'
	vim.bo.syntax = 'html'
	vim.bo.cindent = true
	vim.bo.indentexpr = ''
end )

keyset('n', '<leader>ht',
function() 
	vim.bo.filetype = 'html'
	vim.bo.syntax = 'html'
end )
keyset('n', '<leader>js', function() vim.bo.filetype = 'javascript' end )
