local o = vim.o          --global options
local wo = vim.wo        --window-local options
local bo = vim.bo        --buffer-local options

-- global options
o.swapfile = true
o.dir = '/tmp'
o.smartcase = true
o.laststatus = 2
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.scrolloff = 12
-- ... snip ... 

-- window-local options
wo.number = false
wo.wrap = false

-- buffer-local options
bo.expandtab = true
