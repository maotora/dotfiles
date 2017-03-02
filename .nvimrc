set nocompatible   " Disable vi-compatibility
set encoding=utf-8
set t_Co=256
execute pathogen#infect()
colorscheme PaperColor
set background=dark
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
set linespace=15
set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
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
syntax on
filetype indent on
filetype plugin on
"
" Color Picker Stuff.. ;)
imap <F5> <Esc>:ColorPicker<Cr>a
vmap <F5> <Del><Esc>h:ColorPicker<Cr>a


"using delete key to remove the hlsearch 
nmap <silent> <BS> :nohlsearch<CR>


"JsLint Settings..
let jshint2_read = 1
let jshint2_save = 1
let jshint2_maxheight = 12
let jshint2_minheight = 3

" jshint validation
nnoremap <silent><F1> :JSHint<CR>
inoremap <silent><F1> <C-O>:JSHint<CR>
vnoremap <silent><F1> :JSHint<CR>

" show next jshint error
nnoremap <silent><F2> :lnext<CR>
inoremap <silent><F2> <C-O>:lnext<CR>
vnoremap <silent><F2> :lnext<CR>

" show previous jshint error
nnoremap <silent><F3> :lprevious<CR>
inoremap <silent><F3> <C-O>:lprevious<CR>
vnoremap <silent><F3> :lprevious<CR>

"Vimux stuff
map <Leader>tt :call VimuxRunCommand("clear; npm start ", 0)<CR>

"Color toggle
map <leader>b :ToggleBg<CR>

"search with more characters without escapes..
nnoremap / /\v

"colortoggle stuff..
map <silent> <F5> :call gruvbox#bg_toggle()<CR>
imap <silent> <F5> <ESC>:call gruvbox#bg_toggle()<CR>a
vmap <silent> <F5> <ESC>:call gruvbox#bg_toggle()<CR>gv

"Yeah changing the map leader key to comma. It's easier that way.
let mapleader = ","
let g:mapleader = ","

" Map J and K keys to move through tabs...
"
nmap J gt
nmap K gT
"  
" " Fast saves
nmap <leader>w :w!<cr>
"  
" Fast quit, Boy i'm really lazy
nmap <leader>q :q!<cr>

" " Down is really the next line
nnoremap j gj
nnoremap k gk
"  
""Easy escaping to normal model
imap jj <esc>

" Mapping redo.. this could be a bad practise but then
nmap rr :redo<cr>
"  
" "Auto change directory to match current file ,cd
" nnoremap ,cd :cd %:p:h<CR>:pwd<CR>
"  
" "easier window navigation
" Open splits
nmap vs :vsplit<cr>
nmap sp :split<cr>
"  

nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

"  
" "Resize vsplit
" nmap <C-v> :vertical resize +5<cr>
" nmap 25 :vertical resize 40<cr>
" nmap 50 <c-w>=
" nmap 75 :vertical resize 120<cr>
"  
nmap <leader>1 :NERDTreeToggle<cr>
"  
" "Load the current buffer in Chrome
" nmap ,c :!open -a Google\ Chrome<cr>
"  
" "Show (partial) command in the status line
set showcmd
"  
" " Create split below
nmap :sp :rightbelow sp<cr>
"  
" " Quickly go forward or backward to buffer
nmap :bp :BufSurfBack<cr>
nmap :bn :BufSurfForward<cr>
"  
" highlight Search cterm=underline
"  
" " Swap files out of the project root
" set backupdir=~/.vim/backup//
" set directory=~/.vim/swap//
"  
" Easy motion stuff
" let g:EasyMotion_leader_key = '<Leader>'
"  
" " Powerline (Fancy thingy at bottom stuff)
"set laststatus=2   " Always show the statusline
"set encoding=utf-8 " Necessary to show Unicode glyphs
"set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
" Set up the status line
fun! <SID>SetStatusLine()
    let l:s1="%-3.3n\\ %f\\ %h%m%r%w"
    let l:s2="[%{strlen(&filetype)?&filetype:'?'},%{&encoding},%{&fileformat}]"
    let l:s3="%=\\ 0x%-8B\\ \\ %-14.(%l,%c%V%)\\ %<%P"
    execute "set statusline=" . l:s1 . l:s2 . l:s3
endfun
set laststatus=2
call <SID>SetStatusLine()

let g:airline_theme='base16'
" required if using https://github.com/bling/vim-airline
let g:airline_powerline_fonts = 1
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12

" vim-airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 0
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']

set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
set errorformat=%f:%l:%c:%*\d:%*\d:%*\s%m
call airline#themes#base16#refresh()

