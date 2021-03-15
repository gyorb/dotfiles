call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'nanotech/jellybeans.vim'
Plug 'rust-lang/rust.vim'

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdcommenter'

call plug#end()

"syntax off

colorscheme jellybeans
set background=dark

set linespace=0
set signcolumn=yes
set encoding=utf-8
set textwidth=80

set ttyfast

filetype on
filetype indent on
filetype plugin on

let mapleader = "\<SPACE>"
let g:mapleader = "\<SPACE>"

" Identation, tabs, and spaces.
set shiftwidth=2 tabstop=2 softtabstop=2 autoindent expandtab
set autoindent

" Set line-spacing to minimum.
set linespace=0

" vim update time for faster gitgutter update
set updatetime=500

set fileformats=unix,dos,mac

set formatoptions=qrnjot1

" quick timestamp
nnoremap tt "=strftime("%FT%T%z")<CR>p

augroup file_types
    autocmd!
    autocmd BufRead,BufNewFile *.md
                          \ set filetype=markdown
                          \ textwidth=79
    autocmd BufRead,BufNewFile *.txt
                          \ set filetype=markdown
                          \ textwidth=79
    autocmd BufRead,BufNewFile *.js set filetype=javascript syntax=javascript
    autocmd BufRead,BufNewFile *.json set filetype=json syntax=javascript
    autocmd BufRead,BufNewFile *.py
                          \ set tabstop=4
                          \ softtabstop=4
                          \ shiftwidth=4
                          \ expandtab
                          \ autoindent
                          \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
    autocmd BufRead,BufNewFile *.go
                          \ set autoindent
    autocmd FileType make setlocal noexpandtab
augroup END

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

set title
set titleold="terminal"
set titlestring=%F

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Display tabs and trailing spaces visually.
set list listchars=tab:.\ ,trail:·,extends:>,precedes:<,nbsp:~

"set omnifunc=syntaxcomplete#Complete
set complete-=i

" Disable esc key delay.
set ttimeout
set ttimeoutlen=0
set notimeout

" Disable folding.
set nofoldenable

" Search files recursively.
set path+=**

" Disable banner.
let g:netrw_banner = 0

" Open splits to the right.
let g:netrw_altv = 1

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

set clipboard=unnamed,unnamedplus

" Copy
map <leader>y "+y
map <leader>Y "+Y
map <leader>P "+P
map <leader>p "+p

" Paste
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Turn off swap files.
set noswapfile

" Persist undo after exit
set undofile
set undodir=~/.vim/.undo//

" set backupdir=~/.vim/.backup//

set history=2000

set hidden
set title

set scrolloff=3
" faster scrolling
set scrolljump=10

" show diff mode in vertical splits
set diffopt+=vertical

" Configure backspace.
set backspace=indent,eol,start

set showcmd

set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

set splitright
set splitbelow

" Search.
set showmatch
set matchtime=3
set incsearch
set hlsearch
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.

nnoremap <leader>/ :nohlsearch<CR>
nnoremap * *``

" Line numbering.
" set nuw=1
" set nu
" set relativenumber

" Update content if file is changed.
set autoread

" Disable ex mode.
nnoremap Q <nop>

cmap Wq wq

vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

vnoremap < <gv
vnoremap > >gv

" Tab moving.
nnoremap <S-h> gT
nnoremap <S-l> gt

nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt

" Moving between splits.
nnoremap <silent> <c-j> <C-W><C-J>
nnoremap <silent> <c-k> <C-W><C-K>
nnoremap <silent> <c-l> <C-W><C-L>
nnoremap <silent> <c-h> <C-W><C-H>
nnoremap <silent> <c-z> <C-W>_

map <leader>i :Ex<CR>
map <leader>s :vs<CR>
map <leader>q :q<CR>

" Fast saving.
nnoremap <leader>w :write<cr>
nnoremap <leader>q :bd<CR>

inoremap } }<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
inoremap ] ]<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a
inoremap ) )<Left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a

" Long lines with wrapping move to other part/line.
nnoremap j gj
nnoremap k gk

