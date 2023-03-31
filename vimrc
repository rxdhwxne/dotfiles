call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'morhetz/gruvbox'
Plug 'romgrk/doom-one.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'rhysd/vim-clang-format'

call plug#end()

runtime! ftplugin/man.vim

set background=dark
set termguicolors
colorscheme gruvbox

"Auto pair parentheises, etc
inoremap {<CR> {<CR>}<Esc>O
"inoremap [ []<Esc>i
"inoremap ' ''<Esc>i
"inoremap " ""<Esc>i
"inoremap < <><Esc>i

"inoremap <Up> <nop>
"inoremap <Right> <nop>
"inoremap <Down> <nop>
"inoremap <Left> <nop>

set nocursorline

let g:clang_format#auto_format = 1
let g:clang_format#auto_filetypes = ['c', 'cpp']

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "<CR>"

set number relativenumber ruler cursorline
set colorcolumn=80
set showmode showcmd
set list listchars=tab:»·,trail:·
set scrolloff=4

set autoindent expandtab softtabstop=2 shiftwidth=2 tabstop=2
set backspace=start,eol,indent

set encoding=utf-8 fileencoding=utf-8

set incsearch hlsearch
set smartcase
set ic

nnoremap <Leader>n :noh<CR>

nnoremap <Leader>f :Files<CR>
nnoremap <Leader>g :GFiles<CR>

function! Formatonsave()
  let l:formatdiff = 1
  py3f ~/afs/.clang-format.py
endfunction

silent! unmap <C-k>
map <silent> <C-k> :call ClangFormat()<CR>
function! ClangFormat()
    if &filetype == 'c' || &filetype == 'cpp' || &filetype == 'h' || &filetype == 'hh'
        :%!{~/afs/.clang-format}
    else
        echo "You're not in a c file!"
    endif
endfunction


augroup ClangFormat
    autocmd BufWritePre *.h,*.c :call Formatonsave()
augroup END