"  
" autocmd cursorhold * set nohlsearch
" autocmd cursormoved * set hlsearch
"  
" " Remove search results
" command! H let @/=""
"  
" " If you prefer the Omni-Completion tip window to close when a selection is
" " made, these lines close it on movement in insert mode or when leaving
" " insert mode
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"  
" " Edit todo list for project
" nmap ,todo :e todo.txt<cr>
"  
"              
" Create/edit file in the current directory
" nmap :ed :edit %:p:h/
"
"
" VimuxCommands and stuff..
"
" fap stuff..
map <F8> :exec '!mplayer $(youtube-dl -g ' . shellescape(getline('.')) . ')' <CR><CR>
"
"
" Using persistence Undo....
set undodir=$HOME/.Vim_undo_files
set undolevels=5000

if has('persistent_undo')
    set undofile
endif
"
" Now Using tabs for autocompletion in vim : commands.
" Whenever tab now, vim will show a list, and longest & full will try to 
" suggest some for me.. ;) Pretty cool huh!?
set wildmode=list:longest,full

"
" Cursors .. some guidence..
set cursorline
set cursorcolumn
" Wish i set cursorcolumn too
"
" Panes zooming code from 
"   http://vim.wikia.com/wiki/Window_zooming_convenience
"This function turns Rolodex Vim on or off for the current tab
"If turning off, it sets all windows to equal height
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
 
"This function clears the Rolodex Vim settings and restores the previous values
function! ClearRolodexSettings()
    "Assume if one exists they all will
    if exists("g:remember_ea") > 0
        let &equalalways=g:remember_ea
        let &winheight=g:remember_wh
        let &winminheight=g:remember_wmh
        let &helpheight=g:remember_hh
    endif
endfunction
 
"This function set the Rolodex Vim settings and remembers the previous values for later
function! SetRolodexSettings()
    if exists("t:rolodex_tab") > 0
        let g:remember_ea=&equalalways
        let g:remember_wh=&winheight
        let g:remember_wmh=&winminheight
        let g:remember_hh=&helpheight
        set noequalalways winminheight=0 winheight=9999 helpheight=9999
    endif
endfunction
 
"These two autocmds make Vim change the settings whenever a new tab is selected
"We have to use TabLeave to always clear them.  If we try and turn them off
"in TabEnter, it is too late ( I think, since WinEnter has already been called and triggered the display)
au TabLeave * call ClearRolodexSettings()
au TabEnter * call SetRolodexSettings()
 
"With this mapping, F2 toggles a tab to be Rolodex style
noremap <F2> :call ToggleRolodexTab()<CR>

"======================= Some other Zooming function ===================
"This one isn't a per tab basis.. =======================================
"toggles whether or not the current window is automatically zoomed

function! ToggleMaxWins()
  if exists('g:windowMax')
    au! maxCurrWin
    wincmd =
    unlet g:windowMax
  else
    augroup maxCurrWin
        " au BufEnter * wincmd _ | wincmd |
        "
        " only max it vertically
        au! WinEnter * wincmd _
    augroup END
    do maxCurrWin WinEnter
    let g:windowMax=1
  endif
endfunction
nnoremap <Leader>m :call ToggleMaxWins()<CR>

"Comment with filetypes .... yei..

"Javascript Groups
augroup JavascriptCmd
    autocmd Filetype javascript nnoremap <leader>c I//<esc>
    autocmd Filetype javascript nnoremap <leader>f O/*<esc>o*/<esc>
augroup END

"html-autocmd
autocmd Filetype html nnoremap <leader>c I<!--<esc>A--><esc>

"wrapping inserts
set wrap
set linebreak
set showbreak=>>\ 

"Scrolling effects
set scrolloff=10

"The wild menu, for autocompleting vim commands
set wildmenu

"fzf stuffs
"https://github.com/junegunn/fzf.vim
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
" - window (nvim only)
let g:fzf_layout = { 'down': '~40%' }

" Advanced customization using autoload functions
autocmd VimEnter * command! Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'})

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

"Make sentence function, I swear I don't know what it does.. 
"butt.. Looks awesome, btw ( you see what i did there .. ) hehehe..
function! s:make_sentence(lines)
  return substitute(join(a:lines), '^.', '\=toupper(submatch(0))', '').'.'
endfunction

inoremap <expr> <c-x><c-s> fzf#complete({
  \ 'source':  'cat /usr/share/dict/words',
  \ 'reducer': function('<sid>make_sentence'),
  \ 'options': '--multi --reverse --margin 15%,0',
  \ 'left':    20})

