function! unite#sources#rtags_virtuals#define() "{{{
  return s:source_rtags_virtuals
endfunction "}}}

" line source. "{{{
let s:source_rtags_virtuals = {
      \ 'name' : 'rtags/virtuals',
      \ 'syntax' : 'uniteSource__RtagsVirtuals',
      \ 'hooks' : {},
      \ 'default_kind' : 'jump_list',
      \ 'matchers' : 'matcher_regexp',
      \ 'sorters' : 'sorter_nothing',
      \ }

function! s:source_rtags_virtuals.hooks.on_syntax(args, context)
    syntax match uniteSource__RtagsVirtuals_File /[^:]*: / contained
                \ containedin=uniteSource__RtagsVirtuals
                \ nextgroup=uniteSource__RtagsVirtuals_LineNR
    syntax match uniteSource__RtagsVirtuals_LineNR /\d\+:/ contained
                \ containedin=uniteSource__RtagsVirtuals
                \ nextgroup=uniteSource__RtagsVirtuals_Symbol
    execute 'syntax match uniteSource__RtagsVirtuals_Symbol /'
                \ . a:context.source__cword
                \ . '/ contained containedin=uniteSource__RtagsVirtuals'
    highlight default link uniteSource__RtagsVirtuals_File Comment
    highlight default link uniteSource__RtagsVirtuals_LineNr LineNR
    highlight default link uniteSource__RtagsVirtuals_Symbol Function
endfunction

function! s:source_rtags_virtuals.gather_candidates(args, context)
    let a:context.source__cword = expand("<cword>")
    let args = {
        \ '-k' : '',
        \ '-r' : rtags#getCurrentLocation() }
    let result = rtags#ExecuteRC(args)
    return map(result, "{
                \ 'word': unite#rtags#get_word(v:val),
                \ 'action__path': unite#rtags#get_filepath(v:val),
                \ 'action__line': unite#rtags#get_fileline(v:val),
                \ 'action__col': unite#rtags#get_filecol(v:val),
                \ }")
endfunction
