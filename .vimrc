"" ~/.vimrc

"" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

"" Declare the list of plugins.
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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dracula/vim'
Plug 'ryanoasis/vim-devicons'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

if exists('g:vscode')
    " VSCode extension
else
    " ordinary neovim
endif

"" enable pathogen
"execute pathogen#infect()

"

"" colors mmm
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme dracula 
"
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

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

"" Can be enabled or disabled
let g:webdevicons_enable_nerdtree = 1

"" Map Nerdtree to CTRL+N
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
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
let g:ale_fix_on_save = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" good guy ale looks good
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
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

nmap <silent> <C-e> <Plug>(ale_next_wrap)
"" lightline configuration:
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? 'OK' : printf(
        \   '%d⨉ %d⚠ ',
        \   all_non_errors,
        \   all_errors
        \)
endfunction
set statusline+=%=
set statusline+=\ %{LinterStatus()}

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

"show tabs
"----------------------
" Shortcut to rapidly toggle `set list`
map <tab> :set list!<CR>





