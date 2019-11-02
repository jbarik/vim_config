" " Settings and mappings for Unite plugin
" "
" let g:unite_source_history_yank_enable = 1
" let g:unite_prompt = '>>> '
" 
" "" Mappings for unite
" "nnoremap <C-p> :Unite file_rec/async<CR>
" "nnoremap <space>/ :Unite grep:.<CR>
" "nnoremap <space>y :Unite history/yank<CR>
" "nnoremap <space>s :Unite -quick-match buffer<CR>
" "nnoremap <space>b :Unite buffer<CR>
" "nnoremap <space>f :Unite file<CR>
" "nnoremap <space>r :Unite file_rec<CR>
" nnoremap <Leader>cu :UniteClose<CR>
" 
" let g:unite_source_menu_menus = {}
" 
" nnoremap [menu] <Nop>
" nmap <LocalLeader> [menu]
" nnoremap <silent>[menu]u :Unite -silent -winheight=12 menu<CR>
" 
" " Text edition {{{
" 
"     let g:unite_source_menu_menus.text = {
"         \ 'description' : 'Text pruning commands'}
" 
"     let g:unite_source_menu_menus.text.command_candidates = [
"         \['toggle fold                             \u2318 /', 'normal za'],
"         \['open all folds                          \u2318 zR', 'normal zR'],
"         \['close all folds                         \u2318 zM', 'normal zM'],
"         \['toggle paste mode                       \u2318 ,p', 'normal ,p'],
"         \['show current char info                  \u2318 ga', 'normal ga'],
"         \["Remove empty lines"                      , 'v/./d'],
"         \["Remove empty lines  [v]"                 , "'<,'>v/./d"],
"         \['Condense empty lines'                    , '%s/\n\{3,}/\r\r/e'],
"         \['Shorten paths'                           , '%s/\(#.*at \)\/.*\(\/matlab\/.*\)/\1\2/'],
"         \['Shorten export paths'                    , '%s/\(at \)\(\/.*\)\(\/matlab\/.*\)/\1\3/'],
"         \['Remove trailing white space'             , '%s/\s\+$//' ],
"         \['Join broken lines in callstacks'         , '%s/\(#[0-9].* 0x.*\)\n\([^#].*$\)/\1\2/' ],
"         \['Remove function address in callstacks'   , '%s/\(#[0-9]* *\)\(0x.*in \)/\1/' ],
"         \['Remove all pointrs in callstacks'        , '' ],
"         \['In block names replace new line with \n' , '%s/\(BLOCK_NAME: "[^"]* *\)\n/\1\\n/<bar>:%s/\(\n\n\)\n\+/\1/' ],
"         \['Merge multiple consecutive empty lines into one' , '%s/\(\n\n\)\n\+/\1/' ],
"     \]
" 
"     exe 'nnoremap <silent>[menu]e :Unite -silent -winheight='.(len(g:unite_source_menu_menus.text.command_candidates) + 2).' menu:text<CR>'
" 
" " Text edition {{{
" 
"     let g:unite_source_menu_menus.editconfig = {
"         \ 'description' : 'Edit setting files         \u2318 [space]e'}
" 
"     let g:unite_source_menu_menus.editconfig.command_candidates = [
"         \['Edit .vimrc    ,se'      , 'e ~/.vimrc'],
"         \['Edit key mappings'       , 'e ~/.vim/plugin/settings/keymap.vim' ],
"         \['Edit unite custom menu'  , 'e ~/.vim/plugin/settings/unite.vim' ],
"         \['Edit aliases'            , 'e ~/.aliases.mine' ],
"         \['Edit .cshrc.mine'        , 'e ~/.cshrc.mine' ],
"     \]
" 
"     exe 'nnoremap <silent>[menu]c :Unite -silent -winheight='.(len(g:unite_source_menu_menus.editconfig.command_candidates) + 2).' menu:text<CR>'
