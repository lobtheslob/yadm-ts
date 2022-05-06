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
Plug 'christoomey/vim-tmux-navigator'
"
"Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree' 
Plug 'OmniSharp/omnisharp-vim' 
Plug 'Xuyuanp/nerdtree-git-plugin' 
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-rhubarb'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-easy-align'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim'
Plug 'ryanoasis/vim-devicons'
Plug 'inside/vim-search-pulse'
Plug 'RRethy/vim-illuminate'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim'

"js helpers
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jelera/vim-javascript-syntax'
Plug 'maksimr/vim-jsbeautify'
Plug 'bubujka/emmet-vim'
Plug 'duteng/emmet-vim-react-snippets'
Plug 'peitalin/vim-jsx-typescript'
Plug 'leafgarland/typescript-vim'

"fuzzy searching favs
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"graphviz & vim
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

"golang helpers
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"Plug 'maralla/completor.vim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

"tags
Plug 'ludovicchabant/vim-gutentags'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"if exists('g:vscode')
"    " VSCode extension
"else
"    " ordinary neovim
"endif

"airline
let g:airline_powerline_fonts = 1

"set encoding for nerdfonts devicons
set encoding=utf8
set guifont="Go\ Mono\ Bold\ Nerd\ Font\ Complete\ Mono"

"gutegtags setting
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['package.json', '.git']
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0

"vim-go with gopls
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

" Common Go commands
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)

" Use new vim 8.2 popup windows for Go Doc
let g:go_doc_popup_window = 1

" Enable lsp for go by using gopls
let g:completor_filetype_map = {}
let g:completor_filetype_map.go = {'ft': 'lsp', 'cmd': 'gopls-remote=auto'}"

" WSL yank support
let s:clip = '/usr/local/bin/clip.exe'  " change this path
if executable(s:clip)
 augroup WSLYank
  autocmd!
  autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
 augroup END
endif

" Use deoplete. has("nvim") == 0; so this disabled
let g:deoplete#enable_at_startup = 0

" Run gofmt on save
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

"" colors 
set background=dark
set t_Co=256
"if (has("termguicolors"))
" set termguicolors
"endif
"syntax enable
" use 256 colors in terminal
if !has("gui_running")
  set t_Co=256
  set term=screen-256color
endif
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
"" Can be enabled or disabled
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeDirArrowExpandable = ' '
let g:NERDTreeDirArrowCollapsible = ' '
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:NERDTreeHighlightFoldersFullName = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
"let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = 'x '
"let g:DevIconsDefaultFolderOpenSymbol = 'x- '

"" Map Nerdtree to CTRL+N
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

"" lightline configuration:
"function! LinterStatus() abort
"    let l:counts = ale#statusline#Count(bufnr(''))
"    let l:all_errors = l:counts.error + l:counts.style_error
"    let l:all_non_errors = l:counts.total - l:all_errors
"    return l:counts.total == 0 ? 'OK' : printf(
"        \   '%d⨉ %d⚠ ',
"        \   all_non_errors,
"        \   all_errors
"        \)
"endfunction
"set statusline+=%=
"set statusline+=\ %{LinterStatus()}

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

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif
"" this is a massive amount of custom code config for coc 
"" look back to see if it is worth it
"" todo
" Textedit might fail if hidden is not set.
set hidden

" coc.nvim settings
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
" Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
if has('nvim')
inoremap <silent><expr> <c-space> coc#refresh()
else
inoremap <silent><expr> <c-@> coc#refresh()
endif
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ?coc#_select_confirm()
  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K: call<SID>show_documentation()<CR>
function! s:show_documentation()
  if
    CocAction('hasProvider','hover')
      call CocActionAsync('doHover')
  else
    call feedkeys('K','in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"start of autocmd mygroup
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
" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>"
: "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrationswith external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
