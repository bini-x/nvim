return {
  'AlexvZyl/nordic.nvim/',
  lazy = false,
  priority = 1000,
  config = function()
    require 'nordic'.load()
    vim.api.nvim_set_hl(0, 'LineNr', { fg = '#bbc3d4' })
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#60728a' })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#60728a' })
    vim.api.nvim_set_hl(0, 'NeoTreeGitUntracked', { fg = '#d08770' })
    vim.api.nvim_set_hl(0, 'NeoTreeRootName', { fg = '#e5e9f0' })
    vim.api.nvim_set_hl(0, 'NeoTreeTitleBar', { fg = '#3b4252', bg = '#eceff4'})
    vim.api.nvim_set_hl(0, 'NeoTreeFloatBorder', { fg = '#eceff4'})
  end,

}
