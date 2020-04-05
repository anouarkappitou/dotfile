" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-rooter'
Plug 'preservim/nerdtree'
Plug 'chriskempson/base16-vim'
Plug 'rust-lang/rust.vim'

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --all
  endif
endfunction

" Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()


set relativenumber
set softtabstop=4
set hlsearch " highlight search results
set expandtab " turn tabs into spaces
set autoindent

hi Search cterm=None ctermfg=black ctermbg=yellow

" <Ctrl-l> redraw the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR>
" Remap Escape in insert mode to Ctrl-j
inoremap <C-j> <Esc>


" Colors
"
set background=dark

colorscheme base16-gruvbox-dark-hard
"
hi Normal ctermbg=NONE
"
" " Get syntax

syntax on
" F2 and F3 to move to next/previous buffer
map <F2> :bprev<CR>
map <F3> :bnext<CR>

" Window navigation

nnoremap <C-h> <C-w>h 
nnoremap <C-j> <C-w>j 
nnoremap <C-k> <C-w>k 
nnoremap <C-l> <C-w>l

" font
set guifont=Liberation\ Mono:h16

" open in workspace
au VimEnter * NERDTreeToggle c:\workspace



" Use tab for trigger completion with characters ahead and navigate. " NOTE:
" Use command ':verbose imap <tab>' to make sure tab is not mapped by " other
" plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


" Cariage return to select function 
if has('patch8.1.1068')
    inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
    imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Add `:Format` command to format current buffer. 
command! -nargs=0 Format :call CocAction('format')

" Goto Definitions 
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

:cd C:\\workspace

" Vim rooter configuration


" Use git database as pattern to find root directory
let g:rooter_patterns = ['.git/']


" Fzf 

" Empty value to disable preview window altogether
let g:fzf_preview_window = ''
"
" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'



" Neovide config

let g:neovide_fullscreen=v:true
let g:neovide_cursor_animation_length=0.05
let g:neovide_cursor_antialiasing=v:true
let g:neovide_cursor_vfx_mode = "ripple"

" Rust plugin

let g:rustfmt_autosave = 1
