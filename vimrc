call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'leshill/vim-json'
Plug 'benmills/vimux'
Plug 'Chiel92/vim-autoformat'
Plug 'osyo-manga/vim-over'
Plug 'tpope/vim-commentary'
Plug 'shougo/neocomplete.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'sheerun/vim-polyglot'
Plug 'solarnz/thrift.vim'

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" html
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'

" javascript
Plug 'jelera/vim-javascript-syntax'

" python
Plug 'nvie/vim-flake8'
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" go
Plug 'fatih/vim-go'

if has('nvim')
  Plug 'benekastah/neomake'
endif

Plug 'jakwings/vim-colors'

call plug#end()

syntax off

colorscheme moody

" Syntax highlight
" Default highlight is better than polyglot
let g:polyglot_disabled = ['python']
let python_highlight_all = 1

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

" jedi
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#goto_definitions_command = "gd"
let g:jedi#documentation_command = "gh"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

augroup file_types
    autocmd!
    autocmd BufRead,BufNewFile *.md
                          \ set filetype=markdown
                          \ textwidth=79
    autocmd BufRead,BufNewFile *.txt set filetype=markdown
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
set list listchars=tab:>\ ,trail:·,extends:>,precedes:<,nbsp:~

set omnifunc=syntaxcomplete#Complete
set complete-=i

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return neocomplete#close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

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

" Clipboard settings
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus "system clipboard
endif

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
set nobackup
set nowb

set history=2000

set hidden
set title
set scrolloff=3

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
set nuw=1
set nu
set relativenumber

" Update content if file is changed.
set autoread

" Disable ex mode.
nnoremap Q <nop>

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
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

map <leader>o :Ex<cr>
map <leader>v :vs<cr>
map <leader>q :q<cr>

" Fast saving.
nnoremap <leader>w :write<cr>
nnoremap <leader>q :q<CR>

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

if has('nvim')
  " neomake
  let g:neomake_python_enabled_makers = ['pycodestyle']
  autocmd BufWritePost *.py execute 'Neomake'

  " neovim terminal
  tnoremap <c-a> <c-g><esc>
  " exit terminal mode
  tnoremap <Esc> <C-\><C-n>

  " move from the neovim terminal window to somewhere else
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
endif

" ================== Plugin Configs =====================

" vim-go
"let g:go_auto_type_info = 1
let g:go_metalinter_autosave = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']

" vim-autoformat
" autocmd BufWrite * :Autoformat
noremap <F3> :Autoformat<CR>

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

nmap cn <Plug>GitGutterNextHunk
nmap cp <Plug>GitGutterPrevHunk

" ultisnips
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" vimux
map <leader>xl :VimuxRunLastCommand<CR>
map <leader>xx :VimuxCloseRunner<CR>
map <leader>xs :VimuxInterruptRunner<CR>
map <leader>xz :VimuxZoomRunner<CR>
map <leader>xc :VimuxPromptCommand<CR>
map <leader>xb :call VimuxRunCommand("make")<CR>

" fzf
map <leader>n :GFiles<cr>
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

" ctrlpFunky
nnoremap <Leader>u :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>U :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

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

hi StatusLine   ctermfg=none  guifg=#ffffff ctermbg=234 guibg=#4e4e4e cterm=bold gui=bold
hi StatusLineNC ctermfg=250  guifg=#b2b2b2 ctermbg=none guibg=#3a3a3a cterm=none gui=none
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

" Load local config.
try
    source ~/local/.vimrc_local
catch
    " No such file? Just ignore it.
endtry
