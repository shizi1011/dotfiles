return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		view_options = { show_hidden = true },
	},

	-- Optional dependencies
	dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	lazy = false,
	config = function()
		require("oil").setup({
			-- Syncs oil's floating window size and border with your fzf-lua config
			float = {

				win_options = { winblend = 100, winhighlight = "NormalFloat:Normal,FloatBorder:Normal" },
			},
		})
		require("transparent").setup({
			extra_groups = {
				"NormalFloat",
				"FloatBorder",
			},
		})
	end,
	-- config = function()
	-- 	require("oil").setup({
	-- 		float = {
	-- 			win_options = {
	-- 				winblend = 0, -- Set to 0 so the terminal/editor's own transparency shines through
	-- 			},
	-- 		},
	-- 	})
	--
	-- 	-- Force the oil floating window background to be transparent
	-- 	vim.api.nvim_create_autocmd("FileType", {
	-- 		pattern = "oil",
	-- 		callback = function()
	-- 			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE", blend = 0 })
	-- 			vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE", blend = 0 })
	-- 		end,
	-- 	})
	-- end,
}
