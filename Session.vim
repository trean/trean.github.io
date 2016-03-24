let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/myblog/_includes
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +2 header.html
badd +1 footer.html
badd +14 head.html
badd +95 ~/public_html/treancycle/dest/index.html
badd +17 ~/myblog/_config.yml
badd +1 ~/myblog/index.html
badd +1 ~/myblog/_other/index.html
badd +5 ~/myblog/_posts/2016-03-11-welcome-to-jekyll.markdown
badd +5 ~/myblog/_posts/jekyll.markdown
badd +5 ~/myblog/_posts/to-jekyll.markdown
badd +6 ~/myblog/_posts/welcomel.markdown
badd +5 ~/myblog/about.md
badd +17 ~/myblog/_posts/2016-02-16-jekyll.markdown
badd +6 ~/myblog/_posts/2016-03-03-welcomel.markdown
badd +6 ~/myblog/_posts/2015-02-27-to-jekyll.markdown
badd +3 ~/myblog/all-notes/index.html
badd +10 ~/myblog/all-notes.html
badd +8 ~/myblog/_layouts/post.html
badd +19 ~/myblog/_layouts/default.html
badd +1 ~/myblog/_layouts/page.html
badd +16 ~/myblog/css-notes.html
badd +10 ~/myblog/js-notes.html
badd +10 ~/myblog/linux-notes.html
badd +9 ~/myblog/other-notes.html
badd +1 ~/Documents/accounting/form.html
badd +14 ~/myblog/_sass/modules/_articles-cards.scss
badd +13 ~/myblog/_sass/app.scss
badd +16 ~/myblog/_sass/_syntax.scss
badd +1 ~/myblog/_sass/modules/_post.sc
badd +2 ~/myblog/_sass/modules/_post.scss
badd +8 ~/public_html/andrey_blog/src/article.html
badd +127 ~/public_html/andrey_blog/src/sass/_article-inner.scss
badd +5 ~/myblog/_sass/modules/_socbtns.scss
badd +337 ~/myblog/_sass/_normalize.scss
badd +2 ~/myblog/_sass/_variables.scss
badd +21 ~/public_html/andrey_blog/src/sass/_footer.scss
badd +1 ~/public_html/andrey_blog/src/sass/_fonts.scss
badd +18 ~/myblog/_sass/_footer.scss
badd +0 ~/myblog/_sass/_icons.scss
argglobal
silent! argdel *
argadd header.html
set stal=2
edit ~/myblog/_sass/_footer.scss
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
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
let s:l = 40 - ((34 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
40
normal! 034|
wincmd w
argglobal
edit ~/myblog/_sass/_icons.scss
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=999
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 35 - ((4 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
35
normal! 0
wincmd w
wincmd =
tabedit ~/myblog/index.html
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
10
normal! zo
12
normal! zo
53
normal! zo
54
normal! zo
let s:l = 32 - ((31 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
32
normal! 04|
tabedit ~/myblog/_posts/2016-03-03-welcomel.markdown
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
let s:l = 5 - ((4 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
5
normal! 022|
tabedit head.html
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
let s:l = 20 - ((19 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
20
normal! 0105|
tabedit ~/myblog/_layouts/post.html
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
6
normal! zo
10
normal! zo
11
normal! zo
17
normal! zo
19
normal! zo
21
normal! zo
32
normal! zo
32
normal! zo
32
normal! zo
41
normal! zo
let s:l = 9 - ((8 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
9
normal! 08|
tabedit ~/myblog/other-notes.html
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
8
normal! zo
9
normal! zo
let s:l = 9 - ((8 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
9
normal! 029|
tabedit ~/public_html/andrey_blog/src/sass/_fonts.scss
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
let s:l = 1 - ((0 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit ~/myblog/_posts/2016-02-16-jekyll.markdown
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
let s:l = 17 - ((16 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
17
normal! 034|
tabedit footer.html
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
40
normal! zo
let s:l = 36 - ((24 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
36
normal! 099|
tabnext 6
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
