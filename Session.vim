let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +3 myblog/_includes/breadcrumbs.html
badd +8 myblog/_posts/2016-03-11-welcome-to-jekyll.markdown
badd +10 myblog/_posts/2016-03-26-Анимированный\ герой\ мультфильма\ с\ использованием\ SASS.markdown
badd +10 myblog/_posts/2016-03-26-animated-mult-hero-with-sass.markdown
badd +23 myblog/_posts/2016-02-16-jekyll.markdown
badd +6 myblog/_posts/welcomel.markdown
badd +4 myblog/_posts/2015-02-27-to-jekyll.markdown
badd +5 myblog/_posts/2016-03-03-welcomel.markdown
badd +11 myblog/_layouts/post.html
badd +19 myblog/_layouts/default.html
badd +11 myblog/index.html
badd +0 myblog/_sass/modules/_articles-cards.scss
badd +11 myblog/css-notes.html
badd +10 myblog/_includes/post-card.html
badd +10 myblog/js-notes.html
badd +12 myblog/all-notes.html
badd +10 myblog/linux-notes.html
badd +13 myblog/other-notes.html
badd +5 myblog/about.md
argglobal
silent! argdel *
set stal=2
edit myblog/_posts/2016-03-26-animated-mult-hero-with-sass.markdown
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=999
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 5 - ((4 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
5
normal! 024|
tabedit myblog/_sass/modules/_articles-cards.scss
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=999
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 7 - ((4 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
7
normal! 028|
tabedit myblog/index.html
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=999
setlocal fml=1
setlocal fdn=20
setlocal fen
9
normal! zo
47
normal! zo
48
normal! zo
let s:l = 58 - ((24 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
58
let s:c = 51 - ((41 * winwidth(0) + 79) / 158)
if s:c > 0
  exe 'normal! ' . s:c . '|zs' . 51 . '|'
else
  normal! 051|
endif
tabnext 3
set stal=1
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
