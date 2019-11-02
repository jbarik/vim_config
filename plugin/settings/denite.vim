nnoremap <space>b :Denite buffer -mode=normal<CR>
nnoremap <space>f :Denite file -mode=normal<CR>
nnoremap <space>r :Denite file_rec -mode=normal<CR>
nnoremap <space>m :Denite menu -mode=normal<CR>
nnoremap <leader>ry :Denite menu:ycm -mode=normal<CR>

call denite#custom#option('default', {
      \ 'prompt': '❯❯',
      \ 'mode': 'normal'
      \ })
nnoremap <silent> <space>p  :<C-u>Denite -resume<CR>
"call denite#custom#map('normal', 'b', '<denite:>', 'noremap')

call denite#custom#map('insert', '<Esc>', '<denite:enter_mode:normal>',
      \'noremap')
call denite#custom#map('normal', '<Esc>', '<NOP>',
      \'noremap')
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>',
      \'noremap')
call denite#custom#map('normal', '<C-v>', '<denite:do_action:vsplit>',
      \'noremap')
call denite#custom#map('normal', 'dw', '<denite:delete_word_after_caret>',
      \'noremap')
call denite#custom#source('buffer', 'matchers', ['matcher_regexp'])

"hi link deniteMatchedChar Special
"hi link deniteMatchedRange Special

call denite#custom#option('_', 'highlight_mode_insert', 'CursorLine')
call denite#custom#option('_', 'highlight_matched_range', 'None')
call denite#custom#option('_', 'highlight_matched_char', 'None')

" denite file search
map <Space>f :DeniteProjectDir -buffer-name=files -direction=top file_rec<CR>

" -u flag to unrestrict (see ag docs)
call denite#custom#var('file_rec', 'command',
\ ['ag', '--follow', '--nocolor', '--nogroup', '-u', '-g', ''])

" denite content search
map <leader>a :DeniteProjectDir -buffer-name=grep -default-action=quickfix grep:::!<CR>

call denite#custom#source(
\ 'grep', 'matchers', ['matcher_regexp'])

" use ag for content search
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
    \ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['-g'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Add custom menu
let s:menus = {}

let s:menus.ycm = {
         \'description' : '    You-Complete-Me commands'}
let s:menus.ycm.command_candidates = [
         \['  Goto'               , 'YcmCompleter GoTo'],
         \['  Goto definition'    , 'YcmCompleter GoToDefinition'],
         \['  Goto declration'    , 'YcmCompleter GoToDeclration'],
         \['  Goto header'        , 'YcmCompleter GoToInclude'],
         \['  Get type'           , 'YcmCompleter GetType'],
         \['  Get imprecise type' , 'YcmCompleter GetTypeImprecise'],
         \['  Fixit'              , 'YcmCompleter FixIt'],
         \['  GetParent'          , 'YcmCompleter GetParent'],
         \['  GetDoc'             , 'YcmCompleter GetDocParent'],
         \['  Get imprecise doc'  , 'YcmCompleter GetDocImprecise'],
         \]

let s:menus.configs = {
         \ 'description': 'Edit important configuration'
         \ }
let s:menus.configs.file_candidates = [
         \ ['  cshrc            ', '~/.cshrc.mine'],
         \ ['  aliases          ', '~/.aliases.mine'],
         \ ['  vimrc            ', '~/.vimrc'],
         \ ['  vim key mapping  ', '~/.vim/plugin/settings/keymap.vim'],
         \ ['  vim denite       ', '~/.vim/plugin/settings/denite.vim'],
         \ ['  gdbinit          ', '~/.gdbinit'],
         \ ]

let s:menus.text = {
         \'description' : '   Text pruning commands'}

let s:menus.text.command_candidates = [
         \['  Callstack: Join broken lines'         , '%s/\(#[0-9].* 0x.*\)\n\([^#].*$\)/\1\2/g' ],
         \['  Callstack: Remove all pointers '      , '%s/\<\w*0x\w*\>//g' ],
         \['  Callstack: Remove fcn address'        , '%s/\(#[0-9]* *\)\(0x.*in \)/\1/g' ],
         \['  Callstack: Shorten paths'             , '%s/\(#.*at \)\/.*\(\/matlab\/.*\)/\1\2/'],
         \['  Callstack: Shorten export paths'      , '%s/\(at \)\(\/.*\)\(\/matlab\/.*\)/\1\3/'],
         \['  Callstack: Remove fcn arguments '     , '%s/\/.*\(\/matlab\/\)\(.*(.*\)/\/\.\*\1\2/g' ],
         \['  Block name: Replace new line with \n' , '%s/\(BLOCK_NAME: "[^"]* *\)\n/\1\\n/<bar>:%s/\(\n\n\)\n\+/\1/g' ],
         \['  Replace character \n with new line'   , '%s/\\n/\r/g' ],
         \['  Remove trailing white space'          , '%s/\s\+$//' ],
         \['  Remove empty lines'                   , 'v/./d'],
         \['  Remove empty lines  [v]'              , "'<,'>v/./d"],
         \['  Merge consecutive empty lines'        , '%s/\(\n\n\)\n\+/\1/' ],
         \['  Condense empty lines'                 , '%s/\n\{3,}/\r\r/e'],
         \]

call denite#custom#var('menu', 'menus', s:menus)
