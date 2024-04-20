
vim.opt.encoding = "utf-8"
vim.opt.number = true      -- line number on the left
vim.opt.relativenumber = true
vim.opt.numberwidth = 3    -- always reserve 3 spaces for line number
vim.opt.signcolumn = "yes" -- keep 1 column for coc.vim  check
vim.opt.modelines = 0
vim.opt.showcmd = true     -- display command in bottom bar
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Disable esc key delay.
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 0
vim.opt.timeout = false

-- vim update time for faster gitgutter update
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Set line-spacing to minimum.
vim.opt.linespace = 0
-- Turn off swap files.
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.wb = false

vim.opt.history = 2000

vim.opt.hidden = true
vim.opt.title = true
-- vim.opt.completeopt = { "menu", "menuone", "noselect" },

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cmdheight = 1
vim.opt.showmode = false
vim.opt.equalalways = false -- ???

-- statusline
vim.opt.laststatus = 2

-- Identation, tabs, and spaces.
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- Configure backspace.
-- old values backspace=indent,eol,start
vim.opt.backspace = { 'start', 'eol', 'indent' }

-- Search.
vim.opt.showmatch = true
vim.opt.matchtime = 3
vim.opt.incsearch = true
vim.opt.hlsearch = true

vim.opt.ignorecase = true -- Make searching case insensitive
vim.opt.smartcase = true  -- ... unless the query has capital letters.

vim.opt.signcolumn = "yes"

vim.opt.cursorline = true

-- vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 0
-- vim.opt.background = 'dark'
-- vim.opt.ch = 0

vim.opt.clipboard = "unnamedplus"

-- vim.opt.winbar = "%m%r%h%w %F"

-- Display tabs and trailing spaces visually.
vim.opt.listchars = "tab:. ,trail:·,extends:>,precedes:<,nbsp:~"
vim.opt.fileformats = "unix,dos,mac"

vim.opt.breakindent = true
vim.opt.linebreak = true
vim.opt.foldmethod = "marker"
vim.opt.foldlevel = 0
vim.opt.scrolloff = 10


-- TODO: w, {v, b, l}
vim.opt.formatoptions = vim.opt.formatoptions
    - "a" -- Auto formatting is BAD.
    - "t" -- Don't auto format my code. I got linters for that.
    + "c" -- In general, I like it when comments respect textwidth
    + "q" -- Allow formatting comments w/ gq
    - "o" -- O and o, don't continue comments
    + "r" -- But do continue when pressing enter.
    + "n" -- Indent past the formatlistpat, not underneath it.
    + "j" -- Auto-remove comments if possible.
    - "2" -- I'm not in gradeschool anymore


vim.opt.path:append('**')

local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
local set_cursorline = function(event, value, pattern)
  vim.api.nvim_create_autocmd(event, {
    group = group,
    pattern = pattern,
    callback = function()
      vim.opt_local.cursorline = value
    end,
  })
end
set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)

-- Modes
--   normal = "n",
--   insert = "i",
--   visual = "v",
--   visual_block = "x",
--   term = "t",
--   command = "c",

-- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local opts = { noremap = true, silent = true }

-- space as leader key
vim.keymap.set("", "<Space>", "<Nop>", opts)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('i', 'jj', '<Esc>')

-- Moving between splits
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("n", "<leader>h", "<C-w>h", opts)
vim.keymap.set("n", "<leader>j", "<C-w>j", opts)
vim.keymap.set("n", "<leader>k", "<C-w>k", opts)
vim.keymap.set("n", "<leader>l", "<C-w>l", opts)
vim.keymap.set("n", "<leader>w", ":write<cr>", opts)
vim.keymap.set("n", "<leader>q", ":bd<cr>", opts)
vim.keymap.set("n", "<C-s>", ":vsplit<cr>", opts)
vim.keymap.set("n", "<C-q>", "<C-W><C-c>", opts)
vim.keymap.set("n", "<leader>c", "<C-W><C-c>", opts)

vim.keymap.set("n", "ge", "G", opts)

vim.keymap.set("i", "<C-h>", "<C-\\><C-N><C-w>h", opts)
vim.keymap.set("i", "<C-j>", "<C-\\><C-N><C-w>j", opts)
vim.keymap.set("i", "<C-k>", "<C-\\><C-N><C-w>k", opts)
vim.keymap.set("i", "<C-l>", "<C-\\><C-N><C-w>l", opts)

vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", opts)
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", opts)
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", opts)
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", opts)

vim.keymap.set("t", "<C-b>", "<C-\\><C-N>", opts)        -- normal mode in the terminal
vim.keymap.set("t", "<C-w>c", "<C-\\><C-N><C-w>c", opts) -- close terminal window

vim.keymap.set("n", "<C-a>", "gg<S-v>G", opts)           -- select all

vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

--map <leader>m :Marks<cr>
--vim.keymap.set("n", "<leader>e", ":Lex 30<CR>", opts)
vim.keymap.set("n", "<leader>i", ":Ex<CR>", opts)
--vim.keymap.set("n", "<leader>q", ":q<CR>", opts)

vim.keymap.set("n", "<leader>o",
  ":Telescope find_files previewer=false find_command=rg,--ignore,--hidden,--files,--iglob,!.git <CR>", opts)
vim.keymap.set("n", "<leader>b", ":Telescope buffers<CR>", opts)
vim.keymap.set("n", "<leader>/", ":Telescope grep_string<CR>", opts)
vim.keymap.set("n", "<leader>?", ":Telescope live_grep<CR>", opts)

vim.keymap.set("n", "<leader>s", ":lua require'telescope.builtin'.lsp_document_symbols{}<CR>", opts)
vim.keymap.set("n", "<leader>S", ":lua require'telescope.builtin'.lsp_dynamic_workspace_symbols{}<CR>", opts)
--vim.keymap.set("n", "<leader>a", ":lua require'telescope.builtin'.lsp_code_actions{}<CR>", opts)
vim.keymap.set('n', '<space>ca', ':lua vim.lsp.buf.code_action()<CR>', opts)

vim.keymap.set('n', '<space>cs', ':lua vim.lsp.buf.signature_help()<CR>', opts)

-- vim.keymap.set("n", "gr", ":lua require'telescope.builtin'.lsp_references{}<CR>", opts)
vim.keymap.set("n", "<leader>k", ":lua vim.lsp.buf.hover()<CR>", opts)


-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set("n", "<leader>d", ":lua require'telescope.builtin'.diagnostics{}<CR>", opts)
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

--keymap("n", "nt", ":ZkNew { dir = 'journal/daily', date = 'today' }<CR>", opts)
--keymap("n", "n", ":ZkNew { dir = 'journal/daily', date = 'today' }<CR>", opts)

vim.keymap.set("n", "gd", ":lua require'telescope.builtin'.lsp_definitions{jump_type='vsplit'}<CR>", opts)
-- vim.keymap.set("n", "gd", ":lua require'telescope.builtin'.lsp_definitions{}<CR>", opts)

-- Terminal

vim.keymap.set("n", "tt", ":10 split term://zsh<CR>", opts)
vim.keymap.set("n", "tv", ":vsplit term://zsh<CR>", opts)

--vim.keymap.set("n", "rg", ":lua require'telescope.builtin'.live_grep{}<CR>", opts)
-- TODO grep to word under the cursor

-- git

--vim.keymap.set("n", "<leader>Gb", ":Git blame<CR>", opts)
--vim.keymap.set("n", "<leader>Gs", ":Git status<CR>", opts)
--vim.keymap.set("n", "<leader>Gd", ":Gdiffsplit<CR>", opts)

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<nop>')
vim.keymap.set('n', '<right>', '<nop>')
vim.keymap.set('n', '<up>', '<nop>')
vim.keymap.set('n', '<down>', '<nop>')

-- Disable upper/lower in visual mode
vim.keymap.set('v', 'U', '<nop>')
vim.keymap.set('v', 'u', '<nop>')


-- Toggle spell checking.
-- vim.keymap.set('n', '<leader>sc', ':setlocal spell!<CR>')

-- Move selected lines up and down
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set('n', 'Wq', 'wq')
vim.keymap.set('n', '*', '*``') -- ??
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


diagnostic_status = function()
  -- count the number of diagnostics with severity warning
  local num_errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  -- If there are any errors only show the error count, don't include the number of warnings
  if num_errors > 0 then
    return ' ' .. num_errors .. ' 💀 '
  end
  -- Otherwise show amount of warnings, or nothing if there aren't any.
  local num_warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  if num_warnings > 0 then
    return  ' ' .. num_warnings .. ' 💩 '
  end
  return ''
end

