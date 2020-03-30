" ~/.vimrc

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'terryma/vim-multiple-cursors'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jelera/vim-javascript-syntax'
Plug 'maksimr/vim-jsbeautify'
Plug 'bubujka/emmet-vim'
Plug 'duteng/emmet-vim-react-snippets'
Plug 'sheerun/vim-polyglot'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


"" enable pathogen
"execute pathogen#infect()

"" colors mmm
syntax on
colorscheme peachpuff
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

"" Map Nerdtree to CTRL+N
map <C-n> :NERDTreeToggle<CR>
"" Hide help button in NERDTree
let NERDTreeMinimalUI=1

" fix :E command after Syntastic install (created new Errors command that interfered)
cabbrev E NERDTreeToggle


"" Configure vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" Align Github-flabored markdown tables (not sure if this works)
"au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

"" ale syntax checking/linting
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_completion_enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" python
let g:ale_python_pylint_options = '--errors-only'
" go
let g:ale_sign_column_always = 1
let g:ale_fixers = {
      \'go': ['gofmt'],
      \'yaml': ['prettier'],
      \}
let g:ale_linters = {
      \'go': ['golint', 'gofmt'],
      \'yaml': ['yamllint'],
      \}
"let g:ale_yaml_yamllint_options = "-d 'document-start: disable'"
let g:ale_fix_on_save = 1

"" lightline configuration:
"" might want export TERM=xterm-256color
set laststatus=2
set noshowmode
let g:lightline = {
    \ 'colorscheme': 'seoul256',
    \ }
" transparent middle bar
let s:palette = g:lightline#colorscheme#{g:lightline.colorscheme}#palette
let s:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
let s:palette.inactive.middle = s:palette.normal.middle
let s:palette.tabline.middle = s:palette.normal.middle


" disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
