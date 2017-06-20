"""""""""""""""" POWELINE CONF """"""""""""""""
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
" enable powerline for vim even if only 1 file is open
set laststatus=2

""""""""""""""""" TMUX CONF """""""""""""""""""""
set term=screen-256color

""""""""""""""""" EDITOR CONF """""""""""""""""""
" set spacing conf
set expandtab
set shiftwidth=2
set softtabstop=2
set ts=2 sw=2 et
" vim syntax highlight
syntax on 
" line numbers
set nu
set numberwidth=3
" pane splits
set splitbelow
set splitright
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
" highlights whole line
set cursorline

" autotrim whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" css/scss autocomplete
autocmd BufNewFile,BufRead *.scss             set ft=scss.css
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" Remap code completion to Ctrl+Space {{{2
inoremap <Nul> <C-x><C-o>

" remap vim switch panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" remap vim splitpane resize
nnoremap <Leader>= :vertical resize +15<CR>
nnoremap <Leader>+ :resize +15<CR>
nnoremap <Leader>- :vertical resize -15<CR>
nnoremap <Leader>_ :resize -15<CR>

map U :redo<CR>
" Allow saving of files as sudo when I forgot to start vim using sudo
cmap w!! w !sudo tee > dev/null %

cabbr <expr> %% expand('%:p:h')   " entering %% expands current working dir
set so=5                          " must be at least 5 lines from top/bottom

""""""""""""""""" PLUGINS """""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'airblade/vim-gitgutter'
Plugin 'valloric/youcompleteme'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'pangloss/vim-javascript'
Plugin 'raimondi/delimitmate'
Plugin 'ap/vim-buftabline'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" SYNTASTIC SETTINGS
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_scss_checkers= ['scss_lint']
let g:syntastic_html_tidy_ignore_errors = [
  \'missing </label> before <div>',
  \'inserting implicit <label>',
  \'discarding unexpected </label>',
  \'trimming empty <label>',
  \]

" NERD TREE "
" opens nerd tree if directory is opened
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" close vim if only nerd tree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" open nerd tree
map ,f :NERDTreeToggle<CR>
" show hidden files
let NERDTreeShowHidden=1
" ignore
let NERDTreeIgnore=['.git$', '\.swp$', '.swo$', '.sass-cache']
autocmd FileType nerdtree noremap <buffer> v :call nerdtree#ui_glue#invokeKeyMap("s")<CR>
autocmd FileType nerdtree noremap <buffer> h :call nerdtree#ui_glue#invokeKeyMap("i")<CR>

" NERD COMMENTER "
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" CTRL-P "
map ,<Space> :CtrlP<CR>
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_prompt_mappings = { 'AcceptSelection("h")': ['<c-h>'] }

" VIM-GITGUTTER "
set updatetime=250

" INDENT GUIDE "
let g:indent_guides_enable_on_vim_startup = 1
" only start indent guide on second level
let g:indent_guides_start_level = 2
" use custom colors
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=grey ctermbg=238
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=black ctermbg=235


" YCM "
let g:ycm_complete_in_comments = 1
map ,g :YcmCompleter GoTo<CR>
map ,b :YcmCompleter GoToReferences<CR>

" BUFTAB "
set hidden
nnoremap <C-n> :bnext<CR>
nnoremap <C-m> :bprev<CR>

""""""""""""""""" PLUGINS DONE """""""""""""""""
colo railscasts 
set noshowmode                  " hide insert below statusline
set showcmd                     " show the last command"
set showmatch                   " show matching bracket
set wildmenu                    " enhanced completion"
