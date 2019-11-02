let g:completekey = "<F9>"


""nnoremap <F9> "%phr_I#ifndef __<Esc>gUwyypldwidefine <Esc>yypldwiendif //<Esc>O<Esc>
""nnoremap <Leader>hg :HeaderguardAdd<CR>
""
""function! g:HeaderguardName()
""    return toupper(expand('%:t:gs/[^0-9a-zA-Z_]/_/g'))
""endfunction
""
""function! g:HeaderguardLine1()
""    return "#ifndef __" . g:HeaderguardName() ."__"
""endfunction
""
""function! g:HeaderguardLine2()
""    return "#define __" . g:HeaderguardName() . "__" .
""             \ "\r" . "#ifdef SUPPORTS_PRAGMA_ONCE" . 
""             \ "\r" . "#pragma once" . "\r" "#endif"
""endfunction
""
""function! g:HeaderguardLine3()
""    if g:headerguard_use_cpp_comments
""        return "#endif // " . g:HeaderguardName()
""    else
""        return "#endif /* " . g:HeaderguardName() . " */"
""    endif
""endfunction
