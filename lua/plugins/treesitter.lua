return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				auto_install = true,
				highlight = {
					enable = true,
					disable = {},
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true, disable = {} },
				ensure_installed = {
					"bash",
					"c",
					"cpp",
					"css",
					"dockerfile",
					"go",
					"html",
					"javascript",
					"json",
					"lua",
					"python",
					"rust",
					"scss",
					"typescript",
					"tsx",
					"yaml",
				},
				autotag = { enable = true },
			})
		end,
	},
}
