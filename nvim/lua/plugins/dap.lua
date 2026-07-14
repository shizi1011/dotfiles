-- return {
-- 	"mfussenegger/nvim-dap",
-- 	lazy = true,
-- 	dependencies = {
-- 		-- Creates a beautiful debugger UI
-- 		{ "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio" } },
--
-- 		-- Installs and manages debug adapters via Mason automatically
-- 		"williamboman/mason.nvim",
-- 		"jay-babu/mason-nvim-dap.nvim",
--
-- 		-- Displays variable values inline as virtual text
-- 		"theHamsta/nvim-dap-virtual-text",
-- 	},
-- 	keys = {
-- 		{
-- 			"<leader>db",
-- 			function()
-- 				require("dap").toggle_breakpoint()
-- 			end,
-- 			desc = "Toggle Breakpoint",
-- 		},
-- 		{
-- 			"<leader>dc",
-- 			function()
-- 				require("dap").continue()
-- 			end,
-- 			desc = "Continue / Start Debugger",
-- 		},
-- 		{
-- 			"<leader>di",
-- 			function()
-- 				require("dap").step_into()
-- 			end,
-- 			desc = "Step Into",
-- 		},
-- 		{
-- 			"<leader>do",
-- 			function()
-- 				require("dap").step_over()
-- 			end,
-- 			desc = "Step Over",
-- 		},
-- 		{
-- 			"<leader>dO",
-- 			function()
-- 				require("dap").step_out()
-- 			end,
-- 			desc = "Step Out",
-- 		},
-- 		{
-- 			"<leader>dt",
-- 			function()
-- 				require("dap").terminate()
-- 			end,
-- 			desc = "Terminate Session",
-- 		},
-- 		{
-- 			"<leader>du",
-- 			function()
-- 				require("dapui").toggle()
-- 			end,
-- 			desc = "Toggle Debugger UI",
-- 		},
-- 	},
-- 	config = function()
-- 		local dap = require("dap")
-- 		local dapui = require("dapui")
--
-- 		-- Setup extensions
-- 		dapui.setup()
-- 		require("nvim-dap-virtual-text").setup({})
--
-- 		-- Automatically open/close DAP UI panels during debug sessions
-- 		dap.listeners.before.attach.dapui_config = function()
-- 			dapui.open()
-- 		end
-- 		dap.listeners.before.launch.dapui_config = function()
-- 			dapui.open()
-- 		end
-- 		dap.listeners.before.event_terminated.dapui_config = function()
-- 			dapui.close()
-- 		end
-- 		dap.listeners.before.event_exited.dapui_config = function()
-- 			dapui.close()
-- 		end
--
-- 		-- Configure Mason-managed debug adapters
-- 		require("mason-nvim-dap").setup({
-- 			-- Add language adapters you want auto-installed here (e.g., 'python', 'delve', 'js')
-- 			ensure_installed = { "python", "c", "cpp" },
-- 			automatic_installation = true,
-- 			handlers = {},
-- 		})
-- 	end,
-- }
--
--
--
--
return {
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup()

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end

			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end

			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end

			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},

	{
		"nvim-neotest/nvim-nio",
	},

	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
		},
	},

	{
		"mfussenegger/nvim-dap",
		keys = {
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
			},
			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
				desc = "Continue / Start Debugger",
			},
			{
				"<leader>di",
				function()
					require("dap").step_into()
				end,
				desc = "Step Into",
			},
			{
				"<leader>do",
				function()
					require("dap").step_over()
				end,
				desc = "Step Over",
			},
			{
				"<leader>dO",
				function()
					require("dap").step_out()
				end,
				desc = "Step Out",
			},
			{
				"<leader>dt",
				function()
					require("dap").terminate()
				end,
				desc = "Terminate Session",
			},
			{
				"<leader>du",
				function()
					require("dapui").toggle()
				end,
				desc = "Toggle Debugger UI",
			},
		},
		config = function()
			local dap = require("dap")

			dap.configurations.cpp = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopAtEntry = true,
					setupCommands = {
						{
							text = "-enable-pretty-printing",
							description = "Enable pretty printing",
							ignoreFailures = false,
						},
					},
				},

				{
					name = "Launch Current File",
					type = "codelldb",
					request = "launch",
					program = function()
						local executable = vim.fn.expand("%:p:r")

						if vim.fn.filereadable(executable) == 1 then
							return executable
						else
							vim.notify("Executable not found: " .. executable, vim.log.levels.ERROR)
							return nil
						end
					end,
					cwd = "${workspaceFolder}",
					stopAtEntry = true,
					setupCommands = {
						{
							text = "-enable-pretty-printing",
							description = "Enable pretty printing",
							ignoreFailures = false,
						},
					},
				},
			}

			dap.configurations.c = dap.configurations.cpp
		end,
	},
}
