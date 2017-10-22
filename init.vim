" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim


" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif
"============
"pathogen
"===========
execute pathogen#infect()

"Go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_fmt_command = "goimports"
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
syntax on  
filetype on  
filetype plugin on  
filetype plugin indent on  
" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

:color desert256 
"Set tab character to appear 4 spaces wide
set tabstop=4
"Set an indent width to 4 to correspond to a single tab
set shiftwidth=4

"CPP Highlighting VARS
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1

"Experimental
"Slower, more accurate
let g:cpp_experimental_simple_template_highlight = 1
"Faster Less accurate
"let g:cpp_experimental_template_highlight = 1

""""""""
"Folding"
"""""""""
set foldmethod=syntax   
set foldnestmax=10
set nofoldenable
set foldlevel=2

"Show Line numbers
set number

""""""""""""""""""""
"netrw look and feel
""""""""""""""""""""
"How <CR> opens a new file
let g:netrw_browse_split = 0
"Change from left splitting to right splitting
let g:netrw_altv = 1
"Style the the list is presented in, 3 = tree style
let g:netrw_liststyle = 3
"Size expressed in percentage
let g:netrw_winsize = 50
"True/False, enables or disables banner
let g:netrw_banner = 1


"""""""""""""""""""""""
"Function Key Mappings"
"""""""""""""""""""""""
"<F1> Typically mapped to help functions, leave alone
"
"<C-U> clears the command line, leaving only ':'

"assign netrw mapping
nmap <F2> :<C-U>Vexplore <CR>
nmap <F3> :<C-U>Sexplore <CR>

"Tagbar Key
nmap <F5> :<C-U>TagbarOpen fjc<CR>

"cpp make
nmap <F9> :<C-U>make<CR><CR>

"Assign Retab key"
nnoremap <expr> <F10> ":<C-U>set tabstop=" . input("Set file tab width [1,2,3,4]") . "<CR>:set noexpandtab<CR>:%retab!<CR>:set tabstop=4<CR>"

"<F11> Mapped to fullscreen

"map highlight search toggle
nmap <F12> :<C-U>set hlsearch!<CR>

"Powerline
let g:Powerline_symbols = 'fancy'
