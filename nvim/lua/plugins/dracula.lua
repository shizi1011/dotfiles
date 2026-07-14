return {
	"Mofiqul/dracula.nvim", -- Replace with the specific repo name if different
	name = "dracula",
	priority = 1000, -- Make sure it loads before other plugins
	config = function()
		local dracula = require("dracula")

		dracula.setup({
			-- customize dracula color palette
			-- colors = {
			-- 	bg = "#282A36",
			-- 	fg = "#F8F8F2",
			-- 	selection = "#44475A",
			-- 	comment = "#6272A4",
			-- 	red = "#FF5555",
			-- 	orange = "#FFB86C",
			-- 	yellow = "#F1FA8C",
			-- 	green = "#50fa7b",
			-- 	purple = "#BD93F9",
			-- 	cyan = "#8BE9FD",
			-- 	pink = "#FF79C6",
			-- 	bright_red = "#FF6E6E",
			-- 	bright_green = "#69FF94",
			-- 	bright_yellow = "#FFFFA5",
			-- 	bright_blue = "#D6ACFF",
			-- 	bright_magenta = "#FF92DF",
			-- 	bright_cyan = "#A4FFFF",
			-- 	bright_white = "#FFFFFF",
			-- 	menu = "#21222C",
			-- 	visual = "#3E4452",
			-- 	gutter_fg = "#4B5263",
			-- 	nontext = "#3B4048",
			-- 	white = "#ABB2BF",
			-- 	black = "#191A21",
			-- },
			show_end_of_buffer = true,
			transparent_bg = true,
			-- dark_background = true,
			lualine_bg_color = "#44475a",
			italic_comment = true,
			overrides = {},
		})

		-- Actually apply the colorscheme
		vim.cmd("colorscheme dracula")
		-- vim.cmd([[highlight Cursor guifg=red guibg=red]])
		-- vim.opt.guicursor = "n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr:hor20"
	end,
}
--
-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {
-- 		transparent = true, -- Enable this for transparency
-- 		styles = {
-- 			sidebars = "transparent",
-- 			floats = "transparent",
-- 		},
-- 	},
-- 	-- config = function()
-- 	-- 	local tokyonight = require("tokyonight")
-- 	-- 	-- tokyonight.setup({
-- 	-- 	--
-- 	-- 	-- 	show_end_of_buffer = true,
-- 	-- 	-- 	transparent_bg = true,
-- 	-- 	-- 	lualine_bg_color = "#44475a",
-- 	-- 	-- 	italic_comment = true,
-- 	-- 	-- 	overrides = {},
-- 	-- 	-- })
-- 	-- 	vim.cmd("colorscheme tokyonight")
-- 	-- end,
-- }
