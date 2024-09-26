return {
  'AlexvZyl/nordic.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require 'nordic'.load()
    vim.api.nvim_set_hl(0, 'LineNr', { fg = '#bbc3d4' })
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#60728a' })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#60728a' })
    vim.api.nvim_set_hl(0, 'NeoTreeGitUntracked', { fg = '#c5727a' })
    vim.api.nvim_set_hl(0, 'NeoTreeRootName', { fg = '#81a1c1' })
    vim.api.nvim_set_hl(0, 'NeoTreeTitleBar', { fg = '#d79784' })
  end,

}
