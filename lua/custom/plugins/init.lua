-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
vim.g.VM_maps = {
  -- ['Find Under'] = '<C-d>',
  -- ['Find Subword Under'] = '<C-d>',
  ['Select Cursor Down'] = '<M-C-j>',
  ['Select Cursor Up'] = '<M-C-k>',
}

return {
    "mg979/vim-visual-multi",
    branch = "master",
}
