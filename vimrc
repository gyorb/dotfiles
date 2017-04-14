call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'kien/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'leshill/vim-json'
Plug 'solarnz/thrift.vim'
Plug 'benmills/vimux'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'nvie/vim-flake8'
Plug 'osyo-manga/vim-over'
Plug 'tpope/vim-commentary'
Plug 'fatih/vim-go'

if has('nvim')
  Plug 'benekastah/neomake'
endif

" Themes.
Plug 'NLKNguyen/papercolor-theme'

call plug#end()

syntax enable
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
                          \ fileformat=unix
    autocmd BufRead,BufNewFile *.go
                          \ autoindent
                          \ fileformat=unix
    autocmd FileType make setlocal noexpandtab
augroup END

" Display tabs and trailing spaces visually.
set list listchars=tab:>\ ,trail:·,extends:>,precedes:<,nbsp:~

set omnifunc=syntaxcomplete#Complete
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

"set clipboard+=unnamed,unnamedplus "system clipboard

" Copy.
map <leader>y "+y
map <leader>Y "+Y
map <leader>P "+P
map <leader>p "+p

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
set wildmode=full
set wildignore=*.o,*~,*.pyc

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
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>l <C-W>l
map <leader>h <C-W>h

map <leader>o :Ex<cr>
map <leader>v :vs<cr>
map <leader>q :q<cr>

" Fast saving.
nnoremap <leader>w :w!<cr>
nnoremap <leader>q :q!<CR>

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
set statusline=%m%r%h%w\ %f\ %=%(%{&ff}\ %{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\ %y%)%([%l/%L,%v]\ %)

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
  let g:neomake_python_enabled_makers = ['pep8']
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

let g:gitgutter_max_signs = 500  " default value
"let g:gitgutter_highlight_lines = 1

nmap cn <Plug>GitGutterNextHunk
nmap cp <Plug>GitGutterPrevHunk

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-v>"
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
map <leader><leader> :Commands<cr>

" ctrlp
map <leader>m :CtrlPMRU<cr>

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

colorscheme PaperColor

highlight NonText ctermfg=0
highlight SpecialKey ctermfg=0

"set colorcolumn=80
"highlight ColorColumn ctermbg=232
"let &colorcolumn="80,".join(range(120,999),",")

hi StatusLine   ctermfg=none  guifg=#ffffff ctermbg=none guibg=#4e4e4e cterm=bold gui=bold
hi StatusLineNC ctermfg=none  guifg=#b2b2b2 ctermbg=none guibg=#3a3a3a cterm=none gui=none
hi VertSplit    ctermfg=none  guifg=#3a3a3a ctermbg=none guibg=#3a3a3a cterm=none gui=none
hi CursorLineNR cterm=bold ctermbg=none ctermfg=white
hi FoldColumn ctermbg=none ctermfg=none

set fillchars=vert:\|

" Unset background color.
hi Normal ctermbg=none
hi NonText ctermbg=none
hi LineNr ctermbg=none
hi SignColumn ctermbg=none

" Load local config.
try
    source ~/local/.vimrc_local
catch
    " No such file? Just ignore it.
endtry
