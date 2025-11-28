" Use vim-plug instead of pathogen; auto-install if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible   " Disable vi-compatibility
set t_Co=256

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'altercation/vim-colors-solarized'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'scrooloose/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'spolu/dwm.vim'
Plug 'morhetz/gruvbox'
Plug 'othree/html5.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'ldong/vim_loremipsum'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'NLKNguyen/papercolor-theme'
Plug 'gcmt/taboo.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chrisbra/vim-autoread'
Plug 'saghul/vim-colortoggle'
Plug 'tpope/vim-commentary'
Plug 'ryanoasis/vim-devicons'
Plug 'amadeus/vim-evokai'
Plug 'tpope/vim-fugitive'
Plug 'leshill/vim-json'
Plug 'plasticboy/vim-markdown'
Plug 'xolox/vim-misc'
Plug 'moll/vim-node'
Plug 'xolox/vim-notes'
Plug 'reedes/vim-pencil'
Plug 'sheerun/vim-polyglot'
Plug 'krisajenkins/vim-postgresql-syntax'
Plug 'epilande/vim-react-snippets'
Plug 'ivalkeen/vim-simpledb'
Plug 'hhsnopek/vim-sugarss'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'seyDoggy/vim-watchforchanges'
Plug 'vim-scripts/vim-webdevicons'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Shougo/denite.nvim'
Plug 'vim-scripts/ZoomWin'
Plug 'vim-scripts/Wombat'
Plug 'lifepillar/vim-solarized8'
Plug 'cocopon/iceberg.vim'
Plug 'haishanh/night-owl.vim'
Plug 'eugen0329/vim-esearch'
Plug 'iamcco/coc-tailwindcss',  {'do': 'yarn install --frozen-lockfile && yarn run build'}
Plug 'prisma/vim-prisma'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'Equilibris/nx.nvim'
" Plug 'w0rp/ale'
Plug 'f-person/git-blame.nvim'
call plug#end()

" Safely set colorscheme (first run may not have plugins installed yet)
if empty(glob('~/.vim/plugged/jellybeans.vim/colors/jellybeans.vim'))
  colorscheme default
else
  colorscheme jellybeans
endif
set background=dark
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
set linespace=15
set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=2                   " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=2               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=2                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set relativenumber
set number                      " always show line numbers
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set timeout timeoutlen=200 ttimeoutlen=100
set visualbell           " don't beep
set noerrorbells         " don't beep
set autowrite  "Save on buffer switch
set mouse=a
set incsearch "incremental dynamic search..
set hlsearch  "highlight search results
set smartindent
set autoread
syntax on
filetype indent on
filetype plugin on

" Function to toggle airline theme based on background with optional colorscheme
function! ToggleAirlineTheme(...)
    " Get current background setting
    let current_bg = &background
    
    " Define default theme pairs for airline (dark_theme, light_theme)
    let theme_pairs = {
        \ 'dark': {
            \ 'airline': 'base16_twilight',
            \ 'background': 'dark'
        \ },
        \ 'light': {
            \ 'airline': 'papercolor',
            \ 'background': 'light'
        \ }
    \ }
    
    " Check if a specific colorscheme was provided
    let override_theme = a:0 >= 1 ? a:1 : ''
    
    " Toggle between dark and light
    if current_bg ==# 'dark'
        let target = theme_pairs.light
    else
        let target = theme_pairs.dark
    endif
    
    " If a theme was provided, set only the colorscheme
    if !empty(override_theme)
        " Set the colorscheme
        execute 'colorscheme ' . override_theme
    endif
    
    " Set the new background
    execute 'set background=' . target.background
    
    " Set the airline theme based on background mode
    execute 'AirlineTheme ' . target.airline
    
    " Refresh airline
    if exists(':AirlineRefresh')
        AirlineRefresh
    endif
    
    " Display the change
    if !empty(override_theme)
        echo 'Switched to ' . target.background . ' mode with ' . override_theme . ' colorscheme and ' . target.airline . ' airline theme'
    else
        echo 'Switched to ' . target.background . ' mode with ' . target.airline . ' airline theme'
    endif
endfunction

" Key mapping for simple toggle (uses defaults)
nnoremap <F6> :call ToggleAirlineTheme()<CR>

" Commands that allow theme specification
command! -nargs=? AirlineDark call ToggleAirlineTheme(<q-args>)
command! -nargs=? AirlineLight call ToggleAirlineTheme(<q-args>)

