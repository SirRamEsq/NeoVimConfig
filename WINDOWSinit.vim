call plug#begin()

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fatih/vim-go'
Plug 'https://github.com/w0rp/ale'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'chiel92/vim-autoformat'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sirver/UltiSnips'
Plug 'hobbestigrou/vimtips-fortune'
Plug 'vimwiki/vimwiki'
Plug 'jceb/vim-orgmode'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

"Syntax highlighters
Plug 'tbastos/vim-lua'
Plug 'tikhomirov/vim-glsl'
Plug 'quabug/vim-gdscript'

"Colorschemes
Plug 'jacoborus/tender.vim'
Plug 'fmoralesc/molokayo'
Plug 'chriskempson/base16-vim'


call plug#end()


""""""""""""""""""
"Tagbar gdscript"
""""""""""""""""""
let g:tagbar_type_gdscript = {
			\'ctagstype' :'gdscript',
			\'kinds':[
			\'c:constants',
			\'e:exports',
			\'o:onready',
			\'p:preloads',
			\'s:signals',
			\'f:functions',
			\]
			\}

""""""""""""""""""""""""
"vim fortune
"""""""""""""""""""""""
let g:fortune_vimtips_display_in_window=0

""""""""""""""""""""""""
"UltiSnips
""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-w>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsSnippetDirectories = ['~\AppData\Local\nvim\UltiSnips', 'UltiSnips']

"""""""""""""""""""""""
"Linters (ALE)
""""""""""""""""""""""""
let g:ale_linters = {
			\   'cpp': ['clang'],
			\}
"\   'go': ['golint', 'gofmt'],
"Keep sign gutter open
let g:ale_sign_column_always = 1

let g:ale_c_clang_options = '-std=c14 -Wall -Wno-system-headers'

"autoformat on save
"au BufWrite * :Autoformat

""""""""""""""""""""
"AIRLINE
""""""""""""""""""""
let g:airline_section_z = airline#section#create(['linenr', 'maxlinenr', ':%3v'])

"""""""""""""""""""""""
" easyMotion config
"""""""""""""""""""""""
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion


"""""""""""""""""""""""
"Go
""""""""""""""""""""""""
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_fmt_command = 'goimports'
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
au FileType go nnoremap <Leader>s <Plug>(go-implements)
au FileType go nnoremap <Leader>i <Plug>(go-info)
filetype on
filetype plugin on
filetype plugin indent on

"""""""""""""""""""""""
"General
""""""""""""""""""""""""

"Favorite colors
":color desert256
:color molokaiCustom

"Set tab character to appear 4 spaces wide
set tabstop=4
"Set an indent width to 4 to correspond to a single tab
set shiftwidth=4

set encoding=utf8
syntax on
"Map space to leader for easy motion
map <SPACE> \
map <SPACE><SPACE> \\
"timeoutlen is used for mapping delays, ttimeoutlen is used for key code delays
set timeoutlen=500 ttimeoutlen=10

"""""""""""""""""""""""
"Deoplete
""""""""""""""""""""""""
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

"""""""""""
" FOLDING "
"""""""""""
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

""""""""""""""""""
" Session Saving "
""""""""""""""""""
function! AskForConfirmationSave() abort
	let l:choice = input('Save Session? [Y/N]')
	" ==? is case insensitive
	if l:choice ==? 'Y'
		execute ':mksession! ./vimSession.vim'
	else
		return
	endif
endfunction

function! AskForConfirmationLoad() abort
	let l:choice = input('Load Session? [Y/N]')
	" ==? is case insensitive
	if l:choice ==? 'Y'
		execute ':source ./vimSession.vim'
	else
		return
	endif
endfunction

"""""""""""""""""""""""
"Function Key Mappings"
"""""""""""""""""""""""

"<C-U> clears the command line, leaving only ':'
nnoremap <F1> :<C-U>UltiSnipsEdit<CR>


"assign netrw mapping
nnoremap <F2> :<C-U>Vexplore <CR>
nnoremap <F3> :<C-U>Sexplore <CR>

"Tagbar Key
nnoremap <F4> :<C-U>TagbarToggle<CR>

"Session saving and loading
nnoremap <F5> :<C-U>call AskForConfirmationSave()<CR>
nnoremap <F6> :<C-U>call AskForConfirmationLoad()<CR>

"Fortune
nnoremap <F7> :<C-U>Fortune<CR>

"Bring up regex lib
nnoremap <F8> :<C-U>Vexplore<CR>:<C-U>:e ~/.config/nvim/regexLibrary/index.wiki<CR>

nnoremap <F9> :<C-U>make<CR><CR>

"Default make function, can be overwritten by specifying
"a file in after/ftplugins/<filetype>.vim

"Assign Retab key"
"nnoremap <expr> <F10> ":<C-U>set tabstop=" . input("Set file tab width [1,2,3,4]") . "<CR>:set noexpandtab<CR>:%retab!<CR>:set tabstop=4<CR>"
"Assign Autoformat key
nnoremap <expr> <F10> ":<C-U>Autoformat<CR>"

"<F11> Mapped to fullscreen
