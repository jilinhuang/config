" My vim settings file
" Author: Mskadu <mskadu@gmail.com>
" Last updated: 12/Dec/2008
"
" Settings {{{
call plug#begin('~/.vim/plugged')
  " C related
  Plug 'vim-scripts/c.vim'

  "Plug 'mib_translator'
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
  Plug 'majutsushi/tagbar'
  Plug 'ctrlpvim/ctrlp.vim'

  Plug 'tpope/vim-surround'
  Plug 'vim-scripts/autoload_cscope.vim'
  Plug 'mileszs/ack.vim'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-dispatch'
  Plug 'fholgado/minibufexpl.vim'
  Plug 'powerline/powerline'
  Plug 'ervandew/supertab'
  Plug 'bronson/vim-trailing-whitespace'

  " JSON
  Plug 'elzr/vim-json'

  " Git
  Plug 'tpope/vim-fugitive'

  " clojure related
  Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
  Plug 'guns/vim-clojure-static'
  Plug 'vim-scripts/paredit.vim'
  Plug 'kien/rainbow_parentheses.vim'

  " ruby related
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-rails'
  Plug 'ngmy/vim-rubocop'
  Plug 'thoughtbot/vim-rspec'
  Plug 'tpope/vim-haml'

  " erlang related
  Plug 'elixir-lang/vim-elixir'
  Plug 'jimenezrick/vimerl'

  "Qfdo s/x/y/gce in quickfix
  Plug 'karlbright/qfdo.vim'
  Plug 'scrooloose/syntastic'
call plug#end()

set ofu=syntaxcomplete#Complete

" General Settings {{{
"
"Make autoindent happen
set autoindent
"Show actual cursor position
set ruler
set showcmd
set showmatch
set showmode
set autowrite

"Switch buffer without save
set hidden

"Misc
set backspace=indent,eol,start
set formatoptions=croq
set number
set shiftwidth=2
set smartindent
set tabstop=2
set expandtab

set cscopequickfix=s-,c-,d-,i-,t-,e-

" *always* use Unicode
set encoding=utf-8 fileencodings=

"Fix findstr for Win32
if has("win32")
  set grepprg=findstr\ /R\ /S\ /N
endif

" Choose right syntax highlighting with tab completion
map <F2> :source $VIMRUNTIME/syntax/
" F9 toggles highlighting
map <F9> :if has("syntax_items")<CR>syntax off<CR>else<CR>syntax on<CR>endif<CR><CR>

"Vim 7 specific mappings
map <C-t> <Esc>:tabnew<CR>
map <C-F4> <Esc>:tabclose<CR> 
map <C-a> <Esc>ggVG 

"Ctrl+tab = Fwd Cycle across splits
map <C-Tab> <Esc><C-w>w
"Ctrl+Shift+tab = Reverse Cycle across splits
map <C-S-Tab> <Esc><C-w>W

" set swap directory
set dir=~/temp/vim
" show status line
set ls=2
"Make no *.bak
set nobackup
" keep backup while we are editing
set writebackup
"Do not wrap text
set nowrap
" do not highlight searches
" set nohlsearch
set hlsearch
"Turn this ON when we want to debug
"set verbose=9

"General Options ends }}}

"My color settings {{{
"
"Reset the default ones before we begin loading ours
highlight Constant  NONE
highlight Delimiter NONE
highlight Directory   NONE
highlight Error   NONE
highlight ErrorMsg  NONE
highlight Identifier  NONE
highlight LineNr    NONE
highlight ModeMsg   NONE
highlight MoreMsg   NONE
highlight NonText   NONE
highlight Normal    NONE
highlight PreProc   NONE
highlight Question  NONE
highlight Search    NONE
highlight Special   NONE
highlight SpecialKey  NONE
highlight Statement NONE
highlight StatusLine  NONE
highlight Title   NONE
highlight Todo      NONE
highlight Type      NONE
highlight Visual    NONE
highlight WarningMsg  NONE

"Now put in our own colors
highlight Comment   term=bold ctermfg=5 ctermbg=0 guifg=#FF005F guibg=gray
highlight Constant  term=underline ctermfg=6 guifg=#FF2F8F
highlight Delimiter   term=bold cterm=bold ctermfg=1 gui=bold guifg=red
highlight Directory term=bold ctermfg=DarkBlue guifg=Blue
highlight Error   term=standout cterm=bold ctermbg=1 ctermfg=1 gui=bold guifg=red
highlight ErrorMsg  term=standout cterm=bold ctermfg=1 gui=bold guifg=red
highlight Identifier  term=underline ctermfg=3 guifg=Yellow3
highlight LineNr    term=underline cterm=bold ctermfg=3 guifg=Brown
highlight ModeMsg   term=bold cterm=bold ctermfg=3 ctermbg=1 guifg=yellow2 guibg=red
highlight MoreMsg   term=bold cterm=bold ctermfg=2 gui=bold guifg=green
highlight NonText   term=bold ctermfg=2 guifg=green3
highlight Normal    ctermfg=white ctermbg=black guifg=grey90 guibg=#000020
highlight PreProc   term=underline ctermfg=14 guifg=cyan
highlight Question  term=standout cterm=bold ctermfg=2 gui=bold guifg=Green
highlight Search    term=reverse ctermbg=2 guibg=Yellow
highlight Special   term=bold ctermfg=5 guifg=SlateBlue
highlight SpecialKey  term=bold ctermfg=DarkBlue guifg=Blue

"set foldmethod=indent
"colorscheme darkblue
colorscheme desert

"use our custom font
if has("gui") 
  set gfn=Monospace\ 12

  "see: http://vim.wikia.com/wiki/VimTip1
  set mousemodel=extend
endif

"highlight current line
set cursorline

nmap <F3> :redir @a<CR>:g//<CR>:redir END<CR>:new<CR>:put! a<CR><CR>
:nnoremap <F5> :buffers<CR>:buffer<Space>

set tags=./tags;/

imap <silent> <C-C> <C-R>=string(eval(input("Calculate: ")))<CR>

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv source $MYVIMRC<cr>
nnoremap <silent> <leader>b :TagbarToggle<cr>
nnoremap <leader>. :CtrlPTag<cr>

let NERDTreeChDirMode=2

"ctags
let Tlist_Use_Right_Window=1
let Tlist_Enable_Fold_Column=0
let Tlist_Show_One_File=1
let Tlist_Ctags_Cmd='/usr/bin/ctags'
set updatetime=1000
nmap ,t :!(cd %:p:h;ctags *)& "Maps the updates of tags to key ,t.
set tags=tags; "The ';'  at the end will cause ctags to search for current dir 
               " and above dirs until it find a tag file.

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" setting for plugin syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['rubocop']
