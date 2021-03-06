"Plugin
call plug#begin('~/.vim/plugged')
Plug 'rakr/vim-one'                  " vim one color theme
Plug 'scrooloose/nerdtree'           " side bar file tree
Plug 'itchyny/lightline.vim'         " minmal status bar
Plug 'tpope/vim-fugitive'            " allows git commands in vim session
Plug 'airblade/vim-gitgutter'        " shows git changes in gutter
Plug 'easymotion/vim-easymotion'     " go to any word quickly '\\w', '\\e', '\\b'
Plug 'KKPMW/vim-sendtowindow'        " send commands to REPL
Plug 'yuttie/comfortable-motion.vim' " scrolling 'C-d' or 'C-u'
Plug 'ncm2/ncm2'                     " completion [dep]: nvim-0.2.2, nvim-yarp, python3
Plug 'roxma/nvim-yarp'               " remote plugin framework required for ncm2
Plug 'dense-analysis/ale'            " linting [dep]: pip3 install flake8, install.packages('lintr')
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'mhinz/vim-startify'            " A start menu for vim
Plug 'tpope/vim-surround'            " replace surrounding characters
Plug 'filipekiss/ncm2-look.vim'      " ncm2 spelling
Plug 'JuliaEditorSupport/julia-vim'  " julia syntax highlighting
Plug 'tmhedberg/SimpylFold'          " Code folding (zo: open, zc: close)
Plug 'vim-airline/vim-airline'       " Status bar cutomization
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'          "used as bracket pair colorizer
Plug 'norcalli/nvim-colorizer.lua'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
"Coc 
" Stable version of coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Keeping up to date with master
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
"Dev Icons
Plug 'ryanoasis/vim-devicons'
"themes
Plug 'morhetz/gruvbox'

Plug 'joshdick/onedark.vim'

"ctrlp
Plug 'ctrlpvim/ctrlp.vim'

" Floterm 
Plug 'voldikss/vim-floaterm'

"markdown
Plug 'plasticboy/vim-markdown'

" vim test 
Plug 'janko-m/vim-test'
"commenting 
Plug 'preservim/nerdcommenter'
call plug#end()


" set functions in vim

set relativenumber
" ncm2-loom
set noerrorbells
set hidden
set nohlsearch
set incsearch
set signcolumn=yes
set colorcolumn=100
set shortmess +=c
set t_Co=256
highlight Normal guibg=NONE
"devicons setting fonts
set guifont=Hack\ Nerd\ Font:h11

set number                      " set line numbers
set updatetime=100              " set update time for gitgutter update
set noswapfile                  " no swap
" tabs and spaces
set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Uses shiftwidth and tabstap to insert blanks when <Tab>
set shiftwidth=4                " One tab == four spaces.
set tabstop=4                   " One tab == four spaces.<Paste>
set scrolloff=6

" Theme settings
colorscheme one                  " use vim-one colorscheme
set background=dark              " [dark or light]
set termguicolors                " fg and bg highlighting requires compatible terminal colors
" Window Splits
set splitbelow splitright


set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar


" vim debugger
let g:vimspector_enable_mappings = 'HUMAN'

" turn on spelling and make a spell file
set spelllang=en_us
set backspace=indent,eol,start
"setup for colorizer
if (has("termguicolors"))
    set termguicolors
endif

lua require 'colorizer'.setup()
" startify
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   Recent']            },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

" markdown-preview.nvim
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '???${name}???'
let g:ale_sign_column_always=1
let g:ale_lint_on_enter=1
let g:ale_lint_on_text_changed='always'
let g:ale_echo_msg_error_str='E'
let g:ale_echo_msg_warning_str='W'
let g:ale_echo_msg_format='[%linter%] %s [%severity%]: [%...code...%]'
let g:ale_linters={'python': ['flake8'], 'r': ['lintr']}
let g:ale_fixers={'python': ['black']}

" lightline 
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" gitgutter
let g:gitgutter_async=0

" nerdtree settings
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']  " ignore pyc files
let g:webdevicons_enable_nerdtree =1
let g:webdevicons_enable_flagship_statusline = 1


filetype plugin on


" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>
" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K
" Start terminals for R and Python sessions '\tr' or '\tp'
map <Leader>tr :new term://cmd<CR>iR<CR><C-\><C-n><C-w>k
map <Leader>tp :new term://cmd<CR>ipython<CR><C-\><C-n><C-w>k
map <Leader>td :new term://cmd<CR>isqlite3<CR><C-\><C-n><C-w>k
map <Leader>tj :new term://cmd<CR>ijulia<CR><C-\><C-n><C-w>k
map <Leader>ts :new term://cmd<CR>iscala<CR><C-\><C-n><C-w>k

" General Settings


" SQLite should use SQL highlights. See :help ft-sql for more info
autocmd BufNewFile,BufRead *.sqlite set syntax=sql

"vim-airline
let g:airline#extensions#tabline#formatter = 'unique_tail'
" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
" Switch to your current theme
let g:airline_theme = 'onedark'

"ctrlp config
let g:ctrlp_map = '<c-p>'

let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_root_markers = ['pom.xml', '.p4ignore']
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows"

"Floterm config
let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_keymap_next   = '<F2>'
let g:floaterm_keymap_prev   = '<F3>'
let g:floaterm_keymap_new    = '<F4>'

" Floaterm
let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

"kite 
let g:kite_auto_complete=0
let g:kite_snippets=0
set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P

set laststatus=2  "always display the status line


" Always show tabs
set showtabline=2

" We don't need to see things like -- INSERT -- anymore
set noshowmode

" Key Map for Test to run
" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>lt :TestLast<CR>
nmap <silent> <leader>tv :TestVisit<CR>


" git integration 
" Change these if you want
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '???'
let g:signify_sign_change            = '~'

" I find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1


"custom keybindings

"our main leader key to do all the action 
" My leader key is the Space bar
let mapleader = ' '

"to shift between tabs but backward way
nmap <leader>1 :bn<CR>

"to shift between the tabs forward way
nmap <leader>2 :bp<CR>
" to close the chrome tab or tabs present in the vim
nmap <C-w> :bd<CR>

" to close the tab as we use the command to close chrome tab Ctrl-w but here
" we use "leader + w"
nmap <leader>w :bd<CR>

" THis is to save any file default method of using Ctrl-s to save file
nmap <C-s> :w<CR>
" this for saving and sourcing the file only used for vimrc to sourc it quickly
nmap <C-q> :w<CR>:source %<CR>
" for copying or yanking to the clip board
nnoremap <leader>y "+y<CR>
" for pasting something copied from the the clip board 
nnoremap <leader>m "+gp<CR>

" shortcut for split vertically
nmap ']v :w<CR>:vsplit<CR>
"shortcut for horizontal split
nmap ']h :w<CR>:split<CR>
nnoremap <leader>, :q<CR>

nmap <leader>gi :Git<CR>

" File handling  
" For adding a new tab 
nmap <leader>new :tabnew<CR>

" For renameing the file 
nmap <leader>re :CocCommand workspace.renameCurrentFile<CR>
" to open new tab and write edit command and stop in command mode waiting for more command
nmap <leader>nee :tabnew <CR>:edit 
" This is map for function called as "Save As"
nmap <leader>ss :w 
" this is to create a new tab and type save command
nmap <leader>ns :tabnew <CR>:w 

augroup exe_code
    autocmd!

    " execute code for python code
    autocmd FileType python nnoremap <buffer> <leader>ru
                \ :w<CR>:sp<CR>:terminal python %<CR> 
    "run code in node   
    autocmd FileType javascript nnoremap <buffer> <leader>ru
                \ :w<CR>:sp<CR>:terminal node %<CR> :startinsert <CR>
"compiling and running c files
    autocmd FileType c nnoremap <buffer> <leader>ru
                \ :w<CR>:sp<CR>:terminal gcc % -o %:r.exe && %:r.exe <CR>
   "compiling and running c++ file 
    autocmd FileType cpp nnoremap <buffer> <leader>ru
                \ :w<CR>:sp<CR>:terminal g++ % -o %:r.exe && %:r.exe<CR>
   " compile an run java file 
    autocmd FileType java nnoremap <buffer> <leader>ru
                \ :w<CR>:sp<CR>:terminal javac % && java %<CR>
   "run typescript file in node
    autocmd FileType typescript nnoremap <buffer> <leader>ru
                \ :w<CR>:sp<CR>:terminal node %<CR>:startinsert<CR>
    


augroup END
