function! unite#sources#rtags_file#define() "{{{
  return s:source_rtags_file
endfunction "}}}

" line source. "{{{
let s:source_rtags_file = {
      \ 'name' : 'rtags/file',
      \ 'syntax' : 'uniteSource__RtagsFile',
      \ 'hooks' : {},
      \ 'default_kind' : 'jump_list',
      \ 'matchers' : 'matcher_regexp',
      \ 'sorters' : 'sorter_nothing',
      \ }
" }}}

function! s:source_rtags_file.hooks.on_syntax(args, context)
    if (a:context.source__case ==# 'i')
        syntax case ignore
    endif

    syntax match uniteSource__RtagsFile_File /[^:]*: / contained
                \ containedin=uniteSource__RtagsFile
                \ nextgroup=uniteSource__RtagsFile_LineNR
    syntax match uniteSource__RtagsFile_LineNR /\d\+:/ contained
                \ containedin=uniteSource__RtagsFile
                \ nextgroup=uniteSource__RtagsFile_File
    execute 'syntax match uniteSource__RtagsFile_File /'
                \ . a:context.source__input
                \ . '/ contained containedin=uniteSource__RtagsFile'
    highlight default link uniteSource__RtagsFile_File Comment
    highlight default link uniteSource__RtagsFile_LineNr LineNR
    highlight default link uniteSource__RtagsFile_File Function
endfunction

function! s:source_rtags_file.hooks.on_init(args, context)
    let a:context.source__input = get(a:args, 1, '')
    if (a:context.source__input ==# '')
       let a:context.source__input = unite#util#input('FileNamePattern: ')
    endif

    call unite#print_source_message('Pattern: '
                \ . a:context.source__input, s:source_rtags_file.name)

    let a:context.source__case = get(a:args, 0, '')
endfunction

function! s:source_rtags_file.gather_candidates(args, context)
    ""let args = { '-a' : '' }
    ""echom a:context.source_case
    ""if (a:context.source__case ==# 'i')
    ""    let args['-I'] = ''
    ""endif
    ""let args['-P'] = a:context.source__input
    let args = {
        \ '-I' : '',
        \ '-P' : a:context.source__input }
    let raw_result = rtags#ExecuteRC(args)
    let pattern = '.*\.[cChH][pP][pP].*'
    let result = filter(raw_result, 'v:val =~ pattern')
    return map(result, "{
                \ 'word': unite#rtags#get_word(v:val),
                \ 'source': 'rtags/file' ,
                \ 'action__path': unite#rtags#get_filepath(v:val),
                \ }")
endfunction
