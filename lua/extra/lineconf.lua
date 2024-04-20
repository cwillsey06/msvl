--2024.04.19 @ 01:17
local colors = {
  black        = '#282828',
  white        = '#ebdbb2',
  red          = '#fb4934',
  yellow       = '#fe8019',
  green        = '#b8bb26',
  blue         = '#83a598',
  gray         = '#a89984',
  darkgray     = '#3c3836',
  lightgray    = '#504945',
  inactivegray = '#7c6f64',
}
local colors = {
	red       = '#cc241d',
	orange    = '#d65d0e',
	yellow    = '#d79921',
	green     = '#98971a',
	cyan      = '#689d6a',
	blue      = '#458588',
	magenta   = '#b16286',
	white     = '#ebdbb2',
	black     = '#282828',
	bg        = '#1d2021'
}

--# scope
local scope_config = {

}

--# lualine
local lualine_config = {
	options = {
		theme = 'gruvbox',
		component_separators = '',
		section_separators = ''
	},
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {}
  }
}

function add_left(component)
	table.insert(lualine_config.sections.lualine_c, component)
end
function add_right(component)
	table.insert(lualine_config.sections.lualine_c, component)
end

function brand() return '' end
function box() return ' ' end

--## components
add_left({
	box,
	padding = { left = 0, right = 1 },
	color = {bg = colors.blue, fg = colors.blue}
})
add_left({ brand,  })

--# init
require('scope').setup(scope_config)
require('lualine').setup(lualine_config)

