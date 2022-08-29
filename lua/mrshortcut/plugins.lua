local status, packer = pcall(require, 'packer')

if not status then
  vim.cmd('colorscheme slate')
  return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
  use('wbthomason/packer.nvim')
  use('maxmx03/solarized.nvim')
  use('nvim-lualine/lualine.nvim') -- Statusline
  use('nvim-lua/plenary.nvim') -- Common utilities
  use('onsails/lspkind-nvim') -- vscode-like pictograms
  use({
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
      'onsails/lspkind-nvim',
    }
  })
  use('neovim/nvim-lspconfig') -- LSP
  use('folke/lua-dev.nvim')
  use('jose-elias-alvarez/null-ls.nvim') -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use('MunifTanjim/prettier.nvim') -- Prettier plugin for Neovim's built-in LSP client
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')

  use('glepnir/lspsaga.nvim') -- LSP UIs
  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  })
  use('kyazdani42/nvim-web-devicons') -- File icons
  use('nvim-telescope/telescope.nvim')
  use('nvim-telescope/telescope-file-browser.nvim')
  use('windwp/nvim-autopairs')
  use('windwp/nvim-ts-autotag')
  use('norcalli/nvim-colorizer.lua')
  use('folke/zen-mode.nvim')

  use('akinsho/nvim-bufferline.lua')
  -- use 'github/copilot.vim'

  use('lewis6991/gitsigns.nvim')
  use('dinhhuy258/git.nvim') -- For git blame & browse

  use({
    'iamcco/markdown-preview.nvim',
    run = function()
      vim.fn['mkdp#util#install']()
    end,
  })

  if packer_bootstrap then
    packer.sync()
  end
end)

vim.api.nvim_exec(
  [[
  augroup packer_ide_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]] ,
  false
)
