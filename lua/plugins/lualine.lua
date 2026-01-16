return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local colors = {
      blue = "#539bf5",
      cyan = "#76E3EA",
      black = "#22272e",
      white = "adbac7",
      red = "#A05350",
      violet = "#DCBDFB",
      grey = "#303030",
      green = "#8DDB8C",
    }

    local bubbles_theme = {
      normal = {
        a = { fg = colors.black, bg = colors.blue },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.white, bg = colors.black },
      },

      insert = { a = { fg = colors.black, bg = colors.green } },
      visual = { a = { fg = colors.black, bg = colors.cyan } },
      replace = { a = { fg = colors.black, bg = colors.red } },
      command = { a = { fg = colors.black, bg = colors.violet } },

      inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.white, bg = colors.black },
      },
    }

    vim.api.nvim_create_autocmd({ "UiEnter", "ColorScheme" }, {
      callback = function()
        local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
        local statusline = vim.api.nvim_get_hl(0, { name = "StatusLine" })
        -- Create a new table for the updated highlight group
        local updated_statusline = vim.tbl_extend("force", statusline, { bg = normal.bg })
        vim.api.nvim_set_hl(0, "StatusLine", updated_statusline)
      end,
    })

    require("lualine").setup({
      options = {
        theme = bubbles_theme,
        component_separators = "",
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
        lualine_b = { "filename", "branch", "diff" },
        lualine_c = {
          "%=",
          --[[ add your center components here in place of this comment ]]
        },
        lualine_x = {},
        lualine_y = { "filetype", "progress" },
        lualine_z = {
          { "location", separator = { right = "" }, left_padding = 0 },
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = { "" },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
      tabline = {},
      extensions = {},
    })
  end,
}