nnoremap J mzJ`z

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Return to last edit position when opening files.
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif

" Remember info about open buffers on close.
"set viminfo^=%

" Toggle spell checking.
map <leader>ss :setlocal spell!<cr>

map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Statusline.
set laststatus=2

" Format the statusline.
set statusline=%m%r%h%w\ %f\ %=%(%{&ff}\ %{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\ %)%(%l/%L,%v\ %)

highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

function! ToggleMovement(firstOp, thenOp)
    let pos = getpos('.')
    execute "normal! " . a:firstOp
    if pos == getpos('.')
        execute "normal! " . a:thenOp
    endif
endfunction

" The original carat 0 swap
nnoremap <silent> 0 :call ToggleMovement('^', '0')<CR>

" How about G and gg
nnoremap <silent> G :call ToggleMovement('G', 'gg')<CR>
nnoremap <silent> gg :call ToggleMovement('gg', 'G')<CR>

" ================== Plugin Configs =====================

map cn :cnext<CR>
map cp :cprevious<CR>
nnoremap cc :cclose<CR>
nnoremap co :copen<CR>

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
else
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
    let g:ctrlp_prompt_mappings = {
                \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
                \ }
endif

" Bind K to grep word under cursor.
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR><CR>

" gitgutter
" unmap gitgutter maps (moving between splits)
let g:gitgutter_map_keys = 0
" update markers on file open
let g:gitgutter_terminal_reports_focus=0

let g:gitgutter_max_signs = 500  " default value
"let g:gitgutter_highlight_lines = 1

nmap gn <Plug>GitGutterNextHunk
nmap gp <Plug>GitGutterPrevHunk
nmap gb <Plug>Gblame

" fzf
map <leader>o :GFiles<cr>
map <leader>b :Buffers<cr>
map <leader>g :Ag<cr>
map <leader>m :History<cr>

" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

let g:ctrlp_working_path_mode = 'arw'
" Search from current directory instead of project root
"let g:ctrlp_working_path_mode = 0

let g:ctlp_by_filename = 1

"let g:ctrlp_regexp = 1
let g:ctrlp_by_filename = 1
let g:ctrlp_show_hidden = 1
let g:ctrlp_mruf_max = 500
"let g:ctrlp_mruf_case_sensitive = 1
let g:ctrlp_max_files = 0
let g:ctrlp_use_caching = 0
let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*'

" ================== Theme =====================
" Color setup.
set t_Co=256

"set t_ut=disable
set background=dark

highlight NonText ctermfg=0
highlight SpecialKey ctermfg=0

"set colorcolumn=80
"highlight ColorColumn ctermbg=232
"let &colorcolumn="80,".join(range(120,999),",")

hi StatusLine   ctermfg=white  guifg=#ffffff ctermbg=234 guibg=#4e4e4e cterm=bold gui=bold
hi StatusLineNC ctermfg=250  guifg=#b2b2b2 ctermbg=234 guibg=#3a3a3a cterm=none gui=none
hi VertSplit    ctermfg=none  guifg=#3a3a3a ctermbg=none guibg=#3a3a3a cterm=none gui=none
hi CursorLineNR cterm=bold ctermbg=none
hi FoldColumn ctermbg=none ctermfg=none

set fillchars=vert:\|

" Unset background color.
hi Normal ctermbg=none
hi NonText ctermbg=none
hi LineNr ctermbg=none
hi clear SignColumn

hi GitGutterAdd ctermfg=green
hi GitGutterChange ctermfg=yellow
hi GitGutterDelete ctermfg=red
hi GitGutterChangeDelete ctermfg=red

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Load local config.
try
    source ~/local/.vimrc_local
catch
    " No such file? Just ignore it.
endtry

" LSP configuration
let g:lsp_diagnostics_enabled = 1
let g:lsp_signs_enabled = 0           " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
let g:lsp_signs_error = {'text': 'x'}
let g:lsp_signs_warning = {'text': '‼'}
let g:lsp_signs_hint = {'text': '!'}
let g:lsp_highlight_references_enabled = 0
let g:lsp_highlights_enabled = 0
let g:lsp_textprop_enabled = 0

map gd :LspDefinition<CR>
map gh :LspHover<CR>
map gp :LspDocumentDiagnostics<CR>

if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ 'workspace_config': {'pyls': {'plugins': {'pycodestyle': {'enabled': v:true}, 'pylint':{'enabled': v:true}} }}
        \ })
endif

if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
    autocmd BufWritePre *.go "LspDocumentFormatSync<CR>"
endif

call asyncomplete#register_source(asyncomplete#sources#gocode#get_source_options({
    \ 'name': 'gocode',
    \ 'whitelist': ['go'],
    \ 'completor': function('asyncomplete#sources#gocode#completor'),
    \ 'config': {
    \    'gocode_path': expand('gocode')
    \  },
    \ }))

if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd', '-background-index']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'workspace_config': {'rust': {'clippy_preference': 'on'}},
        \ 'whitelist': ['rust'],
        \ })
endif
