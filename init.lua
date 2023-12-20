--2023.12.19 @ 23:36
local indent	= 3
local e24bpc	= true
local scheme	= 'habamax'
local leader	= 'space'

--#cmd
local cmd = vim.cmd
cmd ('colorscheme '..scheme)
cmd 'filetype plugin indent on'
cmd 'aunmenu PopUp.How-to\\ disable\\ mouse'
cmd 'aunmenu PopUp.-1-'

--#opt
function set(key, value) vim.opt[key] = value end
if os.getenv('TERM_PROGRAM') ~= 'Apple_Terminal' then
	set ('termguicolors', e24bpc)
end

set ('showcmd',			true)
set ('signcolumn',		'yes')
set ('splitbelow',		true)

set ('encoding',			'utf-8')
set ('syntax',				'enable')
set ('matchpairs',		{'\':\'', '\":\"', '(:)', '{:}', '[:]', '<:>'})

set ('ttyfast',			true)
set ('updatetime',		300)
set ('ttimeout',			true)
set ('timeoutlen',		10)

set ('incsearch',			true)
set ('hlsearch',			true)

set ('mouse',				'a')
set ('number',				true)
set ('rnu',					true)

set ('tabstop',			indent)
set ('softtabstop',		indent)
set ('shiftwidth',		indent)
set ('autoindent',		true)
set ('smartindent',		true)
set ('expandtab',			false)
set ('backspace',			{ 'indent', 'eol', 'start' })

--#keymap
function map(mode, map, func, desc)
	vim.keymap.set(mode, map, func, { silent = true, desc = desc })
end
vim.g.mapleader = leader
vim.g.maplocalleader = leader
map ({'n','v'}, leader, '<nop>')

--nav
map ('n',	'<C-k>',		'<C-w><C-k>',					'nav north')
map ('n',	'<C-j>',		'<C-w><C-j>',					'nav south')
map ('n',	'<C-l>',		'<C-w><C-l>',					'nav east')
map ('n',	'<C-h>',		'<C-w><C-h>',					'nav west')

--buffers
map ('n',	'<S-l>',		':bnext<CR>',					'next buf')
map ('n',	'<S-h>',		':bprevious<CR>',				'prev buf')

--tabs
map ('n',	'<C-S-l>',	':tabnext<CR>',				'next tab')
map ('n',	'<C-S-h>',	':tabprevious<CR>',			'prev tab')

--resize
map ('n',	'<A-k>',		':resize u2<CR>',				'resize north')
map ('n',	'<A-j>',		':resize +2<CR>',				'resize south')
map ('n',	'<A-h>',		':vertical resize -2<CR>',	'resize east')
map ('n',	'<A-l>',		':vertical resize +2<CR>',	'resize west')

--file
map ('n',	'<leader>fw',	':w<CR>',					'w')
map ('n',	'<leader>fa',	':wa<CR>',					'wa')
map ('n',	'<leader>qq',	':q<CR>',					'q')
map ('n',	'<leader>qa',	':qa!<CR>',					'qa')
map ('n',	'<leader>dw',	':close<CR>',				'close')

--misc
map ('n',	'<leader>h',	':nohl<CR>',				'reset hl')

