call plug#begin('~/.vim/plugged')

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" lsp
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" colorscheme
Plug 'nanotech/jellybeans.vim'

" snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'

call plug#end()

set background=dark
" Color setup.
set t_Co=256

colorscheme jellybeans

set linespace=0
set signcolumn=yes
set encoding=utf-8

set ttyfast

let mapleader = "\<SPACE>"
let g:mapleader = "\<SPACE>"

" Identation, tabs, and spaces.
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" Set line-spacing to minimum.
set linespace=0

" vim update time for faster gitgutter update
set updatetime=500

set fileformats=unix,dos,mac

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

set clipboard=unnamed,unnamedplus

" Turn off swap files.
set noswapfile
set nobackup
set nowb

set history=2000

set hidden
set title

" show diff mode in vertical splits
set diffopt+=vertical

set splitbelow

" Configure backspace.
set backspace=indent,eol,start

set showcmd

set wildmenu
set wildmode=list:longest,list:full

" Search.
set showmatch
set matchtime=3
set incsearch
set hlsearch
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.

" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

nnoremap <leader>/ :nohlsearch<CR>
nnoremap * *``

" Disable ex mode.
nnoremap Q <nop>

cmap Wq wq
cmap W w

vnoremap < <gv
vnoremap > >gv

" Display tabs and trailing spaces visually.
set list listchars=tab:.\ ,trail:·,extends:>,precedes:<,nbsp:~

" Copy
map <leader>y "+y
map <leader>Y "+Y
map <leader>P "+P
map <leader>p "+p

" Paste
nnoremap <leader>p "+p
nnoremap <leader>P "+P

noremap <leader>e :Ex<CR>
noremap <leader>i :Ex<CR>
noremap <leader>s :split<CR>
noremap <leader>v :vsplit<CR>
noremap <leader>q :q<CR>

" Fast saving.
nnoremap <leader>w :write<cr>
nnoremap <leader>q :bd<CR>

" Disable upper/lower in visual mode
vnoremap U <nop>
vnoremap u <nop>

" Moving between splits.
nnoremap <silent> <c-j> <C-W><C-J>
nnoremap <silent> <c-k> <C-W><C-K>
nnoremap <silent> <c-l> <C-W><C-L>
nnoremap <silent> <c-h> <C-W><C-H>

