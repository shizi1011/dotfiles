return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {--[[ things you want to change go here]]
	},
	keys = {
		-- Add explicit keys for specific layouts if desired
		{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Terminal (Float)" },
		{ "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Terminal (Horizontal)" },
		{ "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Terminal (Vertical)" },
	},
}
