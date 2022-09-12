syntax on
" turns of folding by default, so annoying when you open a file and everything
" is folded
set nofoldenable
set background=dark
" This means not comptable with Vi
set nocompatible
filetype plugin on
" change 2 to whatever tab length you prefer. set smarttab if you want to use
" spaces instead of tabs
set tabstop=2
set shiftwidth=2
set smartindent
set smarttab
" This makes it that you can use your mouse for scrolling, resizing splits,
" switching between splits etc.
set mouse=a
set nu
set nowrap
" Turns off highlighting after a seach is done.
set nohlsearch
set noerrorbells
" True color
set termguicolors
" If you have one file open, then you switch to another file, instead of
" giving you a warning then and there that the file is unsaved, the file will
" instead become a buffer and you can run Telescope buffers (or use the
" <SPC>bb keybind) to see all the
" open buffers
set hidden
set incsearch
" Only does case sensitive search with a capital is there in a search
set smartcase
" Case insensitive search
set ignorecase
" Don't create files
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set scrolloff=8
set encoding=UTF-8

" Set the leader key
let mapleader = ","
" Turns off line numbers when you call the :term command to use a terminal
" inside of neovim
autocmd TermOpen * setlocal nonumber norelativenumber

let g:floaterm_keymap_toggle = '<leader>t'

" Better Gruvbox theming with Alacritty
let g:gruvbox_material_background='hard'
let g:gruvbox_material_palette='original'

" Plugins
command Init :e! ~/.config/nvim/init.vim
call plug#begin()
" themes
Plug 'sainnhe/gruvbox-material'
Plug 'vim-airline/vim-airline'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Telescope
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Heuristically set buffer options
Plug 'tpope/vim-sleuth'

" Floating Terminal
Plug 'voldikss/vim-floaterm'

" Smooth Scrolling
Plug 'psliwka/vim-smoothie'

" Svelte
Plug 'evanleck/vim-svelte'

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" telescope configuration
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" coc configuration

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Set the color scheme
color gruvbox-material
