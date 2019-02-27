" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

"Ensure correct colors
"set termguicolors

"VimPlug
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
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'junegunn/limelight.vim'

"Syntax highlighters
Plug 'tbastos/vim-lua'
Plug 'tikhomirov/vim-glsl'
Plug 'quabug/vim-gdscript'

"Colorschemes
Plug 'jacoborus/tender.vim'
Plug 'fmoralesc/molokayo'
Plug 'chriskempson/base16-vim'

"Vim Wiki
Plug 'vimwiki/vimwiki'

"Bookmarks
Plug 'MattesGroeger/vim-bookmarks'

Plug 'https://github.com/jreybert/vimagit'

" Better Markdown support
Plug 'plasticboy/vim-markdown'

call plug#end()

let g:go_version_warning = 0

"Autoformat
"Needs sqlparse installed
let b:formatdef_sql = '"sqlformat --reindent --keywords upper --identifiers lower -"'
let b:formatters_sql = ['sql']

"Bookmarks, 'm' key is used
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1

"""""""""""""""
" Spell check "
"""""""""""""""
set spelllang=en
set spellfile=$HOME/.config/nvim/spell/en.utf-8.add

"""""""""""
" VIMWIKI "
"""""""""""
" Can have multiple wikis if so desired
let g:vimwiki_list = [
	 \{'path': '~/vimWiki/XPLM'},
	 \{'path': '~/vimWiki/Theocratic'},
	 \{'path': '~/vimWiki/Godot'}
 \]

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
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']

"""""""""""""""""""""""
"Linters (ALE)
""""""""""""""""""""""""
let g:ale_linters = {
	\ 'cpp': ['clang'],
	\ 'go': ['gometalinter']
\}

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
"Map space to leader 
map <SPACE> \
map <SPACE><SPACE> \\
"timeoutlen is used for mapping delays, ttimeoutlen is used for key code delays
set timeoutlen=500 ttimeoutlen=10

"""""""""""""""""""""""
" easyMotion config
"""""""""""""""""""""""
map <Leader><Leader>l <Plug>(easymotion-lineforward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><Leader>h <Plug>(easymotion-linebackward)


let g:EasyMotion_startofline = 0 " keep cursor column when JK motion


nnoremap <Leader>l :Limelight!!<CR>

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
"
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

"map highlight search toggle
nnoremap <F12> :<C-U>set hlsearch!<CR>
" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" Transparent BG
" hi Normal guibg=NONE ctermbg=NONE
