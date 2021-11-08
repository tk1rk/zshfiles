require('settings')    -- lua/settings.lua
require('maps')        -- lua/maps.lua
require('statusline')  -- lua/statusline.lua


-- THEME --
local cmd = vim.cmd
vim.cmd(':colorscheme material_dracula')


----------------------
-- Install paq-nvim --
local fn = vim.fn
----------------------
local install_path = fn.stdpath('data') .. '/site/pack/paqs/start/paq-nvim'
----------------------
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth=1', 'https://github.com/savq/paq-nvim.git', install_path})
end


--------------
-- PAQ-NVIM --
require "paq-nvim" {
    "savq/paq-nvim";                  -- Let Paq manage itself
    "neovim/nvim-lspconfig";          -- Mind the semi-colons
    "hrsh7th/nvim-compe";
    'junegunn/fzf';
    'junegunn/fzf.vim';  -- to enable preview (optional)
    'ojroques/nvim-lspfuzzy';
    'ray-x/material_plus.nvim';
    "lervag/vimtex", opt=true};      -- Use braces when passing options
}


