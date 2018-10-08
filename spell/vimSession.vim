let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 /mnt/c/Users/LloydRyan/Documents/NOTES/vimWiki/XPLM/diary/2018-09-26.wiki
badd +19 /mnt/c/Users/LloydRyan/Documents/NOTES/vimWiki/XPLM/index.wiki
badd +1 /mnt/c/Users/LloydRyan/Documents/NOTES/vimWiki/XPLM/Scripts/SQL/FolderStructureHighestVersion.sql
badd +2 /mnt/c/Users/LloydRyan/Documents/NOTES/vimWiki/XPLM/Scripts/SQL/scratch.sql
badd +0 .config/nvim/spell/en.utf-8.add
argglobal
silent! argdel *
edit /mnt/c/Users/LloydRyan/Documents/NOTES/vimWiki/XPLM/Scripts/SQL/scratch.sql
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winminheight=1 winminwidth=1 winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 105 + 105) / 211)
exe 'vert 2resize ' . ((&columns * 105 + 105) / 211)
argglobal
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=10
setlocal nofen
let s:l = 2 - ((1 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
2
normal! 0
lcd ~/.config/nvim/spell
wincmd w
argglobal
if bufexists('/mnt/c/Users/LloydRyan/Documents/NOTES/vimWiki/XPLM/Scripts/SQL/FolderStructureHighestVersion.sql') | buffer /mnt/c/Users/LloydRyan/Documents/NOTES/vimWiki/XPLM/Scripts/SQL/FolderStructureHighestVersion.sql | else | edit /mnt/c/Users/LloydRyan/Documents/NOTES/vimWiki/XPLM/Scripts/SQL/FolderStructureHighestVersion.sql | endif
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=2
setlocal fml=1
setlocal fdn=10
setlocal nofen
let s:l = 11 - ((10 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
11
normal! 024|
lcd ~/.config/nvim/spell
wincmd w
exe 'vert 1resize ' . ((&columns * 105 + 105) / 211)
exe 'vert 2resize ' . ((&columns * 105 + 105) / 211)
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
