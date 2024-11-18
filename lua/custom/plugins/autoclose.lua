-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'm4xshen/autoclose.nvim',
  config = function()
    require('autoclose').setup {
      disabled_filetypes = { 'text', 'markdown' },
    }
  end,
}
