-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'sheerun/vim-polyglot'
  use 'preservim/nerdtree'

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use 'tmsvg/pear-tree'
  use 'dense-analysis/ale'

  use 'prettier/vim-prettier'

  use 'nathanaelkane/vim-indent-guides'
end)
