vim.cmd 'packadd paq-nvim'


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

## fzf
local fzf = require("fzf")

coroutine.wrap(function()
  local result = fzf.fzf({"choice 1", "choice 2"}, "--ansi")
    -- result is a list of lines that fzf returns, if the user has chosen
  if result then
      print(result[1])
        end
        end)()

--------------------
-- impatient.nvim --
-- TODO: remove this once it's merged
require 'impatient'


--------------
-- PAQ-NVIM --
require 'paq-nvim' {

    'savq/paq-nvim';                  -- Let Paq manage itself
    'neovim/nvim-lspconfig';          -- Mind the semi-colons
    'hrsh7th/nvim-compe';
    'junegunn/fzf';
    'junegunn/fzf.vim';  -- to enable preview (optional)
    'ibhagwan/fzf-lua'
    'vijaymarupudi/nvim-fzf'
    'kyazdani42/nvim-web-devicons'
    'ojroques/nvim-lspfuzzy';
    'ray-x/material_plus.nvim';
    'lervag/vimtex', opt=true};      -- Use braces when passing options
    
}


require('settings')    -- lua/settings.lua
require('maps')        -- lua/maps.lua
require('statusline')  -- lua/statusline.lua
require('lspfuzzy').setup {}

---------------
-- lsp setup --
require('lsp.yaml') shits too noisy
require('lsp.lua') it's horrible
require('lsp.python')
require('lsp.go')
