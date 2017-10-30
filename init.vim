" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

"Ensure correct colors
"set termguicolors

"VimPlug
call plug#begin()
Plug 'fatih/vim-go'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'https://github.com/w0rp/ale'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'chiel92/vim-autoformat'

call plug#end()

"Linters (ALE)
let g:ale_linters = {
\   'cpp': ['clang'],
\}
"\   'go': ['golint', 'gofmt'],
"Keep sign gutter open
let g:ale_sign_column_always = 1

"autoformat on save
"au BufWrite * :Autoformat

"General
syntax on

"Go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_fmt_command = 'goimports'
let g:go_highlight_operators = 1  
let g:go_highlight_build_constraints = 1  
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
filetype on  
filetype plugin on  
filetype plugin indent on  

"Deoplete
let g:deoplete#enable_at_startup = 1
" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
"inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
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
"if filereadable("/etc/vim/vimrc.local")
  "source /etc/vim/vimrc.local
"endif

"Favorite colors
":color desert256 
:color molokai 

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

let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

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

"Default make function, can be overwritten by specifying
"a file in after/ftplugins/<filetype>.vim
nmap <F9> :<C-U>make<CR><CR>

"Assign Retab key"
nnoremap <expr> <F10> ":<C-U>set tabstop=" . input("Set file tab width [1,2,3,4]") . "<CR>:set noexpandtab<CR>:%retab!<CR>:set tabstop=4<CR>"

"<F11> Mapped to fullscreen

"map highlight search toggle
nmap <F12> :<C-U>set hlsearch!<CR>
" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
