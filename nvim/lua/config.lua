
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

-- set clipboard=unnamed,unnamedplus

local options = {

  encoding = "utf-8",
  -- number = true -- line number on the left
  -- relativenumber = true
  -- numberwidth = 3 -- always reserve 3 spaces for line number
  signcolumn = "yes", -- keep 1 column for coc.vim  check
  modelines = 0,
  showcmd = true, -- display command in bottom bar
  clipboard = "unnamedplus",
  splitbelow = true,
  splitright = true,
  -- Disable esc key delay.
  ttimeout = true,
  ttimeoutlen = 0,
  timeout = false,

  -- Set line-spacing to minimum.
  linespace = 0,
  -- Turn off swap files.
  swapfile = false,
  backup = false,
  wb = false,

  history = 2000,

  hidden = true,
  title = true,
  completeopt = { "menu", "menuone", "noselect" }
}

for k, v in pairs(options) do
  vim.opt[k] = v
end


local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal = "n",
--   insert = "i",
--   visual = "v",
--   visual_block = "x",
--   term = "t",
--   command = "c",

-- Moving between splits
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("i", "<C-h>", "<C-\\><C-N><C-w>h", opts)
keymap("i", "<C-j>", "<C-\\><C-N><C-w>j", opts)
keymap("i", "<C-k>", "<C-\\><C-N><C-w>k", opts)
keymap("i", "<C-l>", "<C-\\><C-N><C-w>l", opts)

keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", opts)

keymap("t", "<C-b>", "<C-\\><C-N>", opts) -- normal mode in the terminal
keymap("t", "<C-w>c", "<C-\\><C-N><C-w>c", opts) -- close terminal window

-- TODO review these settings
keymap("t", "<c-W>z", ":resize 100<CR>", opts)
keymap("t", "<c-W>d", ":resize 10<CR>", opts)
keymap("n", "<c-W>z", ":resize 100<CR>", opts)
keymap("n", "<c-W>d", ":resize 10<CR>", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("n", "te", ":10 split term://zsh<CR>", opts)
keymap("n", "tv", ":vsplit term://zsh<CR>", opts)

keymap("n", "<leader>o", ":Telescope find_files theme=dropdown previewer=false find_command=rg,--ignore,--hidden,--files <CR>", opts)
keymap("n", "<leader>b", ":Telescope buffers<CR>", opts)
--map <leader>m :Marks<cr>
keymap("n", "<leader>e", ":Lex 30<CR>", opts)
keymap("n", "<leader>i", ":Ex<CR>", opts)
--keymap("n", "<leader>q", ":q<CR>", opts)

keymap("n", "<leader>s", ":lua require'telescope.builtin'.lsp_document_symbols{}<CR>", opts)
keymap("n", "<leader>ws", ":lua require'telescope.builtin'.lsp_dynamic_workspace_symbols{}<CR>", opts)
keymap("n", "<leader>ca", ":lua require'telescope.builtin'.lsp_code_actions{}<CR>", opts)

--keymap("n", "dl", ":lua require'telescope.builtin'.diagnostics{}<CR>", opts)
keymap("n", "dl", ":lua vim.diagnostic.setqflist()<CR>", opts)
keymap("n", "ds", ":lua vim.diagnostic.show()<CR>", opts)
keymap("n", "dh", ":lua vim.diagnostic.hide()<CR>", opts)
keymap("n", "dp", ":lua vim.diagnostic.goto_prev()<CR>", opts)
keymap("n", "dn", ":lua vim.diagnostic.goto_next()<CR>", opts)

keymap("n", "gi", ":lua require'telescope.builtin'.lsp_implementations{}<CR>", opts)
keymap("n", "gd", ":lua require'telescope.builtin'.lsp_definitions{}<CR>", opts)
keymap("n", "gD", ":lua require'telescope.builtin'.lsp_type_definitions{}<CR>", opts)
keymap("n", "gr", ":lua require'telescope.builtin'.lsp_references{}<CR>", opts)

keymap("n", "rg", ":lua require'telescope.builtin'.live_grep{}<CR>", opts)
-- TODO grep to word under the cursor


vim.cmd([[

" Identation, tabs, and spaces.
set shiftwidth=2 tabstop=2 softtabstop=2 expandtab

" vim update time for faster gitgutter update
set updatetime=500

set fileformats=unix,dos,mac

" Disable folding.
set nofoldenable

" Search files recursively.
set path+=**

" Disable banner.
let g:netrw_banner = 0


" show diff mode in vertical splits
set diffopt+=vertical

" Configure backspace.
set backspace=indent,eol,start

set showcmd

"set wildmenu
"set wildmode=list:longest,list:full

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


" Fast saving.
nnoremap <leader>w :write<cr>
nnoremap <leader>q :bd<CR>

" Disable upper/lower in visual mode
vnoremap U <nop>
vnoremap u <nop>

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
"map <leader>sc :setlocal spell!<cr>

" Statusline.
set laststatus=3

" Format the statusline.
set statusline=%m%r%h%w
set statusline+=\ [%{get(b:,'gitsigns_head','')}]
set statusline+=\ %F
set statusline+=%=
set statusline+=%{&fileencoding?&fileencoding:&encoding}
set statusline+=\ %Y\ 
"set statusline+=%=%(%{&ff}\ %{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\ %)
"set statusline+=%(%2l:%2v\ %)
set statusline+=%(%l/%L:%v\ %)

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


hi StatusLine       ctermfg=253  ctermbg=237 cterm=none guifg=#ffffff guibg=#4e4e4e gui=bold
"hi StatusLineNC    ctermfg=250  ctermbg=236 cterm=none guifg=#b2b2b2 guibg=#3a3a3a gui=none
hi StatusLineTerm   ctermfg=233  ctermbg=66 cterm=bold guifg=#ffffff guibg=#4e4e4e gui=bold
hi StatusLineTermNC ctermfg=250  ctermbg=236 cterm=none guifg=#b2b2b2 guibg=#3a3a3a gui=none
hi VertSplit        ctermfg=237  guifg=#3a3a3a ctermbg=none guibg=#3a3a3a cterm=none gui=none
hi CursorLineNR     cterm=bold   ctermbg=none
hi FoldColumn       ctermbg=none ctermfg=none
hi Visual           ctermbg=236  ctermfg=none gui=none


" Unset background color.
hi Normal ctermbg=none
hi NonText ctermbg=none ctermfg=236
hi LineNr ctermbg=none
"hi clear SignColumn

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

map <silent> <leader>no :FZF $NROOT<cr>

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
au FileType markdown nnoremap mt myI- [ ] <esc>`yllllll
au FileType markdown nnoremap md my0lllrx <esc>`y
au FileType markdown nnoremap mu my0lllr  <esc>`y

" turn off syntax the underline coloring in the links is annoying [][some_link]
au FileType markdown setlocal syntax=

" Hide and format markdown elements like **bold**
autocmd FileType markdown set conceallevel=2

nnoremap <leader>r :Rg
nnoremap ts i<C-R>=strftime("%Y-%m-%d %H:%M")<CR><Esc>

" tnoremap <Esc> <C-\><C-n>

" To simulate |i_CTRL-R| in terminal-mode:
" tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'



]])



local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

telescope.setup {
  defaults = {

    path_display = { "smart" },

    mappings = {
      i = {
        ["<C-n>"] = actions.move_selection_next,
        ["<C-p>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,
        ["<esc>"] = actions.close,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      },

      n = {
        ["<esc>"] = actions.close,
      },
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  },
}

