set cindent
set cinoptions=>2s,n0,{1s,t0,(0,w1,g0,^-1s
set tabstop=2
set shiftwidth=2
set expandtab

"Automatically recognize and colorize melt files.
au BufNewFile,BufRead *.melt set syn=melt
au BufNewFile,BufRead *.melt set filetype=melt