" Optional: Sync with your existing background toggle (uses defaults)
map <silent> <F5> :call ToggleAirlineTheme()<CR>:colorscheme PaperColor()<CR>

" Color Picker Stuff.. ;)
imap <F5> <Esc>:ColorPicker<Cr>a
vmap <F5> <Del><Esc>h:ColorPicker<Cr>a

map <F7> mzgg=G`z

"add python
let g:python3_host_prog = '/usr/bin/python3'
" Use stable Node LTS (24) for coc.nvim
let g:coc_node_path = '/opt/homebrew/opt/node@24/bin/node'

"using backspace key to remove the hlsearch 
nmap <silent> <BS> :nohlsearch<CR>

"Taboo remembering tabe names in session option
set sessionoptions+=tabpages,globals

" Settings for tab names as from my vi question & answer
let g:taboo_tab_format=" %P%m "
set autochdir

"Emmet leader key
let g:user_emmet_leader_key = ','

" Dart settings
let dart_html_in_string=v:true
let dart_style_guide = 2
let dart_format_on_save = 1

" Well it's about time we do some notes
:let g:notes_directories = ['~/Documents/Notes', '~/bin/gitfiles/notes']

"Color toggle
map <leader>b :ToggleBg<CR>

"search with more characters without escapes..
nnoremap / /\v

"colortoggle stuff..
map <silent> <F5> :call ToggleAirlineTheme()<CR>:ToggleBg <CR>
imap <silent> <F5> <ESC>:ToggleBg <CR>a
vmap <silent> <F5> <ESC>:ToggleBg <CR>gv

"Yeah changing the map leader key to comma. It's easier that way.
let mapleader = ","
let g:mapleader = ","

" Map J and K keys to move through tabs...
nmap K gt
nmap J gT

" Fast saves
nmap <leader>w :w!<cr>

" Fast quit, Boy i'm really lazy
nmap <leader>q :q!<cr>

" Down is really the next line
nnoremap j gj
nnoremap k gk

"Easy escaping to normal model
imap jj <esc>

" Mapping redo
nmap rr :redo<cr>

" Open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>

"Moving through buffers
nmap <C-H> :bprev<cr>
nmap <C-L> :bnext<cr>

" Create split below
nmap :sp :rightbelow sp<cr>

"Music!
nnoremap <Leader>m :CtrlPMpc<CR>

"Some basic settings
let g:ctrlp_mpc_cmd = 'mpc --port 6601 --host 127.0.0.1'

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fgg <cmd>Telescope git_files<cr>

"Okay Disable if you love the good old swap backup files, i don't enjoy 'em
"PLus Cool boys use Git!
set nobackup
set noswapfile

"OKay folding stuff
set foldmethod=syntax
set foldlevelstart=1

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

" vim-airline configuration
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 0
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']

" Function for Inspire text in section_a
function! AccentDemo()
  let keys = ['I','n','s','p','i','r','e']
  for k in keys
    call airline#parts#define_text(k, k)
  endfor
  call airline#parts#define_accent('I', 'green')
  call airline#parts#define_accent('n', 'blue')
  call airline#parts#define_accent('s', 'green')
  call airline#parts#define_accent('p', 'blue')
  call airline#parts#define_accent('i', 'blue')
  call airline#parts#define_accent('r', 'green')
  call airline#parts#define_accent('e', 'blue')
  let g:airline_section_a = airline#section#create(keys)
endfunction

" Function to smartly truncate filepath
function! SmartPath()
    let path = expand('%:p')
    let filename = expand('%:t')
    let path_without_file = expand('%:p:h')
    let max_len = 48
    
    if path == ''
        return '[No File]'
    endif
    
    if len(filename) > max_len
        return '…' . filename[-(max_len-1):]
    endif
    
    let filename_len = len(filename)
    let available_len = max_len - filename_len - 1
    
    if len(path_without_file) <= available_len
        return path
    endif
    
    let components = split(path_without_file, '/')
    let result = ''
    let index = len(components) - 1
    
    while index >= 0
        let next_component = components[index]
        if len(result) + len(next_component) + 1 > available_len
            return '…/' . result . filename
        endif
        let result = next_component . '/' . result
        let index -= 1
    endwhile
    
    return result . filename
endfunction

" Configure airline basics
let g:airline_section_c = '%{SmartPath()}'
let g:airline#extensions#tabline#enabled = 1
let g:airline_detect_modified = 1
let g:airline_theme = 'base16_twilight'

" Initialize on startup
autocmd VimEnter * call AccentDemo()

" Additional airline settings
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 0
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']

" Using persistence Undo
set undodir=$HOME/.Vim_undo_files
set undolevels=5000

if has('persistent_undo')
    set undofile
endif

" Wildmode settings for command completion
set wildmode=list:longest,full

" Cursor settings
" Cursors settings
set cursorline
set cursorcolumn

" Rolodex/Window zooming functions
function! ToggleRolodexTab()
    if exists("t:rolodex_tab") > 0
        unlet t:rolodex_tab
        call ClearRolodexSettings()
        execute "normal \<C-W>="
    else
        let t:rolodex_tab = 1
        call SetRolodexSettings()
    endif
endfunction

function! ClearRolodexSettings()
    if exists("g:remember_ea") > 0
        let &equalalways=g:remember_ea
        let &winheight=g:remember_wh
        let &winminheight=g:remember_wmh
        let &helpheight=g:remember_hh
    endif
endfunction

function! SetRolodexSettings()
    if exists("t:rolodex_tab") > 0
        let g:remember_ea=&equalalways
        let g:remember_wh=&winheight
        let g:remember_wmh=&winminheight
        let g:remember_hh=&helpheight
        set noequalalways winminheight=0 winheight=9999 helpheight=9999
    endif
endfunction

" Autocmds for tab settings
au TabLeave * call ClearRolodexSettings()
au TabEnter * call SetRolodexSettings()

" F2 toggles Rolodex style
noremap <F2> :call ToggleRolodexTab()<CR>

" Window maximization toggle function
function! ToggleMaxWins()
  if exists('g:windowMax')
    au! maxCurrWin
    wincmd =
    unlet g:windowMax
  else
    augroup maxCurrWin
        au! WinEnter * wincmd _
    augroup END
    do maxCurrWin WinEnter
    let g:windowMax=1
  endif
endfunction

" File type specific comment mappings
augroup JavascriptCmd
    autocmd Filetype javascript nnoremap <leader>c I//<esc>
    autocmd Filetype javascript nnoremap <leader>f O/*<esc>o*/<esc>
augroup END

autocmd Filetype html nnoremap <leader>c I<!--<esc>A--><esc>

" Text wrapping settings
set wrap
set linebreak
set showbreak=>>\ 

" Scroll offset
set scrolloff=10

" React settings
let g:jsx_ext_required = 0
let g:jsx_pragma_required = 0

" Prose mode function
function! Prose()
  call pencil#init()
  nnoremap <buffer> <silent> Q gqap
  xnoremap <buffer> <silent> Q gq
  nnoremap <buffer> <silent> <leader>Q vapJgqap
  nnoremap <buffer> <c-s> [s1z=<c-o>
  inoremap <buffer> <c-s> <c-g>u<Esc>[s1z=`]A<c-g>u
  iabbrev <buffer> -- –
  iabbrev <buffer> --- —
  iabbrev <buffer> << «
  iabbrev <buffer> >> »
  setlocal foldlevel=6
