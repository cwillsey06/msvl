--2024.04.19 @ 00:51
local e24bpc     = true
local background = 'dark'
local schemes    = { 'gruvbox', 'shine', 'quiet', 'slate', 'habamax' }
local scheme_1   = schemes[1]

local cmd = vim.cmd

function set(key, value)
	vim.opt[key] = value 
end
function map(mode, map, func, desc)
	vim.keymap.set(mode, map, func, { silent = true, desc = desc })
end
function scheme(key)
	cmd ('colorscheme '..key)
end

set ('background',  background)
scheme (scheme_1)

if os.getenv('TERM_PROGRAM') ~= 'Apple_Terminal' then
	set ('termguicolors',  e24bpc)
end

--# scheme cycling
local last_scheme_index = 1
function cycle_scheme()
	last_scheme_index = (last_scheme_index + 1) % #schemes
	last_scheme_index = last_scheme_index ~=  0 and last_scheme_index or 3
	scheme (schemes[last_scheme_index])
	print(last_scheme_index, vim.g.colors_name)
end
function swap_scheme()
	local this_scheme = vim.g.colors_name or 'default'
	scheme (this_scheme == 'default' and schemes[last_scheme_index] or 'default')
	print (vim.g.colors_name)
end
function set_scheme_index(i)
	if i>#schemes then return '<nop>' end
	return function()
		scheme (schemes[i])
		print (tostring(i), vim.g.colors_name)
	end
end

map ('n',  '<leader>td',  swap_scheme,  'swap last & default schemes')
map ('n',  '<leader>tc',  cycle_scheme,    'cycle predefined schemes')

for i = 1, 10 do
	local is = tostring(i)
	map ('n',  '<leader>t'..is,  set_scheme_index(i),  'scheme index '..is)
end

