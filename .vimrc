set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set nocompatible              " be iMproved, required
"colorscheme desert
colorscheme default
filetype off                  " required
filetype plugin indent on    " required

call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
"Plug 'andrewstuart/vim-kubernetes'
Plug 'davidhalter/jedi-vim'
call plug#end()

" Airline 
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1


" Easy ALign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

nnoremap <silent> <F11> :TlistOpen<CR>
nnoremap <silent> <F12> :TlistClose<CR>
let Tlist_Exit_OnlyWindow = 1
let Tlist_Auto_Highlight_Tag = 0

"Insert mode completion-popup possible options
set completeopt=longest,menuone

" set tab width to 4 and expand tabs
set tabstop=4
set shiftwidth=4
set expandtab

set ruler
set hlsearch
set incsearch
set wildmenu

set undofile
set undodir=/tmp

map <F10> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --languages=c++ .<CR>

"to disable auto comenting on paste.
set formatoptions-=cro
"set numberwidth=7
"Limit syntax highlighting 
"set synmaxcol=128
"to avoid scrolling problems
"set lazyredraw 

augroup templates
   "clear the grop so that vim will not load multple times
   autocmd!
   " read in templates files
   autocmd BufNewFile *.cpp 0r ~/.vim/templates/skeleton.cpp
   autocmd BufNewFile *.sh  0r ~/.vim/templates/skeleton.sh
   autocmd BufNewFile *.py  0r ~/.vim/templates/skeleton.py
   "auto indent before saving
   "autocmd BufWritePre *.cpp :normal gg=G
augroup END

augroup autocompile
    autocmd!
    autocmd BufWritePost,FileWritePost /home/fedora/TEST/*.cpp !g++ -Wall %:p
    "autocmd BufWritePost,FileWritePost /home/fedora/TEST/*.cpp !g++ -Wall %:p -o %:r
    "autocmd VimLeave /home/fedora/TEST/*.cpp !g++ -Wall %:p 
    autocmd VimLeave /home/fedora/TEST/*.sh  !chmod +x %:p
    autocmd VimLeave /home/fedora/TEST/*.py  !chmod +x %:p
augroup END

augroup autocorrect
    autocmd!
    autocmd FileType cpp :iabbrev iff if ()<left>
    autocmd FileType cpp :iabbrev elf else if ()<left>
    autocmd FileType cpp :iabbrev whilee while ()<left>
    autocmd FileType cpp :iabbrev elsee else ()<left>
    autocmd FileType cpp :iabbrev forr for ()<left>
    autocmd FileType sh  :iabbrev iff if [[ ]]<left>
    autocmd FileType sh  :iabbrev elf elif [[ ]]<left>
augroup END

augroup autocomment
    autocmd!
    autocmd FileType python nnoremap <buffer> ,c I#<esc>
    autocmd FileType sh     nnoremap <buffer> ,c I#<esc>
    autocmd FileType vim    nnoremap <buffer> ,c I"<esc>
    autocmd FileType cpp    nnoremap <buffer> ,c I//<esc>
    autocmd FileType c      nnoremap <buffer> ,c I//<esc>
    "disable auto commet for c/cpp files
    "autocmd FileType c,cpp setlocal comments-=:// comments+=f://
    autocmd FileType c,cpp setlocal comments=
augroup END
