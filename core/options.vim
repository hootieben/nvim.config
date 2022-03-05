" External program to use for grep command
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
  set grepformat=%f:%l:%c:%m
endif

set fileencoding=utf-8

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
