" plug init {{{
call plug#begin('~/.config/nvim/plugged')
  
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'scrooloose/nerdtree'
  
  "  Plug 'vim-syntastic/syntastic'

  Plug 'neomake/neomake'
  
  Plug 'sirver/ultisnips'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-fugitive'
  Plug 'digitaltoad/vim-pug'
  Plug 'Valloric/YouCompleteMe'
  
  Plug 'hhsnopek/vim-sugarss'
  " local ultisnips
  " Plug '/.vim/bundle/mysnips' " this is lost...

call plug#end()
"}}}

set t_Co=256
syntax enable
colorscheme badwolf

set number " line numbers 
set hidden " when a buffer is hidden it doesn't get closed

" Set foldmethod {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Set dictionary
set dictionary+=/usr/share/dict/words

" The default 20 isn't nearly enough
set history=9999


" Show the column/row
set ruler
" Show the matching when doing a search
set showmatch

" Allows the backspace to delete indenting, end of lines, and over the start
" of insert
set backspace=indent,eol,start

" Ignore case when doing a search as well as highlight it as it is typed
set ignorecase smartcase
set hlsearch
set incsearch

" Don't show the startup message
set shortmess=atI

" Show the current command at the bottom
set showcmd

" Disable beeping and flashing.
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Use smarter defaults
set smartindent
set smarttab
" Use autoindenting
set autoindent

" The tabstop look best at 2 spacing
set tabstop=2
set softtabstop=2
set shiftwidth=2

" spaces to indent from here on out
set expandtab

" Default utility folders {{{
" let prefix = $HOME.'/.local/share/nvim/' " this setting depends on if nvim or vim
function CreateUtilFolders(...)
    for d in a:000
        if !isdirectory($HOME.'/.config/nvim/'.d)
           call mkdir($HOME.'/.config/nvim/'.d, "p")
        endif
    endfor
endfunction

call CreateUtilFolders('undo/', 'swap/', 'backup/')

" Turn on persistent undo
" Thanks, Mr Wadsten: github.com/mikewadsten/dotfiles/
if has('persistent_undo')
    set undodir=~/.config/nvim/undo//
    set undofile
    set undolevels=1000
    set undoreload=10000
endif
" Better completion
set completeopt+=longest,menuone,preview
" Use backups
" Source:
"   http://stackoverflow.com/a/15317146
set backupcopy=yes " prevents safewrite feature for --watch rollup option
set backup
set writebackup
set backupdir=~/.config/nvim/backup//
" Use a specified swap folder
" Source:
"   http://stackoverflow.com/a/15317146
set directory=~/.config/nvim/swap//
" }}}

" Show two lines for the status line
set laststatus=2

" Always show the last line
set display+=lastline

" UTF-8 
set encoding=utf-8

" Enhanced mode for command-line completion
set wildmenu

" Automatically re-read the file if it has changed
set autoread

" space as leader rocks
nnoremap <Space> <Nop>
let mapleader = "\<Space>"

" easy save file 
nmap <leader>w :w<cr>

" To open a new empty buffer
nmap <leader>T :enew<cr>
" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close a buffer
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Show only selected in Visual Mode
nmap <silent> <leader>th :cal ToggleSelected(0)<cr>
vmap <silent> <leader>th :cal ToggleSelected(1)<cr>

" Split the window using some nice shortcuts
nmap <leader><bar> :vsplit<cr>
nmap <leader>- :split<cr>
" nmap <leader>s? :map <leader>s<cr>

" use <C + h j k l keys to move through windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Unhighlight the last search pattern on Enter
nn <silent> <cr> :nohlsearch<cr><cr>

" Control enhancements in insert mode
imap <C-F> <right>
imap <C-B> <left>
imap <M-BS> <esc>vBc
imap <C-P> <up>
imap <C-N> <down>


" When pushing j/k on a line that is wrapped, it navigates to the same line,
" just to the expected location rather than to the next line
nnoremap j gj
nnoremap k gk

" Use actually useful arrow keys
map <right> :bn<cr>
map <left> :bp<cr>
map <up> <nop>
map <down> <nop>

" remap the digraph feature because currently it get overwritten by Ultisnips
inoremap <C-d> <C-k>

" Add paste shortcut
nmap <leader>P "+p

" airline settings  {{{
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_alt_sep = '|'

  
" let g:airline_left_alt_sep= ''
" let g:airline_right_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
" }}}

" syntastic settings (disabled) {{{
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_loc_list_height = 5
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 1
"let g:syntastic_javascript_checkers = ['eslint']
"
"let g:syntastic_error_symbol = '❌'
"let g:syntastic_style_error_symbol = '⁉️'
"let g:syntastic_warning_symbol = '⚠️'
"let g:syntastic_style_warning_symbol = '💩'
"
"highlight link SyntasticErrorSign SignColumn
"highlight link SyntasticWarningSign SignColumn
"highlight link SyntasticStyleErrorSign SignColumn
"highlight link SyntasticStyleWarningSign SignColumn
" }}}

"neomake and eslint/tslint {{{  
"if you remove the hardcoded reference to the node_modules folder it falls
" back to global (npm i -g eslint)
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
let g:neomake_javascript_enabled_makers = ['eslint']


" cannot use local tslint
"let g:neomake_typescript_tslint_exe = $PWD .'/node_modules/.bin/tslint'
"let g:neomake_typescript_enabled_makers = ['tslint']
" you can switch this 1-3
let g:neomake_verbose=1    
autocmd! BufWritePost * Neomake
"}}}


" set filetype for ts and use js syntax highlighting {{{
autocmd BufNewFile,BufRead *.ts,*.tsx 
  \ set filetype=typescript |
  \ set syntax=javascript 
" }}}

" CtrlP settings {{{
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site|node_modules)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}
" Use a leader instead of the actual named binding
nmap <leader>p :silent :CtrlP<cr>
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr> 
" Exclude any .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" Show hidden files by default
let g:ctrlp_show_hidden = 1

" set starting directory as file location
let g:ctrlp_working_path_mode = 'a'
"}}}

" NERDTree settings {{{
nmap <leader>nt :NERDTreeToggle<cr>
nmap <F2> :NERDTree
" leaving the command for NERDTree open on purpose
" }}}

" UltiSnips {{{
let g:UltiSnipsSnippetsDirectories=['~/.vim/UltiSnips'] " lost
let g:UltiSnipsExpandTrigger           = '<c-k>'
let g:UltiSnipsJumpForwardTrigger      = '<c-k>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-c-k>'
" }}} 


" Allow saving of files as sudo when I forgot to start vim using sudo.
" and when we need to modify stuff as root..
cmap w!! w !sudo tee > /dev/null %

