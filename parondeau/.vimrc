""""""""""""" Custom """"""""""""""""

set nocompatible
syntax on

set expandtab
set shiftwidth=2
set softtabstop=2
set ts=2 sw=2 et
set nu
set numberwidth=3

" Split to right and bottom
set splitbelow
set splitright
set so=5
set cursorline
set laststatus=2
set term=screen-256color
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
" fixes backspace issues
set backspace=indent,eol,start
" Hide the default mode text (e.g. -- INSERT -- below the statusline)
set noshowmode
set showmatch                   " show matching bracket
set wildmenu                    " enhanced completion"

colorscheme codedark

imap jj <Esc>

" Easier navigation between panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" remap vim splitpane resize
nnoremap <Leader>= :vertical resize +15<CR>
nnoremap <Leader>+ :resize +15<CR>
nnoremap <Leader>- :vertical resize -15<CR>
nnoremap <Leader>_ :resize -15<CR>

" Remap code completion to Ctrl+Space {{{2
inoremap <Nul> <C-x><C-o>

" Buffers
set hidden
nnoremap <C-n> :bnext<CR>
nnoremap <C-m> :bprev<CR>

" allow %% -> current dir
cabbr <expr> %% expand('%:p:h')
map U :redo<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" autotrim whitespace on save
autocmd BufWritePre * %s/\s\+$//e

"""""""""""""" PACKAGES """""""""""""""""

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"Plugin 'pangloss/vim-javascript'
"Plugin 'scrooloose/syntastic'
"Plugin 'valloric/youcompleteme'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'raimondi/delimitmate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tomasiser/vim-code-dark'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()
filetype plugin indent on

""""""" NERD TREE/COMMENTER """"""

" opens nerd tree if directory is opened
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code
" indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
let g:NERDTreeShowHidden=1

" Open file pane
nmap ,f :NERDTreeToggle<CR><CR>

"""""" CTRL P """""""
nmap ,<Space> :CtrlP<CR>
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_prompt_mappings = { 'AcceptSelection("h")': ['<c-h>'] }

" VIM-GITGUTTER "
set updatetime=250

""""""""""""" SYNTASTIC SETTINGS """"""""""""""""""

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_scss_checkers= ['scss_lint']
let g:syntastic_html_tidy_ignore_errors = [
  \'missing </label> before <div>',
  \'inserting implicit <label>',
  \'discarding unexpected </label>',
  \'trimming empty <label>',
  \]

""""""""""""""  Indent Guide """"""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=grey ctermbg=238
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=black ctermbg=235

""""""""""" YCM """""""""""""""
let g:ycm_complete_in_comments = 1
map ,g :YcmCompleter GoTo<CR>
map ,b :YcmCompleter GoToReferences<CR>

"""""""""" AIRLINE """""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'

"""""""" vim-bookmarks """""""""
let g:bookmark_sign = '¿'
let g:bookmark_center = 1
let g:bookmark_highlight_lines = 1
highlight BookmarkLine ctermbg=78 ctermfg=161
highlight BookmarkSign ctermfg=78

