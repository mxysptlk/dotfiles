" https://gist.github.com/miguelgrinberg/527bb5a400791f89b3c4da4bd61222e4
" plugins

call plug#begin()
" Sensuble defaults
Plug 'tpope/vim-sensible'

" File browser with git indicators
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

" git indicator in editor
Plug 'lewis6991/gitsigns.nvim'

" Colorscheme
Plug 'xiyaowong/nvim-transparent'
Plug 'navarasu/onedark.nvim'
Plug 'AlphaTechnolog/pywal.nvim', { 'as': 'pywal' }

" Telescope file finder / picker
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" neovim language things
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'

" Nicer LSP UI
Plug 'glepnir/lspsaga.nvim'
Plug 'echasnovski/mini.nvim', { 'branch': 'stable' }
call plug#end()

filetype plugin indent on
colorscheme onedark
syntax on
highlight Normal ctermbg=none
highlight NonText ctermbg=none

" gfiles shortcut
nnoremap <C-f> <cmd>Telescope find_files<cr>
nnoremap <C-g> <cmd>Telescope git_files<cr>

" always show the status bar
set laststatus=2

" enable 256 colors
set t_Co=256
set t_ut=

" turn on line numbering
set number

" sane text files
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8

" sane editing
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set viminfo='25,\"50,n~/.viminfo
set tw=79
set autoindent
set smartindent

set autochdir

" word movement
imap <S-Left> <Esc>bi
nmap <S-Left> b
imap <S-Right> <Esc><Right>wi
nmap <S-Right> w

" indent/unindent with tab/shift-tab
nmap <Tab> >>
imap <S-Tab> <Esc><<i
nmap <S-tab> <<

" mouse
set mouse=a
let g:is_mouse_enabled = 1
noremap <silent> <Leader>m :call ToggleMouse()<CR>
function ToggleMouse()
    if g:is_mouse_enabled == 1
        echo "Mouse OFF"
        set mouse=
        let g:is_mouse_enabled = 0
    else
        echo "Mouse ON"
        set mouse=a
        let g:is_mouse_enabled = 1
    endif
endfunction

" color scheme
syntax on
filetype on
filetype plugin indent on


" move through split windows
nmap <A-Up> :wincmd k<CR>
nmap <A-Down> :wincmd j<CR>
nmap <A-Left> :wincmd h<CR>
nmap <A-Right> :wincmd l<CR>

" move through buffers
nmap <leader>[ :bp!<CR>
nmap <leader>] :bn!<CR>
nmap <leader>x :bd<CR>

" restore place in file from previous session
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" quit if NvimTree is the last open buffer
autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
" copy, cut and paste
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

" disable autoindent when pasting text
" source: https://coderwall.com/p/if9mda/automatically-set-paste-mode-in-vim-when-pasting-in-insert-mode
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

function! XTermPasteBegin()
    set pastetoggle=<Esc>[201~
    set paste
    return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" file browser
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
"
" Hightlight on yank
" From https://neovim.io/news/2021/07
au TextYankPost * lua vim.highlight.on_yank {higroup="IncSearch", timeout=150, on_visual=true}

" Begininline lua
lua << EOF
-- Setup plugins
require'pywal'.setup{}
require'gitsigns'.setup{}
require'mini.completion'.setup{}
require'mini.comment'.setup{}
require'mini.pairs'.setup{}
require'mini.statusline'.setup{}
require'mini.surround'.setup{}
require'mini.tabline'.setup{}
require'nvim-web-devicons'.setup{}
require'nvim-tree'.setup{}
require'transparent'.setup{extra_groups = {"NvimTreeNormal",
    "NvimTreeEndOfBuffer",
    "NvimTreeVertSplit",}}
vim.g.transparent_enabled = true
    -- Nicer LSP UI
local saga = require 'lspsaga'
-- Configure language server
-- https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 
    pylsp = {
        settings = {
        pylsp = {
            plugins = {
                flake8 = { enabled = true },
                pyflakes = { enabled = false },
                pycodestyle = {enabled = false },
            }
        }}
    },
    bashls = {},
    yamlls = {}
}

for lsp, config in pairs(servers) do
  if type(config) == 'function' then
      config = config()
  end
  config.on_attach = on_attach

  nvim_lsp[lsp].setup(config)
end
EOF
