--2023.12.19 @ 23:36
local indent	= 3
local e24bpc	= true
local schemes	= { 'habamax', 'slate', 'quiet', 'shine' }
local scheme_1	= schemes[1]
local leader	= ';'

--#cmd
local cmd = vim.cmd

cmd 'filetype plugin indent on'
pcall(function()
	cmd 'aunmenu PopUp.How-to\\ disable\\ mouse'
	cmd 'aunmenu PopUp.-1-'
end)

--#opt
function set(key, value) vim.opt[key] = value end
function set_scheme(k) cmd ('colorscheme '..k) end
set_scheme (scheme_1)

if os.getenv('TERM_PROGRAM') ~= 'Apple_Terminal' then
	set ('termguicolors', e24bpc)
end

set ('showcmd',			true)
set ('signcolumn',		'yes')
set ('splitbelow',		true)

set ('encoding',			'utf-8')
--set ('syntax',			'enable')
set ('matchpairs',		{'\':\'', '\":\"', '(:)', '{:}', '[:]', '<:>'})

set ('ttyfast',			true)
set ('updatetime',		300)
set ('ttimeout',			true)
set ('ttimeoutlen',		50)

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

local last_scheme_index = 1
function cycle_scheme()
	last_scheme_index = (last_scheme_index + 1) % #schemes
	last_scheme_index = last_scheme_index ~=  0 and last_scheme_index or 3
	set_scheme (schemes[last_scheme_index])
	print(last_scheme_index, vim.g.colors_name)
end
function swap_scheme()
	local this_scheme = vim.g.colors_name or 'default'
	set_scheme (this_scheme == 'default' and schemes[last_scheme_index] or 'default')
	print (vim.g.colors_name)
end
function set_scheme_index(i)
	if i>#schemes then return '<nop>' end
	return function()
		set_scheme (schemes[i])
		print (tostring(i), vim.g.colors_name)
	end
end

map ('n',	'<leader>td',	swap_scheme,				'swap last & default schemes')
map ('n',	'<leader>tc',	cycle_scheme,				'cycle predefined schemes')

for i = 1, 10 do
	local is = tostring(i)
	map ('n',	'<leader>t'..is,	set_scheme_index(i),	'scheme index '..is)
end