endfunction

" Auto-initialize prose mode for certain filetypes
autocmd FileType md,markdown,mkd,text call Prose()

" Clear registers command
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

" Manual prose mode command
command! -nargs=0 Prose call Prose()

" Watch for changes commands
command! -bang WatchForChanges :call WatchForChanges(@%, {'toggle': 1, 'autoread': <bang>0})
command! -bang WatchForChangesWhileInThisBuffer :call WatchForChanges(@%, {'toggle': 1, 'autoread': <bang>0, 'while_in_this_buffer_only': 1})
command! -bang WatchForChangesAllFile :call WatchForChanges('*', {'toggle': 1, 'autoread': <bang>0})

" WatchForChanges function
function! WatchForChanges(bufname, ...)
    " [Function implementation remains the same as in your original file]
endfunction

" PSQL syntax setting
au BufRead /tmp/psql.edit.* set syntax=sql

" Git blame settings
let g:gitblame_enabled = 0
let g:gitblame_message_template = '<summary> ¥ <date> ¥ <author>'
let g:gitblame_date_format = '%r'

" Airline branch truncation function
function! AirlineTruncateBranch()
    let branch = get(g:, 'airline_section_b', '')
    let max_len = 30
    let truncate_emoji = '🙆😮💨'
    let branch_name = fugitive#Head()
    if len(branch_name) > max_len
        let truncated = branch_name[0:max_len-2] . truncate_emoji
        return ' ' . truncated
    endif
    return ' ' . branch_name
endfunction

" Configure airline to use truncation
let g:airline_section_b = '%{AirlineTruncateBranch()}'

