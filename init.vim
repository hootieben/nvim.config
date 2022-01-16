"{ Global Variable
"{{ Custom variables
let g:is_win = (has('win32') || has('win64')) ? v:true : v:false
let g:is_linux = (has('unix') && !has('macunix')) ? v:true : v:false
let g:is_mac = has('macunix') ? v:true : v:false
let g:logging_level = 'info'
"}}

"{{ Builtin variables
" Disable Python2 support
let g:loaded_python_provider = 0

" Disable perl provider
let g:loaded_perl_provider = 0

" Disable ruby provider
let g:loaded_ruby_provider = 0

" Disable node provider
let g:loaded_node_provider = 0

let g:did_install_default_menus = 1  " do not load menu

" Path to Python 3 interpreter (must be an absolute path), make startup
" faster. See https://neovim.io/doc/user/provider.html.
" if executable('python')
"   if g:is_linux || g:is_mac
"     let g:python3_host_prog=exepath('python')
"   endif
" else
"   echoerr 'Python 3 executable not found! You must install Python 3 and set its PATH correctly!'
" endif
let g:python3_host_prog=expand("$HOME/.venv/nvim/bin/python3")

" Use English as main language
language en_US.utf-8
"}}

"{{ Disable loading certain plugins
" Whether to load netrw by default, see
" https://github.com/bling/dotvim/issues/4
" let g:loaded_netrw       = 0
" let g:loaded_netrwPlugin = 0
let g:netrw_liststyle = 3
if g:is_win
  let g:netrw_http_cmd = 'curl --ssl-no-revoke -Lo'
endif

" Do not load tohtml.vim
let g:loaded_2html_plugin = 1

" Do not load zipPlugin.vim, gzip.vim and tarPlugin.vim (all these plugins are
" related to checking files inside compressed files)
let g:loaded_zipPlugin = 1
let loaded_gzip = 1
let g:loaded_tarPlugin = 1

let g:loaded_tutor_mode_plugin = 1  " do not load the tutor plugin
"}}
"}
"
" Split window below/right when creating horizontal/vertical windows
set splitbelow splitright

" Time in milliseconds to wait for a mapped sequence to complete,
" see https://unix.stackexchange.com/q/36882/221410 for more info
set timeoutlen=500

set updatetime=500  " For CursorHold events


" General tab settings
set tabstop=2      " number of visual spaces per TAB
set softtabstop=2  " number of spaces in tab when editing
set shiftwidth=2    " number of spaces to use for autoindent
set expandtab       " expand tab to spaces so that tabs are spaces

set number
set signcolumn=yes:1

set termguicolors
set background=dark

set scrolloff=3

set noshowmode
set shortmess+=c
set shortmess+=S

set completeopt+=menuone  " Show menu even if there is only one item
set completeopt-=preview  " Disable the preview window

set pumheight=10  " Maximum number of items to show in popup menu
set pumblend=10  " pseudo transparency for completion menu

set winblend=5  " pseudo transparency for floating window

set wildmode=longest:full,full
" Ignore certain files and folders when globing
set wildignore+=*.o,*.obj,*.dylib,*.bin,*.dll,*.exe
set wildignore+=*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**
set wildignore+=*.jpg,*.png,*.jpeg,*.bmp,*.gif,*.tiff,*.svg,*.ico
set wildignore+=*.pyc,*.pkl
set wildignore+=*.DS_Store
set wildignore+=*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.xdv
set wildignorecase  " ignore file and dir name cases in cmd-completion

" Tab-complete, see https://vi.stackexchange.com/q/19675/15292.
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Jump to matching pairs easily in normal mode
nnoremap <Tab> %

" Use Esc to quit builtin terminal
tnoremap <ESC>   <C-\><C-n>

" Clear highlighting
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :<C-U>nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" Toggle cursor column
nnoremap <silent> <leader>cl :<C-U>call utils#ToggleCursorCol()<CR>

nnoremap <silent> gb :<C-U>call buf_utils#GoToBuffer(v:count, 'forward')<CR>
nnoremap <silent> gB :<C-U>call buf_utils#GoToBuffer(v:count, 'backward')<CR>

" Auto-generate packer_compiled.lua file
augroup packer_auto_compile
  autocmd!
  autocmd BufWritePost */nvim/lua/plugins.lua source <afile> | PackerCompile
augroup END

let g:config_files = [
      \ 'options.vim',
      \ 'autocommands.vim',
      \ 'mappings.vim',
      \ 'plugins.vim',
      \ 'themes.vim',
      \ ]

for s:fname in g:config_files
  execute printf('source %s/core/%s', stdpath('config'), s:fname)
endfor
