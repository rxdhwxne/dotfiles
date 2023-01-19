call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-scripts/kiss.vim'

call plug#end()

runtime! ftplugin/man.vim

set background=dark
colorscheme gruvbox

"Auto pair parentheises, etc
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O
inoremap [ []<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
inoremap < <><Esc>i

noremap <Up> <nop>
noremap <Right> <nop>
noremap <Down> <nop>
noremap <Left> <nop>

inoremap <Up> <nop>
inoremap <Right> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>

set number relativenumber ruler cursorline
set colorcolumn=80
set showmode showcmd
set list listchars=tab:»·,trail:·
set scrolloff=4

set autoindent expandtab softtabstop=4 shiftwidth=4 tabstop=4
set backspace=start,eol,indent

set encoding=utf-8 fileencoding=utf-8

set incsearch hlsearch

nnoremap <Leader>n :noh<CR>

nnoremap <Leader>f :Files<CR>
nnoremap <Leader>g :GFiles<CR>

function! Formatonsave()
  let l:formatdiff = 1
  py3f ~/afs/script/clang-format.py
endfunction

augroup ClangFormat
    autocmd BufWritePre *.h,*.c :call Formatonsave()
augroup END
