return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        sync_install = false,
        ensure_installed = { 'javascript', 'html', 'css', 'scss', 'json', 'lua', 'yaml', 'jsonc'},
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
