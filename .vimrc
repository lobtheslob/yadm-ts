"" ~/.vimrc

"" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

"" Declare the list of plugins.

" NERDTree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'PhilRunninger/nerdtree-visual-selection'

" JS
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'
Plug 'maksimr/vim-jsbeautify'
Plug 'peitalin/vim-jsx-typescript'
Plug 'duteng/emmet-vim-react-snippets'
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'claco/jasmine.vim'
Plug 'lfilho/cosco.vim'


" Vim Helpers
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-rhubarb'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/gv.vim'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'leafgarland/typescript-vim'
Plug 'dracula/vim'
Plug 'inside/vim-search-pulse'
Plug 'RRethy/vim-illuminate'
Plug 'ludovicchabant/vim-gutentags'
Plug 'airblade/vim-gitgutter'
Plug 'maralla/completor.vim'

" GO 
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Terraform
Plug 'hashivim/vim-terraform'

" GRAPHQL
Plug 'jparise/vim-graphql'

" Commenting
Plug 'tomtom/tlib_vim'
Plug 'tomtom/tcomment_vim'

" HTML
Plug 'mattn/emmet-vim'
Plug 'slim-template/vim-slim'
Plug 'mustache/vim-mustache-handlebars'

" Tmux
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'

" Visuals
Plug 'altercation/vim-colors-solarized'

" DevIcons looded last
Plug 'ryanoasis/vim-devicons'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"if exists('g:vscode')
"    " VSCode extension
"else
"    " ordinary neovim
"endif

"vim-go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Use new vim 8.2 popup windows for Go Doc
let g:go_doc_popup_window = 1

" Enable lsp for go by using gopls
let g:completor_filetype_map = {}
let g:completor_filetype_map.go = {'ft': 'lsp', 'cmd': 'gopls -remote=auto'}"

" Launch gopls when Go files are in use
let g:LanguageClient_serverCommands = {
       \ 'go': ['gopls']
       \ }

" Run gofmt on save
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

"" colors mmm
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme dracula 


"" vim os check 
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif

"" line highlighting
set cursorline
highlight LineNr term=underline ctermfg=1
highlight Cursorline cterm=NONE ctermfg=NONE term=underline
highlight CursorLineNr term=bold cterm=bold ctermfg=3 gui=bold
"" curly boy highlighting
highlight MatchParen cterm=none ctermbg=darkgray ctermfg=white
"" Visual mode highlighting
highlight Visual cterm=reverse ctermbg=NONE
"" line numbering
set number
"" bind <C-@> to toggle number, because it's annoying sometimes
nmap <C-@> :set number! number?<CR>
"" whitespace characters for :set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
"" fix backspace issue
set backspace=indent,eol,start
set ts=2
"" ruler at the bottom right
set ruler
"" case insensitive searching
set ignorecase
set smartcase
"" scrolloff, prevent cursor from hitting the end of buffer
set scrolloff=6
"" baslike filepath tab completion in exec mode
set wildmode=longest,list,full
set wildmenu

" unjanky the janky of pressing "u" in visual block mode
" this stops the accidental lowercasing of blocks of code
xnoremap u <nop>
xnoremap U <nop>
nnoremap gu <nop>
nnoremap gU <nop>

"""" Plugin Configurations

"" Map multicursor
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-m>'
let g:multi_cursor_select_all_word_key = '<M-n>'
let g:multi_cursor_start_key           = 'g<C-m>'
let g:multi_cursor_select_all_key      = 'g<M-n>'
let g:multi_cursor_next_key            = '<C-m>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" set date
nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>

" set relativenumber to reduce mental math
" set relativenumber

" remap escape
cnoremap kj <C-C>
cnoremap jk <C-C>


" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
"function! OpenTerminal()
"  split term://bash
"  resize 10
"endfunction
"nnoremap <c-n> :call OpenTerminal()<CR>

""" Map Nerdtree to CTRL+N
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeHighlightFoldersFullName = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeDirArrows = 1

"""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""devicons""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""

" loading the plugin
let g:webdevicons_enable = 1

" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree=1

" adding the custom source to unite
let g:webdevicons_enable_unite = 1 

" adding the column to vimfiler
let g:webdevicons_enable_vimfiler = 1

" adding to vim-airline's tabline
let g:webdevicons_enable_airline_tabline = 1

" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1

" ctrlp glyphs
let g:webdevicons_enable_ctrlp = 1

" adding to vim-startify screen
let g:webdevicons_enable_startify = 1

" adding to flagship's statusline
let g:webdevicons_enable_flagship_statusline = 1

" turn on/off file node glyph decorations (not particularly useful)
let g:WebDevIconsUnicodeDecorateFileNodes = 0 

" use double-width(1) or single-width(0) glyphs
" only manipulates padding, has no effect on terminal or set(guifont) font
let g:WebDevIconsUnicodeGlyphDoubleWidth = 0 

" the amount of space to use after the glyph character (default ' ')
" let g:WebDevIconsNerdTreeAfterGlyphPadding = '' 
" let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''

" Force extra padding in NERDTree so that the filetype icons line up vertically
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0

" Adding the custom source to denite
let g:webdevicons_enable_denite = 1

" whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets=1

""""""""""""""""""""""""""""""""  config airline

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#left_alt_sep  = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#show_close_button = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline_theme = 'base16_brewer'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_section_b = '%{strftime("%c")}%'


" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
" fix :E command after Syntastic install (created new Errors command that interfered)
cabbrev E NERDTreeToggle


" fzf
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

nnoremap <silent> <C-f> :Files<CR>

"" Configure vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" Align Github-flabored markdown tables (not sure if this works)
"au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

"show tabs
"----------------------
" Shortcut to rapidly toggle `set list`
map <tab> :set list!<CR>

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif




