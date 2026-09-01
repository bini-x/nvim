return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    local colors = {
      bg = "#141415",
      bg_alt = "#1c1c1e",
      bg_dark = "#101012",

      fg = "#cdcdcd",
      muted = "#7e7e7e",
      grey = "#505050",

      blue = "#7e9cd8",
      green = "#8fb573",
      red = "#d2788a",
      purple = "#aaa0d8",
      yellow = "#d0a215",
    }

    local vague_theme = {
      normal = {
        a = { fg = colors.bg_dark, bg = colors.blue, gui = "bold" },
        b = { fg = colors.muted, bg = colors.bg_alt },
        c = { fg = colors.muted, bg = colors.bg },
      },

      insert = {
        a = { fg = colors.bg_dark, bg = colors.green, gui = "bold" },
        b = { fg = colors.muted, bg = colors.bg_alt },
        c = { fg = colors.muted, bg = colors.bg },
      },

      visual = {
        a = { fg = colors.bg_dark, bg = colors.purple, gui = "bold" },
        b = { fg = colors.muted, bg = colors.bg_alt },
        c = { fg = colors.muted, bg = colors.bg },
      },

      replace = {
        a = { fg = colors.bg_dark, bg = colors.red, gui = "bold" },
        b = { fg = colors.muted, bg = colors.bg_alt },
        c = { fg = colors.muted, bg = colors.bg },
      },

      command = {
        a = { fg = colors.bg_dark, bg = colors.yellow, gui = "bold" },
        b = { fg = colors.muted, bg = colors.bg_alt },
        c = { fg = colors.muted, bg = colors.bg },
      },

      inactive = {
        a = { fg = colors.muted, bg = colors.bg },
        b = { fg = colors.muted, bg = colors.bg },
        c = { fg = colors.muted, bg = colors.bg },
      },
    }

    -- Make the statusline blend into the Vague background.
    vim.api.nvim_create_autocmd({ "UiEnter", "ColorScheme" }, {
      callback = function()
        local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
        local statusline = vim.api.nvim_get_hl(0, { name = "StatusLine" })

        vim.api.nvim_set_hl(
          0,
          "StatusLine",
          vim.tbl_extend("force", statusline, {
            bg = normal.bg,
          })
        )
      end,
    })

    require("lualine").setup({
      options = {
        theme = vague_theme,

        component_separators = "",
        section_separators = {
          left = "",
          right = "",
        },

        globalstatus = true,
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
      },

      sections = {
        lualine_a = {
          {
            "mode",
            separator = { left = "" },
            right_padding = 2,
          },
        },

        lualine_b = {
          {
            "filename",
            color = { fg = colors.fg },
          },
          {
            "branch",
            color = { fg = colors.muted },
          },
          {
            "diff",
            color = { fg = colors.muted },
          },
        },

        lualine_c = {
          "%=",
        },

        lualine_x = {},

        lualine_y = {
          {
            "filetype",
            color = { fg = colors.muted },
          },
          {
            "progress",
            color = { fg = colors.muted },
          },
        },

        lualine_z = {
          {
            "location",
            separator = { right = "" },
            left_padding = 0,
            color = { fg = colors.muted },
          },
        },
      },

      inactive_sections = {
        lualine_a = {
          {
            "filename",
            color = { fg = colors.muted },
          },
        },

        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},

        lualine_z = {
          {
            "location",
            color = { fg = colors.muted },
          },
        },
      },

      tabline = {},
      extensions = {},
    })
  end,
}
