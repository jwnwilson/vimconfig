"vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"git interface
Plugin 'tpope/vim-fugitive'
"filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim' 

"html
"  isnowfy only compatible with python not python3
Plugin 'isnowfy/python-vim-instant-markdown'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'suan/vim-instant-markdown'
Plugin 'nelstrom/vim-markdown-preview'
"python sytax checker
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/Pydiction'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'

"powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

"auto-completion stuff
Plugin 'ervandew/supertab'
Plugin 'klen/python-mode'
Plugin 'Valloric/YouCompleteMe'
Plugin 'klen/rope-vim'
"Plugin 'davidhalter/jedi-vim'
""code folding
Plugin 'tmhedberg/SimpylFold'

"Colors!!!
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'

call vundle#end()

filetype plugin indent on    " enables filetype detection
let g:SimpylFold_docstring_preview = 1

"autocomplete
let g:ycm_autoclose_preview_window_after_completion=1

"custom keys
let mapleader=" "
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"
call togglebg#map("<F5>")
"colorscheme zenburn
"set guifont=Monaco:h14

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"I don't like swap files
set noswapfile

"turn on numbering
set nu

"mouse scrolling
:set mouse=a

"python with virtualenv support
py << EOF
import os.path
import sys
import vim
if 'VIRTUA_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  sys.path.insert(0, project_base_dir)
  activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

"it would be nice to set tag files by the active virtualenv here
":set tags=~/mytags "tags for ctags and taglist
"omnicomplete
autocmd FileType python set omnifunc=pythoncomplete#Complete

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
autocmd FileType python set foldmethod=indent
"use space to open folds
"nnoremap <space> za 
"----------Stop python PEP 8 stuff--------------

"js stuff"
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" Start nerdtree on startup
"autocmd VimEnter * NERDTree 

"ctags file (not used currently)
set tags=~/mytags

"python version
"python3
let g:ycm_python_binary_path = '/usr/local/bin/python3'

"python2
"let g:ycm_python_binary_path = '/usr/bin/python'

"open / close nerdtree
map <F2> :NERDTreeToggle<CR>

"split navigations
nnoremap <Leader><Down> <C-W><C-J>
nnoremap <Leader><Up> <C-W><C-K>
nnoremap <Leader><Right> <C-W><C-L>
nnoremap <Leader><Left> <C-W><C-H>

"git short cuts
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gl :Glog<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gm :Gmerge<CR>
nmap <Leader>gp :Gpush<CR>
nmap <Leader>gf :Gpull<CR>
nmap <Leader>gb :Gblame<CR>

nmap fip :call Gfind()<CR>
nmap fif :call GfindFile()<CR>
nmap <leader>p :pu!=PDB()<CR>

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>] :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>[ :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

"copy to clipboard
nnoremap <LEader>y :exe "'<,'>:w !pbcopy"<CR>

let g:pydiction_location = '~/pydiction/complete-dict'

function! Gfind()
    let query = input('find text in cwd: ')
    let command = ':vimgrep /' . query . '/j ' . getcwd() . '**/*.py'
    exec command     
    exec ':copen'
endfunction

function! GfindFile()
    let query = input('find text in file: ')
    let command = ':vimgrep /' . query . '/j %'
    exec command     
    exec ':copen'
endfunction

function! PDB()
    return "import pdb;pdb.set_trace()"
endfunction 