lsp_status = function()
  -- Neovim keeps the messages send from the language server in a buffer and
  -- get_progress_messages polls the messages
  local messages = vim.lsp.util.get_progress_messages()
  local mode = vim.api.nvim_get_mode().mode

  -- If neovim isn't in normal mode, or if there are no messages from the
  -- language server display nothing
  if mode ~= 'n' or vim.tbl_isempty(messages) then
    return ""
  end

  local percentage
  local result = {}
  -- Messages can have a `title`, `message` and `percentage` property
  -- The logic here renders all messages into a stringle string
  for _, msg in pairs(messages) do
    if msg.message then
      table.insert(result, msg.title .. ': ' .. msg.message)
    else
      table.insert(result, msg.title)
    end
    if msg.percentage then
      percentage = math.max(percentage or 0, msg.percentage)
    end
  end
  if percentage then
    return string.format('%03d: %s', percentage, table.concat(result, ', '))
  else
    return table.concat(result, ', ')
  end
end

local statusline = function()
  local parts = {
    -- here goes the parts from before

    "%m%r%h%w %f",

    [[%< %{luaeval("lsp_status()")}]],
    "%=",

    [[%{luaeval("diagnostic_status()")}]],
    "%l/%L:%v ",
    --[[%{luaeval("require'dap'.status()")} %=]]--,
    --
   -- %# starts a highlight group; Another # indicates the end of the highlight group name
    -- This causes the next content to display in colors (depending on the color scheme)
    "%#warningmsg#",

    -- vimL expressions can be placed into `%{ ... }` blocks
    -- The expression uses a conditional (ternary) operator: <condition> ? <truthy> : <falsy>
    -- If the current file format is not 'unix', display it surrounded by [], otherwise show nothing
    "%{&ff!='unix'?'['.&ff.'] ':''}",

    -- Resets the highlight group
    "%*",

    "%#warningmsg#",
    -- Same as before with the file format, except for the file encoding and checking for `utf-8`
    "%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.'] ':''}",
    "%*",
    "[%{get(b:,'gitsigns_head','')}]",
  }
  return table.concat(parts, '')
end




vim.opt.statusline=statusline()


-- set statusline=%m%r%h%w\ %f
-- set statusline+=%=
-- set statusline+=%{&fileencoding?&fileencoding:&encoding}
-- set statusline+=\ %Y\
-- "set statusline+=%=%(%{&ff}\ %{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\ %)
-- "set statusline+=%(%2l:%2v\ %)
-- set statusline+=%(%l/%L:%v\ %)
-- set statusline+=[%{get(b:,'gitsigns_head','')}]


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

