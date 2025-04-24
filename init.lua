-- Sources:
-- Init VIM fil: https://github.com/NeuralNine/config-files/blob/fe08d1d6f44b28a0ddbf4abe9d0b9d3057f59bbe/.config/nvim/old/init.vim#L4
-- Youtube video: https://www.youtube.com/watch?v=JWReY93Vl6g
-- VIM plug: https://github.com/junegunn/vim-plug/tree/master

local vim = vim
local Plug = vim.fn['plug#']

-- Standard vim commands translated into Lua script

vim.opt.number = true -- Enable line numbers
-- vim.opt.relativenumber = true -- Shows relative line numbers to current cursor
vim.opt.autoindent = true -- Pressing enter will autoindent new line equal to current indentation level

vim.opt.tabstop = 4 -- Pressing tab equal 4 spaces (default 8)
vim.opt.shiftwidth = 4 -- Defines number of spaces used when indenting with > or < command. Also used when autoindent is enabled
vim.opt.smarttab = true -- Modifies how tab indentation works at start of line
vim.opt.mouse = "a" -- Enables mouse support in all VIM modes
vim.opt.cursorline = true -- Highlights currently selected cursor line
vim.opt.encoding = "UTF-8"


-- Neovim plugins.
-- Execute :PlugInstall to update
-- Execute :PlugClean to remove plugins not used anymore
-- Plugin example: Plug('https://github.com/junegunn/vim-easy-align.git')

vim.call("plug#begin", "~/.config/nvim/plugged")

Plug('https://github.com/vim-airline/vim-airline') -- Status bar [https://github.com/vim-airline/vim-airline]
Plug('https://github.com/vim-airline/vim-airline-themes') -- Color themes for status bar [https://github.com/vim-airline/vim-airline-themes]
Plug('https://github.com/preservim/nerdtree') -- File navigation tree on left [https://github.com/preservim/nerdtree]
Plug('https://github.com/tpope/vim-surround') -- VIM surround functionality [https://github.com/tpope/vim-surround]
Plug('https://github.com/tpope/vim-commentary') -- Comment out selection using gc & gcc [https://github.com/tpope/vim-commentary]
Plug('https://github.com/ryanoasis/vim-devicons') -- Developer icons for NerdTree [https://github.com/ryanoasis/vim-devicons]
Plug('https://github.com/tc50cal/vim-terminal') -- Run terminal commands inside him :Terminal bash [https://github.com/tc50cal/vim-terminal]
Plug('https://github.com/terryma/vim-multiple-cursors') -- Multiple cursors in visual mode [https://github.com/terryma/vim-multiple-cursors]
Plug('https://github.com/rafi/awesome-vim-colorschemes') -- Collection of colorschemes [https://github.com/rafi/awesome-vim-colorschemes]

-- These require some extra setup
Plug('https://github.com/preservim/tagbar') -- Opens up tags (class/vars/funcs) in a separate menu. Requires (apt install exuberant-ctags) [https://github.com/preservim/tagbar]
Plug('https://github.com/neoclide/coc.nvim')

vim.call("plug#end")


-- Keybind remapping

vim.keymap.set("n", "<C-f>", ":NERDTreeFocus<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-t>", ":NERDTreeToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<F8>", ":TagbarToggle<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<F3>", ":noh<CR>", { noremap = true, silent = true })

-- Space and Enter autocomplete the first suggestion when autocomplete menu is open
vim.api.nvim_set_keymap("i", "<Tab>", "coc#pum#visible() ? coc#pum#confirm() : '<Tab>'", { expr = true, noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<cr>", "coc#pum#visible() ? coc#pum#confirm() : '<cr>'", { expr = true, noremap = true, silent = true })

-- CTRL+J go down in autocomplete menu by single step
vim.api.nvim_set_keymap('i', '<C-j>', 'coc#pum#visible() ? coc#pum#next(1) : "\\<C-j>"', { noremap = true, silent = true, expr = true })

-- CTRL+Space refreshes autocomplete
vim.api.nvim_set_keymap('i', '<C-space>', 'coc#pum#visible() ? coc#pum#next(1) : coc#refresh()', { noremap = true, silent = true, expr = true })

-- pressing gh over a symbol definition brings up its params
vim.keymap.set('n', 'gh', '<cmd>call CocAction("doHover")<CR>', { silent = true, noremap = true })

-- Unmap middle mouse click
vim.api.nvim_set_keymap("n", "<MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<2-MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<2-MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<3-MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<3-MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<4-MiddleMouse>", "<Nop>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<4-MiddleMouse>", "<Nop>", { noremap = true, silent = true })

-- Put colorschemes at end to avoid errors
vim.o.background = "dark" -- or "light" for light mode
vim.cmd("colorscheme gruvbox")

-- Additional settings
vim.opt.completeopt:remove("preview")
