---------------------------------------------------------------------------------------------------
--     _  __       _   ___         _      _ __    __         
--    / |/ /__ ___| | / (_)_ _    (_)__  (_) /_  / /_ _____ _
--   /    / -_) _ \ |/ / /  ' \  / / _ \/ / __/ / / // / _ `/
--  /_/|_/\__/\___/___/_/_/_/_/ /_/_//_/_/\__(_)_/\_,_/\_,_/ 
--
-- This is an init.lua file aimed at those who will use NeoVim for academic text editing (in LaTeX)
-- and coding for data science / numerical computing purposes (Python, C/C++, Julia etc). The goal
-- is to keep this as easy to read and as modular as possible.
---------------------------------------------------------------------------------------------------

-- Basic keymappings
vim.g.mapleader = " "
vim.g.localmapleader = ","
local utils = require('utils')

-- Navigation for windows 
keymap({'n', 'v'}, '<C-h>', '<C-w>h')
keymap({'n', 'v'}, '<C-j>', '<C-w>j')
keymap({'n', 'v'}, '<C-k>', '<C-w>k')
keymap({'n', 'v'}, '<C-l>', '<C-w>l')

-- Mappings for dealing with terminal
keymap({'t'}, '<Esc>', '<C-\\><C-n>')


-- Options
-- This section just sets general options for vim. These are pretty minimal so they are included
-- here for reference rather than in a plugin directory. 
-- 
-- For references, setting vim options using NeoVim/Lua syntax is:
--      vim.o           = :set 
--      vim.go          = :setglobal
--      vim.bo          = :setlocal (for buffer options)
--      vim.wo          = :setlocal (for window options)
--      vim.g           = manipulate global variables
--      vim.b           = manipulate buffer variables
--      vim.t           = manipulate tabpage variables
--      vim.v           = manipulate predfined vim variables
--      vim.env         = manipulate environment variables

-- Basic options for viewing
vim.o.number=true
vim.o.relativenumber=true
vim.o.signcolumn='yes'
vim.cmd [[
  autocmd InsertLeave,WinEnter * set cursorline
  autocmd InsertEnter,WinLeave * set nocursorline
]] -- show cursor line only in active window
vim.o.colorcolumn='120'
vim.g.indent_blankline_char = '┊'
vim.o.numberwidth=4

-- Basic options for editing
vim.o.mouse='a'
vim.o.updatetime=100
vim.o.clipboard="unnamedplus"
vim.o.swapfile=false
vim.o.writebackup=false
vim.o.expandtab=true
vim.o.shiftwidth=2
vim.o.smartindent = true

-- Basic options for searching
vim.o.ignorecase=true
vim.o.smartcase=true

-- Basic options for splits
vim.o.splitbelow=true
vim.o.splitright=true

-- Install Packer
-- Packer is a package manager which runs in lua that allows you to add package dependencies to 
-- NeoVim. If packer is not installed yet, install it
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then 
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end 
