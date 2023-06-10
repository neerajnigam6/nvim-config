local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  -- colorbuddy allows colorscheme in lua
  use 'tjdevries/colorbuddy.vim'
  -- gloombuddy is colorscheme
  use 'bkegley/gloombuddy'

  -- notify is notification plugin
  use 'rcarriga/nvim-notify'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }  
  -- this is for comments
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  -- tabline setup 
  use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status

  use 'romgrk/barbar.nvim'

  -- beacon highlits cursor jump
  use 'danilamihailov/beacon.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
-- or                              , branch = '0.1.1',
      dependencies = { 'nvim-lua/plenary.nvim' }
  }
  -- lsp and autocompletion setup
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
 
  --toggleterm setup
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}
  -- terminal setup
  -- use({
  --   'rebelot/terminal.nvim',
  --   config = function()
  --       require("terminal").setup()
  --   end
  -- })
  --
  -- telescope settings
  -- use {
  --     "nvim-telescope/telescope-file-browser.nvim",
  --     requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  -- }
  use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
  use 'nvim-tree/nvim-tree.lua'  
  if packer_bootstrap then
    require('packer').sync()
  end

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
      end,
  }
-- vim.keymap.set("n", "<leader>tf", term_map.move({ open_cmd = "float" }))
-- vim.keymap.set("n", "<leader>tf", term_map.move({ open_cmd = "float" }))
-- vim.keymap.set("n", "<leader>tf", term_map.move({ open_cmd = "float" }))
end)