" Long lines with wrapping move to other part/line.
nnoremap j gj
nnoremap k gk
nnoremap J mzJ`z

nnoremap n nzz
nnoremap N Nzz

nnoremap c :cclose<CR>

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"

" Toggle spell checking.
"map <leader>ss :setlocal spell!<cr>

" Statusline.
set laststatus=2

" Format the statusline.
set statusline=%m%r%h%w
set statusline+=\ \[%{FugitiveHead()}\]
set statusline+=\ %f
set statusline+=%=
set statusline+=%{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %Y\ 
"set statusline+=%=%(%{&ff}\ %{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\ %)
"set statusline+=%(%2l:%2v\ %)
set statusline+=%(%l:%v\ %)

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

" Bind K to grep word under cursor.
nnoremap <leader>f :Rg <C-R><C-W><CR>

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
    autocmd BufRead,BufNewFile go.sum set filetype=go syntax=go
    autocmd BufRead,BufNewFile go.mod set filetype=go syntax=go
    autocmd FileType make setlocal noexpandtab
augroup END


hi StatusLine   ctermfg=233 ctermbg=72 cterm=bold guifg=#ffffff guibg=#4e4e4e gui=bold
hi StatusLineNC ctermfg=250 ctermbg=236 cterm=none guifg=#b2b2b2 guibg=#3a3a3a gui=none
hi StatusLineTerm   ctermfg=233 ctermbg=66 cterm=bold guifg=#ffffff guibg=#4e4e4e gui=bold
hi StatusLineTermNC ctermfg=250 ctermbg=236 cterm=none guifg=#b2b2b2 guibg=#3a3a3a gui=none
hi VertSplit    ctermfg=none  guifg=#3a3a3a ctermbg=none guibg=#3a3a3a cterm=none gui=none
hi CursorLineNR cterm=bold ctermbg=none
hi FoldColumn ctermbg=none ctermfg=none
hi Visual ctermbg=236 ctermfg=none gui=none


" Unset background color.
hi Normal ctermbg=none
"hi NonText ctermbg=none
hi LineNr ctermbg=none
hi clear SignColumn

highlight ExtraWhitespace ctermfg=darkgreen guifg=darkgreen
highlight NonText ctermfg=0
" beginning Tab background
highlight SpecialKey ctermbg=none ctermfg=233 gui=none

match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=234 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=203 ctermbg=234 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=234 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=234 ctermbg=186 gui=none guifg=bg guibg=Red

highlight Search ctermbg=none ctermfg=yellow
highlight QuickFixLine ctermbg=black guibg=black

hi GitGutterAdd ctermfg=green ctermbg=none
hi GitGutterChange ctermfg=yellow ctermbg=none
hi GitGutterDelete ctermfg=red ctermbg=none
hi GitGutterChangeDelete ctermfg=red ctermbg=none

function! ConflictsHighlight() abort
  syn match conflictBegin /^<<<<<<< .*$/
  syn match conflictEnd /^>>>>>>> .*$/
  highlight conflictBegin ctermbg=236 cterm=bold ctermfg=254
  highlight conflictEnd ctermbg=236 cterm=bold ctermfg=254
endfunction

augroup ConflictColors
    autocmd!
    autocmd BufEnter * call ConflictsHighlight()
augroup END

map <silent> <leader>no :FZF ~/doc/notes<cr>

iab nhead
\---
\<CR>title:
\<CR>tags: []
\<CR>summary:
\<CR>---
\<esc>3kA

" fzf
map <leader>o :GFiles<cr>
map <leader>m :Marks<cr>
map <leader>b :Buffers<cr>
map <leader>rg :Rg<cr>

let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.3, 'yoffset': 1, 'border': 'horizontal' } }

"lsp

" LSP configuration
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode

let g:lsp_document_highlight_enabled = 0

let g:lsp_document_code_action_signs_enabled = 0
let g:lsp_document_code_action_signs_hint = {'text': 'A'}
let g:lsp_diagnostics_highlights_enabled = 1
"hi LspErrorHighlight ctermfg=250 ctermbg=250
highlight Error ctermfg=203 ctermbg=none
highlight link LspErrorHighlight Error
"let g:lsp_diagnostics_highlights_insert_mode_enabled = 0

let g:lsp_diagnostics_signs_enabled = 1
let g:lsp_diagnostics_signs_error = {'text': 'X'}
let g:lsp_diagnostics_signs_warning = {'text': '‼'}
let g:lsp_diagnostics_signs_hint = {'text': '!'}
let g:lsp_highlight_references_enabled = 0
let g:lsp_highlights_enabled = 0
let g:lsp_textprop_enabled = 0

if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls']},
        \ 'allowlist': ['go', 'gomod'],
        \ 'semantic_highlight': ['gopls', 'highlight'],
        \ 'initialization_options': {
        \     'completeUnimported': v:true,
        \     'usePlaceholders': v:true,
        \     'matcher': 'fuzzy',
        \     'staticcheck' : v:true,
        \     'analyses': {
        \         'unusedwrite': v:true,
        \         'unusedparams': v:true,
        \     },
        \     'codelenses': {
        \         'generate': v:true,
        \         'test': v:true,
        \     },
        \ },
        \ })
    " fix imports
    autocmd BufWritePre <buffer> call execute('LspCodeActionSync source.organizeImports')
endif

if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> gh <plug>(lsp-hover)
    inoremap <buffer> <expr><c-f> lsp#scroll(+4)
    inoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


" Expand
"imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
"smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <Tab>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'
smap <expr> <Tab>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'

"" Jump forward or backward
"imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
"smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

set completeopt=menu,preview
