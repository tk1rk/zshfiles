--         ___           ___
--        /\  \         /\__\
--       |::\  \       /:/  /
--       |:|:\  \     /:/  /
--     __|:|\:\  \   /:/  /  ___
--    /::::|_\:\__\ /:/__/  /\__\
--    \:\~~\  \/__/ \:\  \ /:/  /
--     \:\  \        \:\  /:/  /
--      \:\  \        \:\/:/  /
--       \:\__\        \::/  /
--        \/__/         \/__/
--
-- Colorscheme name:        material.nvim
-- Description:             Colorscheme for NeoVim based on the material pallete
-- Author:                  Marko Cerovac <marko.cerovac16@gmail.com>
-- Website:                 https://github.com/marko-cerovac/material.nvim
local util = require('material.util')
local theme = require('material.theme')


-- Load the theme
local set = function(theme)
  util.load(theme)
  vim.cmd([[command! -nargs=* Material  lua require('material.functions').change(<f-args>)]])
end

return {set = set}