require("lazy").setup({
  -- "folke/which-key.nvim",
  -- { "folke/neoconf.nvim", cmd = "Neoconf" },
  -- "folke/neodev.nvim",
  -- 'wbthomason/packer.nvim',

  -- Highlight, edit, and navigate code
  { 
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ":TSUpdate",
  },


  {'nvim-telescope/telescope-ui-select.nvim' },

  -- fuzzy finder framework
  {
    "nvim-telescope/telescope.nvim", 
    tag = '0.1.5',
    dependencies = { 
      "nvim-lua/plenary.nvim" ,
      "nvim-treesitter/nvim-treesitter",
    },
    config = function ()
      local telescope = require('telescope')
      telescope.setup({
        defaults = {
          layout_strategy = 'vertical',
          layout_config = { height = 0.95 },

          path_display = { "tail" }, -- shorten, tail
        },
        extensions = {
        },
      })

      -- To get ui-select loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require('telescope').load_extension("ui-select")
    end,
  },

  -- Comment
  'tpope/vim-commentary',

  -- Surround
  'tpope/vim-surround',

  -- Terminal
  { "akinsho/toggleterm.nvim"},

  -- Git
  {'lewis6991/gitsigns.nvim', -- git added/removed in sidebar + inline blame
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  'tpope/vim-fugitive',

  -- Autocompletion
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'saadparwaiz1/cmp_luasnip',
  -- snippets
  "rafamadriz/friendly-snippets",

  {
     'VonHeikemen/lsp-zero.nvim',
     branch = 'v3.x',
     lazy = true,
     config = false,
     init = function()
       -- Disable automatic setup, we are doing it manually
       vim.g.lsp_zero_extend_cmp = 0
       vim.g.lsp_zero_extend_lspconfig = 0
     end,
   },
   {
     'williamboman/mason.nvim',
     lazy = false,
     config = true,
   },

   -- Autocompletion
   {
     'hrsh7th/nvim-cmp',
     event = 'InsertEnter',
     dependencies = {
       {'L3MON4D3/LuaSnip'},
     },
     config = function()
       -- Here is where you configure the autocompletion settings.
       local lsp_zero = require('lsp-zero')
       lsp_zero.extend_cmp()

       local luasnip = require("luasnip")
       local cmp_buffer = require('cmp_buffer')

       -- And you can configure cmp even more, if you want to.
       local cmp = require('cmp')
       local cmp_action = lsp_zero.cmp_action()

       cmp.setup({
          preselect = true,
          --confirmation = { completeopt = 'menu,menuone,noinsert' },

         formatting = lsp_zero.cmp_format(),
         snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
              -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
              require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
              -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
              -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            end,
          },
          window = {
            -- completion = cmp.config.window.bordered(),
            -- documentation = cmp.config.window.bordered(),
          },
          mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ["<C-n>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
              -- they way you will only jump inside the snippet region
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              elseif has_words_before() then
                cmp.complete()
              else
                fallback()
              end
            end, { "i", "s" }),
            ["<C-p>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
              elseif has_words_before() then
                cmp.complete()
              else
                fallback()
              end
            end, { "i", "s" }),
            ["<CR>"] = cmp.mapping({
              i = function(fallback)
                if cmp.visible() and cmp.get_selected_entry() then
                  cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                else
                  fallback()
                end
              end,
              s = cmp.mapping.confirm({ select = true }),
              c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
            }),
          }),
          experimental = {
            native_menu = false, -- use cmp's menu
            ghost_text = true,
          },
          sources = cmp.config.sources({
            { name = 'luasnip' }, -- For luasnip users.
            { name = 'nvim_lsp' },
            { name = 'buffer' ,
              option = {
                get_bufnrs = function()
                  return vim.api.nvim_list_bufs()
                end
              }
            },
            -- { name = 'vsnip' }, -- For vsnip users.
            -- { name = 'ultisnips' }, -- For ultisnips users.
            -- { name = 'snippy' }, -- For snippy users.
            { name = 'path' },
          }),
            sorting = {
              comparators = {
                -- cmp.config.compare.score_offset, -- not good at all
                cmp.config.compare.locality,
                cmp.config.compare.recently_used,
                cmp.config.compare.score, -- based on :  score = score + ((#sources - (source_index - 1)) * sorting.priority_weight)
                cmp.config.compare.offset,
                cmp.config.compare.order,
                -- cmp.config.compare.scopes, -- what?
                -- cmp.config.compare.sort_text,
                -- cmp.config.compare.exact,
                -- cmp.config.compare.kind,
                -- cmp.config.compare.length, -- useless 
              }
          },
       })
     end
   },

   -- LSP
   {
     'neovim/nvim-lspconfig',
     cmd = {'LspInfo', 'LspInstall', 'LspStart'},
     event = {'BufReadPre', 'BufNewFile'},
     dependencies = {
       {'hrsh7th/cmp-nvim-lsp'},
       {'williamboman/mason-lspconfig.nvim'},
     },
     config = function()
       -- This is where all the LSP shenanigans will live
       local lsp_zero = require('lsp-zero')
       lsp_zero.extend_lspconfig()

       lsp_zero.on_attach(function(client, bufnr)
         -- see :help lsp-zero-keybindings
         -- to learn the available actions
         lsp_zero.default_keymaps({buffer = bufnr})
       end)

       require('mason-lspconfig').setup({
         ensure_installed = {},
         handlers = {
           lsp_zero.default_setup,
           lua_ls = function()
             -- (Optional) Configure lua language server for neovim
             local lua_opts = lsp_zero.nvim_lua_ls()
             require('lspconfig').lua_ls.setup(lua_opts)
           end,
         }
       })
     end
   },

  -- Theme
  'loctvl842/monokai-pro.nvim',
  'nanotech/jellybeans.vim',
  'NLKNguyen/papercolor-theme',
  'tomasiser/vim-code-dark',
  'jacoborus/tender.vim',
  {'nordtheme/vim', name = "nord"},
  { "bluz71/vim-nightfly-colors", name = "nightfly" },
  "rebelot/kanagawa.nvim",
  { "catppuccin/nvim", name = "catppuccin" },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require 'nordic' .load()
    end
  },

  -- Zk notes
  "mickael-menu/zk-nvim",

  'ziglang/zig.vim',
  -- FZF
  -- use { 'junegunn/fzf.vim',
  --   requires = { 'junegunn/fzf' },
  -- }

})


