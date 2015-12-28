" set for vundle
" git clone https://github.com/gmarik/Vundle.vim
filetype off
if has("unix")
	set rtp+=~/.vim/bundle/Vundle.vim/
	call vundle#rc()
else 
	set rtp+=~/vimfiles/bundle/Vundle.vim/
	call vundle#rc('$HOME/vimfiles/bundle/')
endif


filetype on


"Encoding settings
set encoding=utf-8
set fileformat=unix
set ambiwidth=double
set fileencodings=utf-8,big5,latin1

set nocompatible
set ttyfast
set hidden

set nobackup
set noswapfile


" Views
syntax on
set ruler
set cursorline
set cursorcolumn
set showmode    " Show mode on bottom-left
set scrolloff=5 " keep at least 5 lines above/below
set number      " Show line numbers
set listchars=tab:>\ 
set list
set bg=dark
colorscheme molokai

set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
set laststatus=2 " Status line

set wildmenu " commend line auto complete
set wildmode=list:longest       " command 展開

set t_Co=256
set hlsearch
set incsearch
set backspace=2 " Enable backspace

" Font settings for gvim
if has("gui_running")
  if has("gui_gtk2")
    set guifont=DejaVu\ Sans\ Mono\ 15
  elseif has("gui_macvim")
    set guifont=DejaVu\ Sans\ Mono:h15
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif


" Tab charactor related settings
set tabstop=4
set shiftwidth=4
set autoindent
set smarttab
set smartindent
set shiftround

set autochdir

"set statusline=%4*%<\ %1*[%F]
"set statusline+=%4*\ %5*[%{&encoding},  "encoding
"set statusline+=%{&fileformat}]%m       "file format
"set statusline+=%4*%=\ %6*%y%4*\ %3*%l%4*,\ %3*%c%4*\ \<\ %2*%P%4*\ \>

hi User1 ctermfg=cyan ctermbg=darkgray
hi User2 term=underline ctermfg=yellow ctermbg=darkgray
hi User3 term=underline ctermfg=yellow ctermbg=darkgray
hi User4 term=underline ctermfg=white ctermbg=darkgray
hi User5 ctermfg=green ctermbg=darkgray
hi User6 ctermfg=white ctermbg=darkgray

" hi TabLineFill ctermfg=Black ctermbg=Grey
hi TabLine ctermfg=Black ctermbg=Grey
hi TabLineSel ctermfg=White ctermbg=Black

autocmd! BufNewFile * silent! 0r ~/.vim/skel/Template.%:e


" hotkeys {{{

nnoremap <BS> X
nnoremap k gk
nnoremap j gj
inoremap jj <ESC> 

set pastetoggle=<F5>

imap<F9> <ESC>:w<Enter><F9>
nmap<F9> :!./%:t

function! Set_c_Prefs()
	nmap<F9>  :!gcc "%:t" -o "%:r.out" -Wall -Wshadow -O2 -Im && echo "===== compile done =====" && "./%:r.out"<CR>
	nmap<F10> :!gcc "%:t" -o "%:r.out" -Wall -Wshadow -O2 -Im<CR>
	nmap<F11> :!gcc "%:t" -o "%:r.out" -Wall -Wshadow -O2 -Im -g && valgrind --leak-check=full --log-file=%:r.vglog ./%:r.out<CR>
endfunction

function! Set_cpp_Prefs()
	nmap<F8> :!g++ "%:t" -o "%:r.out" --std=c++11 -Wall -Wshadow -O2 -Im && echo "===== compile done =====" && "./%:r.out"<CR>
	nmap<F9> :!g++ "%:t" -o "%:r.out" --std=c++11 -Wall -Wshadow -O2 -Im -DKEVINPTT && echo "===== compile done =====" && "./%:r.out"<CR>
	nmap<F10> :!g++ "%:t" -o "%:r.out" --std=c++11 -Wall -Wshadow -O2 -Im -DKEVINPTT<CR>
endfunction

function! Set_python_Prefs()
	nmap<F9> :!python3 "%:t"
endfunction

function! Set_pascal_Prefs()
	nmap<F9>  :!fpc "%:t" && echo "===== compile done =====" && "./%:r"
	nmap<F10> :!fpc "%:t"
	nmap<F11> :!fpc "%:t" && valgrind --leak-check=full --log-file=%:r.vglog ./%:r
endfunction

function! Set_web_Prefs()
	setlocal tabstop=2
	setlocal shiftwidth=2
	"setlocal expandtab
	setlocal listchars=tab:\|\ 
endfunction

function! Set_js_Prefs()
	setlocal tabstop=2
	setlocal shiftwidth=2
	setlocal expandtab
	nnoremap <buffer>  <c-f> :call JsBeautify()<cr>
	nmap<F10> :!jshint "%"
endfunction


filetype plugin on
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.less set filetype=less
autocmd filetype c call Set_c_Prefs()
autocmd filetype cpp call Set_cpp_Prefs()
autocmd filetype python call Set_python_Prefs()
autocmd filetype pascal call Set_pascal_Prefs()
autocmd filetype less,htm,xml,html,xhtml,php,css call Set_web_Prefs()
autocmd filetype javascript call Set_js_Prefs()

autocmd! bufwritepost .vimrc source % " vimrc文件修改後自動reload。 linux。

" }}}

" plugin {{{
" bundle settings {{{

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" NERDTree
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'

" SuperTab
Bundle 'ervandew/supertab'

" jsbeautify
Bundle 'maksimr/vim-jsbeautify'

" syntax
Bundle 'ap/vim-css-color'
Bundle 'groenewege/vim-less'
Bundle 'mxw/vim-jsx'
Bundle 'othree/yajs.vim'

" }}}

" NERDTree {{{
map <C-n> :NERDTreeTabsToggle<CR>
let g:NERDTreeDirArrows=0
" }}}

" SuperTab {{{
let g:SuperTabDefaultCompletionType = "<c-n>"
" }}}

" jsbeautify {{{
" }}}

" }}}
