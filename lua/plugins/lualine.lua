return { -- Bubbles config for lualine
	-- Author: lokesh-krishna
	-- MIT license, see LICENSE for more details.
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = { theme = "github_dark_dimmed" },
		})
	end,
}
