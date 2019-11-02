" .vim/plugin/setting/ folder

" Settings to edit and source vimrc from anywhere
nnoremap <Leader>se :e $MYVIMRC<CR>
nnoremap <Leader>so :source $MYVIMRC<CR>
nnoremap <Leader>sk :e ~/.vim/plugin/settings/keymap.vim<CR>

"""Few mappings
""inoremap ( ()<Esc>i
""inoremap [ []<Esc>i
""inoremap { {}<Esc>i
""""inoremap { {<cr><cr><bs>}<Esc>ko
""inoremap {{ {
""inoremap [[ [
""inoremap (( (
""inoremap " ""<Esc>i

" turn off search highlight
""nmap <F2> :nohls<CR>
nnoremap <leader><space> :nohlsearch<CR>

"Open the file under cursor. t flag is for last component only we don't want
"the full path(only the filename is required)
nmap gh :tag <C-R>=expand("<cfile>:t")<CR><CR>
nmap <M-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-i> :tn<CR>

" Shows the colour column at 85th column
" For the method, ToggleColorColumn see ~/.vimrc
nnoremap <silent> <leader>cl :call g:ToggleColorColumn()<CR>
nnoremap <silent> <leader>cc :set cuc!<Bar>set cursorline!<CR>
nnoremap <Space>n :set relativenumber!<CR>

" Split window navigation
nnoremap <leader>j <C-w>j
nnoremap <leader>h <C-w>h
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

"map <Leader>c :let @" = expand("%") <CR>

" Shows function name(dpending on where the cursor is)
" For function ShowFuncName, see .vimrc
map <Leader>ff :call ShowFuncName() <CR>

"map <F37> :echo 'Current time is ' .strftime('%c')<CR>
"autocmd BufEnter * : syntax sync fromstart "http://vim.wikia.com/wiki/Fix_syntax_highlighting
""nmap <F5> :syntax syn fromstart
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
nnoremap <leader>x :%s/\/\/\(.*\)/\/*\1\*\//<CR>
""nmap <Leader>h yyp^v$r-o<Esc>

" ========= Few mappings which are too small to have their own file =========

"Tagbar
nnoremap <F8> :TagbarToggle<CR>

" NERDTree open and close
nnoremap <M-F9> :NERDTree<CR>
nnoremap <M-F10> :NERDTreeClose<CR>

" Buffer navigation
"this all are for Buffer togglings
"SHIFT RIGHT/LEFT will move UP/DOWN the Buffer List
"else type Buffer Number and b .. will go to that Buffer
nnoremap <S-Left> :bp<CR>
nnoremap <S-Right> :bn<CR>
nnoremap b <C-^>

" Page up down
nnoremap <space>k <PageUp>
nnoremap <space>j <PageDown>

" Move to the begining of first word
nnoremap <space>0 0w

" H -> cursor to top of screen
" M -> cursor to middle of screen
" L -> cursor to bottom of screen

" Save file
nnoremap <Space>w :w<CR>
nnoremap <Space>ww :w!<CR>

" Enter visual line mode
nmap <Space><Space> <C-v>
nnoremap <Space>v V

" Copy paste to system clipboard
vmap <Space>y "+y
vmap <Space>d "+d
nmap <Space>p "+p
nmap <Space>P "+P
vmap <Space>p "+p
vmap <Space>P "+P

" Copy the finename:line_no to system clipboard
" Helpful to use it in gdb - for breakpoints
" fl = file with line number
"
" See http://vim.wikia.com/wiki/Get_the_name_of_the_current_file
nnoremap <Space>ln :let @*='b ' . expand("%:t") . ':' . line(".")<CR>
" Copy current word under cursor to system clipboard
nnoremap <Space>cw :let @*=expand("<cword>")<CR>

" Navigation
nnoremap <Space>e $
nnoremap <Space>g G

" Close quickfixwindow
nnoremap <Space>c :cclose<CR>

" Show leading whitespace <Space>s is already mapped to Unite
""nnoremap <Leader>s /\S\zs\s\+$<CR>
nnoremap <Leader>s /\s\+$<CR>
nnoremap <Leader>t /\t<CR>

" Window resize instead of ctrl-w+- and ctrl-w++
nnoremap <silent> + :exe "resize ".(winheight(0) * 3/2) <CR>
nnoremap <silent> - :exe "resize ".(winheight(0) * 2/3) <CR>

" The following map will exapnd the current files directory
" in the the ex command window so that you can open any
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>

" First Replace string separeted by newline with \n
" Second replace multiple blank lines with one blank line
"nnoremap <F6> :%s/\(BLOCK_NAME: "[^"]* *\)\n/\1\\n/<bar>:%s/\(\n\n\)\n\+/\1/<CR>
"nnoremap <F7> :%s/\(\n\n\)\n\+/\1/<CR>

" Cleanup gdb stack - first append lines not starting with #number
" 2nd - cleanup stack pointer values
"nnoremap <F8> :%s/\(#[0-9].* 0x.*\)\n\([^#].*$\)/\1\2/<bar>:%s/\(#[0-9]* *\)\(0x.*in \)/\1/<CR>
