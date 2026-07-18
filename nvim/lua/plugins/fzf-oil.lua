return {
	"ingur/fzf-oil.nvim",
	dependencies = {
		"ibhagwan/fzf-lua",
		"stevearc/oil.nvim",
	},
	config = function()
		require("oil").setup({
			float = require("fzf-oil").float,
			preview_win = require("fzf-oil").preview_win,
		})

		local browser = require("fzf-oil").setup({

			start_mode = "oil",
		})

		-- vim.keymap.set("n", "<leader>fb", browser.browse, { desc = "File browser" })
		vim.keymap.set("n", "-", browser.browse, { desc = "File browser" })
	end,
}
