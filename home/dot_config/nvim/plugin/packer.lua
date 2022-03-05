-- Setup VIM to automatically run packer on entry
vim.cmd [[ 
  augroup Packer
    autocmd! 
    autocmd BufWritePost packer.lua PackerCompile
    autocmd BufWritePost packer.lua PackerInstall
    autocmd BufWritePost packer.lua PackerSync
  augroup END
]]

local packer = require('packer')
local use    = packer.use

packer.startup(function()  
  -- Plugin management 
  use { 'wbthomason/packer.nvim' } 

  -- Lua utility plugins
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-lua/popup.nvim' }

  -- General text editing plugins
  use { '907th/vim-auto-save' }
  use { 'mg979/vim-visual-multi' }
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-repeat' }
  use { 'tpope/vim-commentary' }

  -- Filetype specific editing plugins
  use { 'lervag/vimtex'}
  
  -- Searching functionality
  use { 'nvim-telescope/telescope.nvim' }

  -- Advanced text editing: snippets and completitions
  use { 'neovim/nvim-lspconfig' }
  use { 'hrsh7th/nvim-cmp' }
  use { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" }
  use { "hrsh7th/cmp-buffer", after = "nvim-cmp" }
  use { "hrsh7th/cmp-omni", after = "nvim-cmp" }
  use { "hrsh7th/cmp-path", after = "nvim-cmp" }
  use { "hrsh7th/cmp-cmdline", after = "nvim-cmp" }
  use { 'SirVer/ultisnips' }
  use { 'quangnguyen30192/cmp-nvim-ultisnips', after = "nvim-cmp" }

  -- Integrated terminal functinoality
  use { 'voldikss/vim-floaterm' }

  -- File Explorer functionality
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'kyazdani42/nvim-tree.lua' }
 
  -- Leader-key combo hint functionality 
  use { 'folke/which-key.nvim' }

  -- Task management
  use { 'folke/trouble.nvim' }
  use { 'folke/todo-comments.nvim' }

  -- Apperence-specific plugins
  use { 'folke/twilight.nvim' }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'noib3/nvim-cokeline' }
  use { 'airblade/vim-gitgutter' }
  use { 'lukas-reineke/indent-blankline.nvim' }
  
  -- Tmux integration
  use { 'christoomey/vim-tmux-navigator' }

end)
