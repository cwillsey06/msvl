--2024.04.19 @ 00:10
--# init
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


--# load
require('lazy').setup(
	--## plugins
	{
		{
			'nvim-lualine/lualine.nvim',
			dependencies = {
				'nvim-tree/nvim-web-devicons'
			}
		},

		{
			'hrsh7th/nvim-cmp',
			event = 'InsertEnter',
			dependencies = {
				'hrsh7th/cmp-nvim-lsp',
				'hrsh7th/cmp-buffer'
			 }
		},
		
		{
			'folke/neoconf.nvim',
			cmd = 'Neoconf'
		},
		'folke/neodev.nvim',
		--### colorscheme
		{ 'morhetz/gruvbox' },
		{ 'tiagovla/scope.nvim' },
		{ 'nvim-treesitter/nvim-treesitter' }
	},
	--## opts
	{ show = false }
)

--# gruvbox
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_invert_selection = 0
vim.g.gruvbox_invert_tabline = 1

vim.g.gruvbox_italicize_comments = true
vim.g.gruvbox_underline = 1
vim.g.gruvbox_undercurl = 1
vim.g.gruvbox_italic = 1
vim.g.gruvbox_bold = 1

