set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

" Vundle Plugins Dependencies
" xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'honza/vim-snippets'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Chiel92/vim-autoformat'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Townk/vim-autoclose'
"
" Programming
"
Plugin 'mattn/emmet-vim'
Plugin 'groenewege/vim-less'
Plugin 'fatih/vim-go'
Plugin 'shawncplus/phpcomplete.vim'
" 
" Themes
"
Plugin 'jordwalke/flatlandia'
Plugin 'flazz/vim-colorschemes'
call vundle#end()

" THEMES
" xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
syntax enable
" colorscheme flatlandia
colorscheme monokai

" VIM SETTINGS
" xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
" >>>>>>>>>>>>>>>>>>>>>>>>>>> INDENTATION
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" Config for Javascript, JSON, YML
" au=autocmd, setl=setlocal, sw=shiftwidth, ts=tabstop, sts=softtabstop
au FileType javascript,yaml,json setl sw=2 ts=2 sts=2
" >>>>>>>>>>>>>>>>>>>>>>>>>>>>> BACKUP
" Enable backups
set backup
" Backups
set backupdir=~/.vim/tmp/backup//
" Swap files
set directory=~/.vim/tmp/swap//
" It's 2012, Vim.
set noswapfile

" KEY MAPPING
" xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
" inoremap (Insert Mode), nnoremap (Normal Mode), vnoremap (Visual Mode)
" Map ESC to jk
inoremap jk <Esc>
" Map <<, < and C-d to Shift-Tab
nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>
vnoremap <S-Tab> <
" Map > to Tab
vnoremap <Tab> >
" Autoformat Plugin
noremap <F3> :Autoformat<CR>

" PROGRAMMING CONFIG
" xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
" CSS, LESS, SASS
nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

" PLUGIN CONFIG
" xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
" Always open NERDTree
au StdinReadPre * let s:std_in=1
au VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Make NERDTree always open hidden files
let NERDTreeShowHidden=1
" NERDTree Tabs Plugin
let g:nerdtree_tabs_open_on_cosole_startup = 1
let g:nerdtree_tabs_open_on_new_tab = 1
" Vim Indent Plugin
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

" COMPLEX KEY MAPPING FUNCTION
" xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
nnoremap <A-Up> :normal <c-r>=SwitchWindow('+')<CR><CR>
nnoremap <A-Down> :normal <c-r>=SwitchWindow('-')<CR><CR>
nnoremap <A-Left> :normal <c-r>=SwitchWindow('<')<CR><CR>
nnoremap <A-Right> :normal <c-r>=SwitchWindow('>')<CR><CR>

function! SwitchWindow(dir)
  let this = winnr()
  if '+' == a:dir
    execute "normal \<c-w>k"
  elseif '-' == a:dir
    execute "normal \<c-w>j"
  elseif '>' == a:dir
    execute "normal \<c-w>l"
  elseif '<' == a:dir
    execute "normal \<c-w>h"
  else
    echo "Oops. Check your ~/.vimrc"
    return ""
  endif
endfunction
