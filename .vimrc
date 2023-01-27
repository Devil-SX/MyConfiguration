call plug#begin()
" Plug Commands:
" PlugInstall
" PlugClean

" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

Plug 'mhinz/vim-startify'

Plug 'altercation/vim-colors-solarized'

" Nerdtree
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'https://github.com/tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-visual-selection'

Plug 'ycm-core/YouCompleteMe'
Plug 'preservim/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'Yggdroot/indentLine'
" Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'

" Plug for Verilog
Plug 'vhda/verilog_systemverilog.vim'
Plug 'HonkW93/automatic-verilog'

" Plug for Markdown
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
" Use "MarkdownPreview" and "MarkdownPreviewStop" commands

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting


set nocompatible              " disable vi compatible
" Is "set nocompatible" useless? See related discussion on Stack Overflow

set encoding=utf8


" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.


runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" set themes
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" The following are commented out as they cause vim to behave a lot
" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase		

" Enable searching as you type, rather than waiting till you press enter.
set incsearch		

" set search highlight
set hls

set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" line number
set number " 开启绝对行号
set rnu " 开启相对行号

set cursorline " 突出显示当前行
set expandtab " set tab as space
set tabstop=2 " tab width 
set shiftwidth=2	" shift width, default by 8( Too long!)
set noerrorbells visualbell t_vb=  " annonying!

set autoindent
"set smartindent " 开启新行使用智能自动缩进


" Map settings
nmap <leader>q :q<CR>
nmap <leader>w :wall<CR>
nmap <leader>x :wqall<CR>
" Insert blank line
nmap <Space> o<Esc>
" Windows Settings
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l

" Plug settings
" NerdTree
nmap <leader>t :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>

" TagBar
nmap <leader>b :TagbarToggle<CR>

" EasyMotion
nmap ss <Plug>(easymotion-s2)

" Automatic Verilog
" Snippet
let g:atv_snippet_albpn_file = '~/.vim/template/albpn.v'
let g:atv_snippet_albpn_pos = '2,5'
nmap <leader>albpn <Plug>Atv_Snippet_AlBpn;
let g:atv_snippet_albp_file = '~/.vim/template/albp.v'
let g:atv_snippet_albp_pos = '1,3'
nmap <leader>albp <Plug>Atv_Snippet_AlBp;
let g:atv_snippet_alb_file = '~/.vim/template/alb.v'
nmap <leader>alb <Plug>Atv_Snippet_AlB;
" Instantance
nmap <leader>i :call g:AutoInst(0)<Esc>
nmap <leader>iall :call g:AutoInst(1)<Esc>
nmap <leader>addi f(ci(/*AutoInst*/<Esc>
nmap <leader>p :call g:AutoParaValue(0)<Esc>
nmap <leader>pall :call g:AutoParaValue(1)<Esc>
nmap <leader>addp f(ci(/*autoinstparam_value*/<Esc>

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nmap <Left>  :echoe "Use h"<CR>
nmap <Right> :echoe "Use l"<CR>
nmap <Up>    :echoe "Use k"<CR>
nmap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
imap <Left>  <ESC>:echoe "Use h"<CR>
imap <Right> <ESC>:echoe "Use l"<CR>
imap <Up>    <ESC>:echoe "Use k"<CR>
imap <Down>  <ESC>:echoe "Use j"<CR>

