let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/myblog/_sass
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +1 _header.scss
badd +38 _global.scss
badd +22 ~/myblog/_config.yml
badd +2 config.yaml
badd +1 ~/myblog/sassdoc/config.yaml
badd +8 bourbon/functions/_is-number.scss
badd +15 bourbon/functions/_modular-scale.scss
badd +8 bourbon/functions/_px-to-rem.scss
badd +1 bourbon/functions/_is-length.scss
badd +19 bourbon/css3/_keyframes.scss
badd +1 _main.scss
badd +12 app.scss
badd +8 modules/_header.scss
badd +7 modules/_logo.scss
badd +16 modules/_top-menu.scss
badd +36 ~/myblog/js/project.js
badd +4 ~/myblog/.gitignore
badd +1 ~/myblog/CNAME
badd +12 ~/myblog/css-notes.html
badd +35 ~/myblog/index.html
badd +19 ~/myblog/_layouts/default.html
badd +8 ~/myblog/_includes/header.html
badd +7 modules/_link.scss
badd +1 _variables.scss
badd +2 _breakpoints.scss
badd +1 _breackpoints.scss
badd +6 _icons.scss
badd +6 modules/_head1.scss
badd +2 modules/_post.scss
badd +49 modules/_articles-cards.scss
badd +19 modules/_main-callback.scss
argglobal
silent! argdel *
edit modules/_articles-cards.scss
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
wincmd =
argglobal
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=999
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 44 - ((9 * winheight(0) + 15) / 30)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
44
normal! 022|
wincmd w
argglobal
edit _global.scss
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=999
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 23 - ((4 * winheight(0) + 4) / 9)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
23
normal! 032|
wincmd w
argglobal
edit _variables.scss
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=999
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 15 - ((12 * winheight(0) + 9) / 19)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
15
normal! 0
wincmd w
argglobal
edit _breakpoints.scss
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=999
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 17 - ((16 * winheight(0) + 10) / 20)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
17
normal! 026|
wincmd w
wincmd =
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