" NERDTree Configuration
nmap <leader>1 :NERDTreeToggle<CR>

let g:NERDTreeChDirMode = 2  " Change Vim's current working directory when opening NERDTree
let g:NERDTreeShowHidden = 1  " Show hidden files by default
let g:NERDTreeAutoDeleteBuffer = 1  " Automatically delete the buffer of the file you just deleted
let g:NERDTreeMinimalUI = 0  " Show the .. on top for directory navigation
let g:NERDTreeDirArrows = 1  " Use nice arrow symbols
let g:NERDTreeCaseSensitiveSort = 0  " Case-insensitive sorting

" Additional navigation settings
let g:NERDTreeMapUpdir = '..'  " Map .. to go up a directory
let g:NERDTreeMapUpdirKeepOpen = '.'   " Go up but keep NERDTree open
let g:NERDTreeShowLineNumbers = 0  " Show line numbers in NERDTree

" Setup NERDTree mapping for preview
augroup NERDTreePreview
    autocmd!
    autocmd FileType nerdtree nnoremap <buffer> P :call CreatePreviewWindow()<CR>
augroup END

function! CreatePreviewWindow()
    " Get the current node
    let l:current_file = g:NERDTreeFileNode.GetSelected()
    
    " Only proceed if it's a file (not a directory)
    if l:current_file != {} && !l:current_file.path.isDirectory
        let l:file_path = l:current_file.path.str()
        
        " Calculate window size (80% of editor size)
        let width = float2nr(&columns * 0.8)
        let height = float2nr(&lines * 0.8)
        
        " Calculate starting position
        let horizontal = float2nr((&columns - width) / 2)
        let vertical = float2nr((&lines - height) / 2)
        
        " Define window options
        let opts = {
            \ 'relative': 'editor',
            \ 'row': vertical,
            \ 'col': horizontal,
            \ 'width': width,
            \ 'height': height,
            \ 'style': 'minimal',
            \ 'border': 'rounded'
            \ }
            
        " Close existing preview if it exists
        if exists('g:preview_winid') && nvim_win_is_valid(g:preview_winid)
            call nvim_win_close(g:preview_winid, v:true)
        endif
        
        " Create the buffer
        let buf = nvim_create_buf(v:false, v:true)
        
        " Read file content into buffer
        call nvim_buf_set_lines(buf, 0, -1, v:true, readfile(l:file_path))
        
        " Create the window
        let g:preview_winid = nvim_open_win(buf, v:true, opts)
        
        " Set buffer options
        setlocal
            \ buftype=nofile
            \ noswapfile
            \ nomodifiable
            \ cursorline
            \ relativenumber     " Enable relative line numbers
            \ number            " Show current line number
            
        " Inherit current colorscheme
        let current_bgcolor = synIDattr(hlID("Normal"), "bg")
        let current_fgcolor = synIDattr(hlID("Normal"), "fg")
        
        " Set window highlights to match current theme
        call nvim_win_set_option(g:preview_winid, 'winhl', 'Normal:Normal,FloatBorder:Normal')
        
        " Set background and foreground colors if they exist
        if current_bgcolor != ""
            exec 'hi PreviewWindow guibg=' . current_bgcolor
            call nvim_win_set_option(g:preview_winid, 'winhl', 'Normal:PreviewWindow,FloatBorder:PreviewWindow')
        endif
        
        " Detect and set filetype for syntax highlighting
        exec 'filetype detect'
        
        " Enable current colorscheme and syntax highlighting
        syntax enable
        
        " Add mappings for the preview window
        nnoremap <buffer> q :q<CR>
        nnoremap <buffer> <ESC> :q<CR>
        nnoremap <buffer> p :q<CR>
        
        " Create autocommands to update preview window colors when colorscheme changes
        augroup PreviewColors
            autocmd!
            autocmd ColorScheme * call UpdatePreviewColors()
        augroup END
    endif
endfunction

function! UpdatePreviewColors()
    if exists('g:preview_winid') && nvim_win_is_valid(g:preview_winid)
        let current_bgcolor = synIDattr(hlID("Normal"), "bg")
        if current_bgcolor != ""
            exec 'hi PreviewWindow guibg=' . current_bgcolor
            call nvim_win_set_option(g:preview_winid, 'winhl', 'Normal:PreviewWindow,FloatBorder:PreviewWindow')
        endif
    endif
endfunction

" Optional: Add a command to toggle preview functionality
command! ToggleNERDTreePreview let g:nerdtree_preview_enabled = !get(g:, 'nerdtree_preview_enabled', 0)
