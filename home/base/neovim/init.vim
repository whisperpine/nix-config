" Enable 'Enter' key to select auto completed option
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" Open file at the same place where last time left off
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
\ | exe "normal! g'\"" | endif


" Override indent rule for specific filetype
autocmd Filetype xml setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype nix setlocal tabstop=2 shiftwidth=2 softtabstop=2

" 0 -> blinking block.
" 1 -> blinking block (default).
" 2 -> steady block.
" 3 -> blinking underline.
" 4 -> steady underline.
" 5 -> blinking bar (xterm).
" 6 -> steady bar (xterm).
let &t_SI = "\e[6 q"    " set cursor shape to steady bar inside INSERT mode
let &t_EI = "\e[2 q"    " Set cursor shape to steady block inside NORMAL mode
let &t_SR = "\e[4 q"    " Set cursor shape to steady block inside REPLACE mode

syntax on               " Enable syntax highlighting
filetype plugin on      " Enable filetype-specific plugin
filetype indent off     " Disable filetype-specific indent

" Configure colorscheme
set termguicolors

" Vim native way to remove background color
" highlight Normal guibg=NONE ctermbg=NONE

set background=dark     " Apply dark theme in any color scheme

set autoindent          " Inherit the indent format when changing line
set smartindent         " React to the syntax or style of the code

set ignorecase          " Ignore upper case or lower case when searching
set smartcase           " Override 'ignorecase' if the search pattern contains upper case char
set incsearch           " highlight when searching
set nohls               " Don't highlight searching result

set number              " Show line number
set encoding=utf-8      " Avoid error when displaying Chinese
set shortmess-=S        " Show search results in [x/y] format
set nowrap              " Don't wrap lines when it's longer than the window width
set noshowmode          " No need to show mode because of lightline plugin
set noshowmatch         " Don't hightlight bracket pair
set showcmd             " Show command in the bottom right corner
set timeoutlen=500      " Time to wait for a mapped sequence to complete.
set ttimeoutlen=5       " Time in milliseconds that vim wait after pressing <esc>
set laststatus=2        " Always show status line
set cursorline          " Highlight the line where the cursor is at
set scrolloff=3         " Cursor will always be 3 lines above the window edge
set fileformat=unix     " Set end of line style to LF
set mouse=              " Disable mouse in every vim mode
set shellslash          " Use slash instead of backslash in paths

" Replace tab with space chars
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" When the cursor is at the start of an empty line,
" pressing backspace will wrap it to the previous line
set backspace=indent,eol,start

" Share system clipboard
set clipboard+=unnamedplus

"====================== configs of plugins ======================"

" Configure lightline plugin
" \ 'separator': { 'left': '', 'right': '' },
" \ 'separator': { 'left': '', 'right': '' },
" \ 'separator': { 'left': '', 'right': '' },
" \ 'subseparator': { 'left': '\\', 'right': '/' },
" \ 'colorscheme': 'jellybeans',
let g:lightline = {
\ 'colorscheme': 'gruvbox_material',
\ 'separator': { 'left': '', 'right': '' },
\ 'subseparator': { 'left': '\\', 'right': '/' },
\ }

" Configure indentLine plugin
let g:indentLine_color_term = 239   " Set color
let g:vim_json_conceal = 0          " Avoid char hidden in json
let g:markdown_syntax_conceal = 0   " Avoid char hidden in markdown

" Configure vim-better-whitespace plugin
let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1
let g:strip_whitespace_confirm = 0
let g:better_whitespace_guicolor = '#ea6962'

" Available values: 'material', 'mix', 'original'
let g:gruvbox_material_foreground = 'material'
" Remove background color
let g:gruvbox_material_transparent_background = 1
" Disable italic in comment
let g:gruvbox_material_disable_italic_comment = 1
" Disable this option to be compatible with NixOS
let g:gruvbox_material_better_performance = 0
" Override scheme color
let g:gruvbox_material_colors_override = {
\ 'fg0':    ['#bdbdbd', '223'],
\ 'fg1':    ['#bdbdbd', '223'],
\ 'grey1':  ['#838383', '245'],
\ 'grey2':  ['#838383', '245'],
\ 'bg_dim': ['#252525', '233'],
\ 'bg0':    ['#323232', '236'],
\ 'bg1':    ['#3c3c3c', '237'],
\ 'bg2':    ['#3c3c3c', '237'],
\ 'bg3':    ['#505050', '239'],
\ 'bg4':    ['#505050', '239'],
\ 'bg5':    ['#666666', '241'],
\ 'bg_statusline1': ['#3c3c3c',   '237'],
\ 'bg_statusline2': ['#464646',   '237'],
\ 'bg_statusline3': ['#5b5b5b',   '241'],
\ }

" Set colorscheme
colorscheme gruvbox-material
