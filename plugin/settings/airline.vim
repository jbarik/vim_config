"" Setup for airline
"" The default setting of 'laststatus' is for the statusline to not appear
"" until a split is created. If you want it to appear all the time
set laststatus=2

"You need to install fonts into your system with that symbols
"like branching, big triangles etc. They are not standard symbols
"so you need to install patched font. You can find a lot of patched
"fonts here https://github.com/powerline/fonts.
let airline_powerline_fonts = 1

let g:airline_left_sep = '▶'
let g:airline_right_sep = '◀'
""let g:airline_section_warning = airline#section#create(['whitespace'])
" Original is
""let g:airline_section_warning = airline#section#create(['syntastic', 'eclim', 'whitespace'])
let g:airline_theme='bubblegum'

" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_right_sep = '«'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '◀'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '¶'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
