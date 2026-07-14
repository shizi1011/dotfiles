return {
	"stevearc/aerial.nvim",
	opts = {},
	-- Optional dependencies
	config = function()
		require("aerial").setup({
			-- optionally use on_attach to set keymaps when aerial has attached to a buffer
			backends = { "treesitter", "lsp" },
			on_attach = function(bufnr)
				-- Jump forwards/backwards with '{' and '}'
				vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
				vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
			end,
		})
		-- You probably also want to set a keymap to toggle aerial
		vim.keymap.set("n", "<leader>at", "<cmd>AerialToggle!<CR>")
		vim.keymap.set("n", "<leader>as", function()
			require("aerial").fzf_lua_picker({
				-- profile = "ivy", -- Uses fzf-lua's bottom split layout
			})
		end, { desc = "Fuzzy-find aerial symbols (Ivy)" })
	end,
}
