"""""""""""""""""""""""""""""""""""""""""
"""      My site  : http://0nly.me      "
"""      My email : suprsvn@gmail.com   "
"""""""""""""""""""""""""""""""""""""""""
filetype off
"""""""""""""""""""""""""vundle setting""""""""""""""""""""
set rtp+=$VIM/vimfiles/bundle/vundle/
let path='$VIM/vimfiles/bundle'
call vundle#rc(path)

"""""""""""""""""""""""""install packages""""""""""""""""""
Bundle 'gmarik/vundle'
Bundle 'L9'
Bundle 'FuzzyFinder'

Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
Bundle 'fisadev/vim-ctrlp-cmdpalette'
Bundle 'mattn/emmet-vim'
Bundle 'motemen/git-vim'
Bundle 'kien/tabman.vim'
Bundle 'bling/vim-airline'
Bundle 'rosenfeld/conque-term'
Bundle 'fisadev/FixedTaskList.vim'
Bundle 'tpope/vim-surround'
Bundle 'michaeljsmith/vim-indent-object'
Bundle 'davidhalter/jedi-vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'honza/vim-snippets'
Bundle 'garbas/vim-snipmate'
Bundle 'airblade/vim-gitgutter'
Bundle 'vim-scripts/indentpython.vim--nianyang'
Bundle 'nvie/vim-flake8'
Bundle 'fs111/pydoc.vim'
Bundle 'fisadev/vim-isort'
Bundle 'AutoComplPop'
Bundle 'pyflakes.vim'
Bundle 'IndexedSearch'
Bundle 'matchit.zip'
Bundle 'Wombat'
Bundle 'YankRing.vim'
Bundle 'xptemplate'
Bundle 'plasticboy/vim-markdown'
Bundle 'tomorrow-theme'
Bundle 'lsdr/monokai'
Bundle 'rainbow_parentheses.vim'
Bundle 'Yggdroot/indentLine'

"""""""""""""""""""""""""basic setting"""""""""""""""""""""
filetype plugin indent on
syntax on
set bsdir=buffer
set autochdir
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
set helplang=cn
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
set nocompatible
set nobackup
set ignorecase 
set incsearch
set gdefault
set nu!
set ruler
set shiftwidth=4
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set noautoindent
set clipboard+=unnamed
autocmd! bufwritepost _vimrc source $VIM/_vimrc
colorscheme monokai
"set guifont=Courier_New:h12:cANSI
"set guifontwide=YaHei\ Consolas\ Hybrid:h12
"set guifont=YaHei\ Consolas\ Hybrid:h12
"set guifont=Source\ Code\ Pro\ Semibold:h12
set guifont=Ubuntu\ Mono:h12
set scrolloff=3
set wildmode=list:longest
set ls=2

""""""""""""""""""""""""""""""""""""package settings"""""""""""""""


" toggle Tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on Tagbar open
let g:tagbar_autofocus = 1

" NERDTree (better file browser) toggle
map <F3> :NERDTreeToggle<CR>

" tab navigation
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm 
map tt :tabnew 
map ts :tab split<CR>
map <C-S-Right> :tabn<CR>
imap <C-S-Right> <ESC>:tabn<CR>
map <C-S-Left> :tabp<CR>
imap <C-S-Left> <ESC>:tabp<CR>

" navigate windows with meta+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j

" fix some problems with gitgutter and jedi-vim
let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0

" automatically close autocompletion window
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" old autocomplete keyboard shortcut
imap <C-J> <C-X><C-O>

" show pending tasks list
map <F2> :TaskList<CR>

" removes trailing spaces of python files
" (and restores cursor position)
autocmd BufWritePre *.py mark z | %s/\s\+$//e | 'z

" store yankring history file hidden
let g:yankring_history_file = '.yankring_history'

" save as sudo
ca w!! w !sudo tee "%"

" colors and settings of autocompletion
highlight Pmenu ctermbg=4 guibg=LightGray
" highlight PmenuSel ctermbg=8 guibg=DarkBlue guifg=Red
" highlight PmenuSbar ctermbg=7 guibg=DarkGray
" highlight PmenuThumb guibg=Black


" insert ipdb breakpoint with \b
nmap <leader>b Oimport ipdb;ipdb.set_trace()<ESC>

" CtrlP (new fuzzy finder)
let g:ctrlp_map = ',e'
nmap ,g :CtrlPBufTag<CR>
nmap ,G :CtrlPBufTagAll<CR>
nmap ,f :CtrlPLine<CR>
nmap ,m :CtrlPMRUFiles<CR>
nmap ,c :CtrlPCmdPalette<CR>
" to be able to call CtrlP with default search text
function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    execute ':CtrlP' . a:ctrlp_command_end
    call feedkeys(a:search_text)
endfunction
" CtrlP with default text
nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>
" Don't change working directory
let g:ctrlp_working_path_mode = 0
" Ignore files on fuzzy finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn)$',
  \ 'file': '\.pyc$\|\.pyo$',
  \ }

" Ignore files on NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" simple recursive grep
command! -nargs=1 RecurGrep lvimgrep /<args>/gj ./**/*.* | lopen | set nowrap
command! -nargs=1 RecurGrepFast silent exec 'lgrep! <q-args> ./**/*.*' | lopen
nmap ,R :RecurGrep 
nmap ,r :RecurGrepFast 
nmap ,wR :RecurGrep <cword><CR>
nmap ,wr :RecurGrepFast <cword><CR>

" run pep8+pyflakes validator
autocmd FileType python map <buffer> <leader>8 :call Flake8()<CR>
" rules to ignore (example: "E501,W293")
let g:flake8_ignore=""

" jedi-vim customizations
let g:jedi#popup_on_dot = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#goto_assignments_command = ",a"
let g:jedi#goto_definitions_command = ",d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = ",o"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "1"
nmap ,D :tab split<CR>,d

" Change snipmate binding, to avoid problems with jedi-vim
imap <C-i> <Plug>snipMateNextOrTrigger

" don't let pyflakes allways override the quickfix list
let g:pyflakes_use_quickfix = 0

" tabman shortcuts
let g:tabman_toggle = 'tl'
let g:tabman_focus  = 'tf'

" vim-airline settings
let g:airline_powerline_fonts = 0
let g:airline_theme = 'light'
let g:airline#extensions#whitespace#enabled = 1

" markdown
let g:vim_markdown_folding_disabled=1

" Better Rainbow Parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" IndentLine
let g:indentLine_color_gui = '#A4E57E'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

