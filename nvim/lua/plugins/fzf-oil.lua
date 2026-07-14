return {
	"ingur/fzf-oil.nvim",
	dependencies = {
		"ibhagwan/fzf-lua",
		"stevearc/oil.nvim",
	},
	config = function()
		require("oil").setup({
			float = require("fzf-oil").float,
		})

		local browser = require("fzf-oil").setup()

		vim.keymap.set("n", "<leader>fb", browser.browse, { desc = "File browser" })
	end,
}
