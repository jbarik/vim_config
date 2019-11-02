set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \     'left': [ ['mode', 'paste'],
      \               ['readonly', 'filename', 'modified']
      \             ],
      \     'right': [ ['trailing'], ['lineinfo', 'percent'],
      \                ['fileformat', 'fileencoding'],
      \              ]
      \ },
      \ 'separator' : { 'left': "▶", 'right': "◀" },
      \ 'subseparator': { 'left': "»", 'right': "«" }
      \ }

"let g:lightline.separator = { 'left': "▶", 'right': "◀" }
"let g:lightline.subseparator = { 'left': "»", 'right': "«" }

"let g:lightline.component_type = { 'bufnum': 'raw', 'filename': 'raw', 'filetype': 'raw', 'fileencoding': 'raw' }

" Trailing whitespace status
"
" Register the component
let g:lightline.component_expand = {'trailing': 'lightline#trailing_whitespace#component'}

" Set color to the component (use warning or error):
let g:lightline.component_type = {'trailing': 'error'}

"Add the component to the lightline, for example to the right side:
"let g:lightline.active = { 'right': [[ 'trailing' ]] }