local zk = require("zk")
local commands = require("zk.commands")

commands.add("ZkDaily", function(options)
  options = vim.tbl_extend("force", {}, { dir = 'daily', date = 'today' })
  zk.new(options, { title = "Zk Daily" })
end)

commands.add("ZkDash", function(options)
  options = vim.tbl_extend("force", {}, { dir = 'dashboard.md' })
  zk.new(options, { title = "Zk Dash" })
end)

-- Create a new note after asking for its title.
vim.api.nvim_set_keymap("n", "<leader>zz", "<Cmd>vsplit|ZkDaily<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>zz", "<Cmd>vsplit|ZkDaily<CR>", opts)

-- Create a new note after asking for its title.
vim.api.nvim_set_keymap("n", "<leader>zn", "<Cmd>ZkNew { title = vim.fn.input('Title: ') }<CR>", opts)

-- Open notes.
vim.api.nvim_set_keymap("n", "<leader>zo", "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", opts)
-- Open notes associated with the selected tags.
vim.api.nvim_set_keymap("n", "<leader>zt", "<Cmd>ZkTags<CR>", opts)

-- Search for the notes matching a given query.
vim.api.nvim_set_keymap("n", "<leader>zf",
  "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('Search: ') } }<CR>", opts)
-- Search for the notes matching the current visual selection.
vim.api.nvim_set_keymap("v", "<leader>zf", ":'<,'>ZkMatch<CR>", opts)


-- luasnip
local luasnip = require("luasnip")

vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, { silent = true })

-- treestitter
require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'go',
    'gomod',
    'lua',
    'vimdoc',
    'vim',
    'bash',
    'markdown',
    'markdown_inline',
    'mermaid',
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "bash",
    "json",
    "python",
    "rust",
    "yaml",
    "cpp",
    "toml",
    "zig",
  },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<space>", -- maps in normal mode to init the node/scope selection with space
      node_incremental = "<space>", -- increment to the upper named parent
      node_decremental = "<bs>", -- decrement to the previous node
      scope_incremental = "<tab>", -- increment to the upper scope (as defined in locals.scm)
    },
  },
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true,

    -- Disable slow treesitter highlight for large files
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
        ["iB"] = "@block.inner",
        ["aB"] = "@block.outer",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']]'] = '@function.outer',
      },
      goto_next_end = {
        [']['] = '@function.outer',
      },
      goto_previous_start = {
        ['[['] = '@function.outer',
      },
      goto_previous_end = {
        ['[]'] = '@function.outer',
      },
    },
    -- swap = {
    --   enable = true,
    --   swap_next = {
    --     ['<leader>sn'] = '@parameter.inner',
    --   },
    --   swap_previous = {
    --     ['<leader>sp'] = '@parameter.inner',
    --   },
    -- },
  },
})


-- lspzero
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  -- lsp_zero.default_keymaps({buffer = bufnr})
  -- local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- lsp_zero.default_keymaps({buffer = bufnr})

end)


lsp_zero.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['lua_ls'] = { 'lua' },
    ['rust_analyzer'] = { 'rust' },
    ['gopls'] = { 'go' },
    ['zls'] = { 'zig' },
    -- if you have a working setup with null-ls
    -- you can specify filetypes it can format.
    -- ['null-ls'] = {'javascript', 'typescript'},
  }
})

lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})


-- (Optional) Configure lua language server for neovim
-- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp_zero.setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities() --nvim-cmp

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'gopls', 'pylsp', 'zls', 'zk', 'rust_analyzer'}, handlers = {
    lsp_zero.default_setup,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  }
})


