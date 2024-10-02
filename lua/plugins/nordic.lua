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
    vim.api.nvim_set_hl(0, 'NeoTreeRootName', { fg = '#bbc3d4', bold = true })
    vim.api.nvim_set_hl(0, 'NeoTreeTitleBar', { fg = '#191d24', bg = '#88c0d0', bold = true })
    vim.api.nvim_set_hl(0, 'NeoTreeFloatBorder', { fg = '#88c0d0', bg = "#242933" })
  end,
}
