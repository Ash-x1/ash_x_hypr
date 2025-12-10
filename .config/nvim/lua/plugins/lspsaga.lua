return {
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("lspsaga").setup({

			ui = {
				border = "rounded",
				code_action = "💡",
			},
			symbol_in_winbar = {
				enable = false,
			},
			lightbulb = {
				enable = true,
				sign = true,
				virtual_text = false,
			},
			outline = {
				win_position = "right",
			},
		})
	end,
}
