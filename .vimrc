set nocompatible
set number
syntax on
filetype on
filetype indent on
filetype plugin on
set smartcase
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start

syntax enable
set background=dark
colorscheme solarized

highlight ExtraWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace ctermbg=darkred guibg=darkred

set wildmenu

set listchars=tab:▸\ ,eol:¬ 
set nolist

" highlight the current line
"set cursorline

" scss syntax highlighting
au BufRead,BufNewFile *.scss set filetype=scss

" search settings
set incsearch
set hlsearch

" vim info
set viminfo='100,<50,s10,h,f1

" Execute open rspec buffer
" Thanks to Ian Smith-Heisters
function! RunSpec(args)
 let cmd = ":! rspec % -cfn " . a:args
 execute cmd 
endfunction
 
" Mappings

" run one rspec example or describe block based on cursor position
map ,s :call RunSpec("-l " . <C-r>=line('.')<CR>)<CR>
" run full rspec file
map ,S :call RunSpec("")<CR>

"statusline setup
set statusline=%f       "tail of the filename

nnoremap <tab> %
vnoremap <tab> %

"RVM
set statusline+=%{exists('g:loaded_rvm')?rvm#statusline():''}

set statusline+=%h      "help file flag
set statusline+=%y      "filetype
set statusline+=%r      "read only flag
set statusline+=%m      "modified flag

"display a warning if &paste is set
set statusline+=%#error#
set statusline+=%{&paste?'[paste]':''}
set statusline+=%*

set statusline+=%=      "left/right separator

set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2

"call pathogen#infect()
