require('impatient')

local set = vim.opt
local g = vim.g


g.python3_host_prog = '$HOME/.venv/nvim/bin/python3'

set.syntax = 'on'
set.errorbells = false

set.splitbelow = true
set.splitright = true

-- General tab settings
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.expandtab = true

set.number = true
set.signcolumn = "yes:1"

set.termguicolors = true

set.scrolloff = 5
set.shortmess = ""
set.cmdheight = 2

set.completeopt = "menu,menuone,preview,noinsert,noselect"

-- skipped options
-- set.background = dark
--
-- set.loaded_python_provider = 0
-- set.loaded_perl_provider = 0
-- set.loaded_ruby_provider = 0
-- set.loaded_node_provider = 0
-- set.did_install_default_menus = 1
--
-- set.timeoutlen = 500
-- set.updatetime = 500 " For CusorHold events
-- 
-- set.background = "dark"
-- set.noshowmode = true
--
-- set.completeopt
--
-- set.pumheight = 10
-- set.pumblend = 10
-- set.winblend = 5
--
--set wildmode=longest:full,full
-- " Ignore certain files and folders when globing
-- set wildignore+=*.o,*.obj,*.dylib,*.bin,*.dll,*.exe
-- set wildignore+=*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**
-- set wildignore+=*.jpg,*.png,*.jpeg,*.bmp,*.gif,*.tiff,*.svg,*.ico
-- set wildignore+=*.pyc,*.pkl
-- set wildignore+=*.DS_Store
-- set wildignore+=*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.xdv
-- set wildignorecase  " ignore file and dir name cases in cmd-completion
-- " Tab-complete, see https://vi.stackexchange.com/q/19675/15292.
--inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
--inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
--
--" Jump to matching pairs easily in normal mode
--nnoremap <Tab> %
--
--" Use Esc to quit builtin terminal
--tnoremap <ESC>   <C-\><C-n>
--
--" Clear highlighting
--if maparg('<C-L>', 'n') ==# ''
--  nnoremap <silent> <C-L> :<C-U>nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
--endif
--
--" Toggle cursor column
--nnoremap <silent> <leader>cl :<C-U>call utils#ToggleCursorCol()<CR>
--
--nnoremap <silent> gb :<C-U>call buf_utils#GoToBuffer(v:count, 'forward')<CR>
--nnoremap <silent> gB :<C-U>call buf_utils#GoToBuffer(v:count, 'backward')<CR>
-- augroup packer_auto_compile
--   autocmd!
--   autocmd BufWritePost */nvim/lua/plugins.lua source <afile> | PackerCompile
-- augroup END
-- 
-- let g:config_files = [
--       \ 'globals.vim',
--       \ 'options.vim',
--       \ 'autocommands.vim',
--       \ 'mappings.vim',
--       \ 'plugins.vim',
--       \ 'themes.vim',
--       \ ]
-- 
-- for s:fname in g:config_files
--   execute printf('source %s/core/%s', stdpath('config'), s:fname)
-- endfor

require('globals')
require('plugins')
