--[[ init.lua ]]

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = ' '
vim.g.localleader = "\\"

-- IMPORTS
-- require('vars')          -- Variables
require('opts')             -- Options
require('keys')             -- Keymaps
require('plugin')           -- Plugins
require('tele')             -- Telescope setup
require('setup')            -- one line setups
require('cmp_setup')        -- cmp autocompletion    
require('toggletermsetup')  -- t
require('treesittersetup')
require('treesetup')
-- activation

