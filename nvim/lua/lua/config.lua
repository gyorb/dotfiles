
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsAdd', text = '~', numhl='GitSignsAddNr', linehl='GitSignsAddLn'}, -- Use GitSignsAdd instead of GitSignsChange because something is wrong with the background color
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}


vim.g.mapleader = " "
vim.opt.encoding="utf-8"

-- Sidebar
vim.o.number = true -- line number on the left
vim.o.relativenumber = true
vim.o.numberwidth = 3 -- always reserve 3 spaces for line number
vim.o.signcolumn = 'yes' -- keep 1 column for coc.vim  check
vim.o.modelines = 0
vim.o.showcmd = true -- display command in bottom bar

vim.cmd([[

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
set splitright

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

nnoremap <silent> <leader>j <C-W><C-J>
nnoremap <silent> <leader>k <C-W><C-K>
nnoremap <silent> <leader>l <C-W><C-L>
nnoremap <silent> <leader>h <C-W><C-H>


" Long lines with wrapping move to other part/line.
nnoremap j gj
nnoremap k gk
nnoremap J mzJ`z

nnoremap n nzz
nnoremap N Nzz

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Toggle spell checking.
"map <leader>ss :setlocal spell!<cr>

" Statusline.
set laststatus=2

" Format the statusline.
set statusline=%m%r%h%w
set statusline+=\ %{get(b:,'gitsigns_head','')}
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

augroup GO_LSP
  autocmd!
  autocmd BufWritePre *.go :silent! lua vim.lsp.buf.formatting()
  autocmd BufWritePre *.go :silent! lua org_imports(3000)
augroup END

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
hi NonText ctermbg=none ctermfg=0
hi LineNr ctermbg=none
hi clear SignColumn

highlight ExtraWhitespace ctermfg=darkgreen guifg=darkgreen
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

iab nhead ---
\<CR>title:
\<CR>tags:
\<CR>  -
\<CR>summary:
\<CR>---
\<CR>
\<esc>5kA

iab -[ - [ ]

" fzf
map <leader>o :GitFiles<cr>
"map <leader>m :Marks<cr>
map <leader>b :Buffers<cr>
map <leader>rg :Rg<cr>

let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.3, 'yoffset': 1, 'border': 'horizontal' } }
let g:fzf_preview_window = []

noremap <leader>y "+y
noremap <leader>p "+p
"nnoremap <leader><leader> <c-^>
nnoremap <silent> <leader><CR> :noh<CR>
nnoremap <Leader>x /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap <Leader>X ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN
" move to the window after split
"nnoremap <leader>v <C-w>v<C-w>l

nnoremap <silent> <leader>c <C-W><C-c>

au FileType markdown nnoremap <leader>" viW<esc>a"<esc>Bi"<esc>lel

" markdown links
au FileType markdown nnoremap ml viW<esc>a]()<esc>Bi[<esc>%l
au FileType markdown xnoremap ml <esc>`>a]()<esc>`<i[<esc>%l
au FileType markdown nnoremap mr viW<esc>a][]<esc>Bi[<esc>%l
au FileType markdown xnoremap mr <esc>`>a][]<esc>`<i[<esc>%l
au FileType markdown nnoremap mf viwy<esc>Go[<esc>pa]: <esc>
au FileType markdown xnoremap mf y<esc>Go[<esc>pa]: <esc>
au FileType markdown nnoremap ma ciW[tmp_link][]<esc>Go[tmp_link]: <esc>pa ""<esc>0l*

" markdown image
au FileType markdown nnoremap mi viW<esc>a]()<esc>Bi![<esc>%l
au FileType markdown xnoremap mi <esc>`>a]()<esc>`<i![<esc>%l

" markdown heading
au FileType markdown nnoremap mh1 myI# <esc>`yllo<esc>o<esc>
au FileType markdown nnoremap mh2 myI## <esc>`ylllo<esc>o<esc>
au FileType markdown nnoremap mh3 myI### <esc>`yllllo<esc>o<esc>
au FileType markdown nnoremap mh4 myI#### <esc>`ylllllo<esc>o<esc>

" markdown tasks
au FileType markdown nnoremap tt myI- [ ] <esc>`yllllll
au FileType markdown nnoremap td my0lllrx <esc>`y
au FileType markdown nnoremap tu my0lllr  <esc>`y

" turn off syntax the underline coloring in the links is annoying [][some_link]
au FileType markdown setlocal syntax=

" Hide and format markdown elements like **bold**
autocmd FileType markdown set conceallevel=2


nnoremap <leader>r :Rg
nnoremap ts i<C-R>=strftime("%Y-%m-%d %H:%M")<CR><Esc>

tnoremap <Esc> <C-\><C-n>

" To simulate |i_CTRL-R| in terminal-mode:
" tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" To use `Ctrl+{h,j,k,l}` to navigate windows from any mode:
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap tt i<C-R>=strftime("%Y-%m-%d %H:%M")<CR><Esc>

nnoremap te :split term://zsh<CR>
nnoremap vte :vsplit term://zsh<CR>

]])