require("lspconfig").gopls.setup({
  capabilities = capabilities,
  flags = { debounce_text_changes = 200 },
  settings = {
    gopls = {
      usePlaceholders = true,
      gofumpt = true,
      analyses = {
        nilness = true,
        unusedparams = true,
        unusedwrite = true,
        useany = true,
      },
      codelenses = {
        gc_details = false,
        generate = true,
        regenerate_cgo = true,
        run_govulncheck = true,
        test = true,
        tidy = true,
        upgrade_dependency = true,
        vendor = true,
      },
      experimentalPostfixCompletions = true,
      completeUnimported = true,
      staticcheck = true,
      directoryFilters = { "-.git", "-node_modules" },
      semanticTokens = true,
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
})


-- Theme
vim.o.background = 'dark'
vim.cmd.colorscheme "nordic"
-- vim.cmd.colorscheme "kanagawa-wave"
-- vim.cmd.colorscheme "monokai-pro-machine"
-- require("catppuccin").setup {
--     color_overrides = {
--         all = {
--             text = "#eeeeee",
--         },
--     }
-- }
-- vim.cmd.colorscheme "catppuccin"
vim.cmd('hi clear SignColumn')


-- snippets
-- be sure to load this first since it overwrites the snippets table.
--luasnip.snippets = require("luasnip-snippets").load_snippets()
require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/snippets"})

local types = require("luasnip.util.types")

-- Every unspecified option will be set to the default.
require("luasnip").setup({
	history = true,
	-- Update more often, :h events for more info.
	update_events = "TextChanged,TextChangedI",
	-- Snippets aren't automatically removed if their text is deleted.
	-- `delete_check_events` determines on which events (:h events) a check for
	-- deleted snippets is performed.
	-- This can be especially useful when `history` is enabled.
	delete_check_events = "TextChanged",
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "choiceNode", "Comment" } },
			},
		},
	},
	-- treesitter-hl has 100, use something higher (default is 200).
	ext_base_prio = 300,
	-- minimal increase in priority.
	ext_prio_increase = 1,
	enable_autosnippets = true,
	-- mapping for cutting selected text so it's usable as SELECT_DEDENT,
	-- SELECT_RAW or TM_SELECTED_TEXT (mapped via xmap).
	store_selection_keys = "<Tab>",
	-- luasnip uses this function to get the currently active filetype. This
	-- is the (rather uninteresting) default, but it's possible to use
	-- eg. treesitter for getting the current filetype by setting ft_func to
	-- require("luasnip.extras.filetype_functions").from_cursor (requires
	-- `nvim-treesitter/nvim-treesitter`). This allows correctly resolving
	-- the current filetype in eg. a markdown-code block or `vim.cmd()`.
  ft_func = require("luasnip.extras.filetype_functions").from_cursor,
})

require("luasnip.loaders.from_vscode").lazy_load()


-- gitsigns
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
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.next_hunk()
      end
    end)

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.prev_hunk()
      end
    end)

    -- Actions
    map('n', '<leader>hs', gitsigns.stage_hunk)
    map('n', '<leader>hr', gitsigns.reset_hunk)
    map('v', '<leader>hs', function() gitsigns.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('v', '<leader>hr', function() gitsigns.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end)
    map('n', '<leader>hS', gitsigns.stage_buffer)
    map('n', '<leader>hu', gitsigns.undo_stage_hunk)
    map('n', '<leader>hR', gitsigns.reset_buffer)
    map('n', '<leader>hp', gitsigns.preview_hunk)
    map('n', '<leader>hb', function() gitsigns.blame_line{full=true} end)
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    map('n', '<leader>hd', gitsigns.diffthis)
    map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
    map('n', '<leader>td', gitsigns.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
}


-- Zk
require("zk").setup({
  -- can be "telescope", "fzf" or "select" (`vim.ui.select`)
  -- it's recommended to use "telescope" or "fzf"
  picker = "telescope",

  lsp = {
    -- `config` is passed to `vim.lsp.start_client(config)`
    config = {
      cmd = { "zk", "lsp" },
      name = "zk",
      -- on_attach = ...
      -- etc, see `:h vim.lsp.start_client()`
    },

    -- automatically attach buffers in a zk notebook that match the given filetypes
    auto_attach = {
      enabled = true,
      filetypes = { "markdown" },
    },
  },
})

-- toggleterm
require("toggleterm").setup {
  open_mapping = [[<c-t>]],
  hide_numbers = true,      -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  autochdir = false,        -- when neovim changes it current directory the terminal will change it's own when next it's opened
  start_in_insert = true,
  insert_mappings = true,   -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  persist_mode = true,      -- if set to true (default) the previous terminal mode will be remembered
  direction = 'horizontal',
  close_on_exit = true,     -- close the terminal window when the process exits
  shell = vim.o.shell,      -- change the default shell
  auto_scroll = true,       -- automatically scroll to the bottom on terminal output
}

