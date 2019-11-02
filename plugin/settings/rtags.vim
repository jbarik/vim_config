" "lyuts/vim-rtags
" "Out of box this plugin provides mappings. In order to use custom mappings the
" "By default, search results are showed in a location list. Location lists are
" "local to the current window. To use the vim QuickFix window, which is shared
" "between all windows, set:
" let g:rtagsUseLocationList = 0
" 
" "To implement 'return to previous location after jump' feature, internal stack is
" "used. It is possible to set its maximum size (number of entries), default is 100:
" let g:rtagsJumpStackMaxSize = 20
" 
" "This plugin interacts with RTags by invoking rc commands and interpreting their
" "results. You can override the path to rc binary by setting g:rcCmd variable.
" "By default, it is set to rc, expecting it to be found in the $PATH
" "sbcpptags -rtags-bin-dir
" "let g:rtagsLog = "/home/jbarik/rtag.log"
" 
" let g:rtagsRcCmd = "rc --socket-file=" .working_dir. "/.sbtools/sbcpptags/rdm_socket"
" let g:rtagsAutoLaunchRdm = 1
" 
" " Code completion
" set completefunc=RtagsCompleteFunc
" 
" noremap <Leader>rh :call rtags#ClassInfo()<CR>
" noremap <Leader>rur :Unite rtags/references<CR>
" noremap <Leader>rus :Unite rtags/symbol<CR>
" noremap <Leader>ruf :Unite rtags/file<CR>
" noremap <Leader>ruv :Unite rtags/virtuals<CR>
" 
" """jbarik rc -HF <pattern>
" function! rtags#FindFile(pattern)
"    " -K for --absolute-path
"     let args = {
"         \ '-I' : '',
"         \ '-P' : a:pattern }
" 
"     let result = rtags#ExecuteRC(args)
"     ""for line in result
"     ""   echo line
"     ""endfor
"     call rtags#ShowResults(result)
" endfunction
" 
" function! rtags#ClassInfo()
"    let args = {'--class-hierarchy' : rtags#getCurrentLocation()}
"    let result = rtags#ExecuteRC(args)
"    call rtags#ShowResults(result)
" endfunction
" 
" if !exists('MRU_Auto_Close')
"     let MRU_Auto_Close = 1
" endif
" 
" if !exists('MRU_Use_Current_Window')
"     let MRU_Use_Current_Window = 0
" endif
" 
" function! rtags#ShowResults(results)
" 
"    " Check for empty result
"    if empty(a:results)
"       echom "Empty file list"
"       return
"    endif
" 
"    let bname = '__rtags_results__'
"    let window_height = 15
"    " Save the current buffer number. This is used later to open a file when a
"    " entry is selected from the MRU window. The window number is not saved,
"    " as the window number will change when new windows are opened.
"    let s:MRU_last_buffer = bufnr('%')
" 
"    " If the window is already open, jump to it
"    let winnum = bufwinnr(bname)
"    if winnum != -1
"       if winnr() != winnum
"          " If not already in the window, jump to it
"          exe winnum . 'wincmd w'
"       endif
" 
"       setlocal modifiable
" 
"       " Delete the contents of the buffer to the black-hole register
"       silent! %delete _
"    else
"       " Open a new window at the bottom
" 
"       " If the __MRU_Files__ buffer exists, then reuse it. Otherwise open
"       " a new buffer
"       let bufnum = bufnr(bname)
"       if bufnum == -1
"          let wcmd = bname
"       else
"          let wcmd = '+buffer' . bufnum
"       endif
" 
"       ""exe 'silent! botright ' . window_height . 'split ' . wcmd
"       exe 'silent! topleft ' . window_height . 'split ' . wcmd
"    endif
" 
"    setlocal modifiable
" 
"    " Mark the buffer as scratch
"    setlocal buftype=nofile
"    setlocal bufhidden=delete
"    setlocal noswapfile
"    setlocal nowrap
"    setlocal nobuflisted
"    " Set the 'filetype' to 'mru'. This allows the user to apply custom
"    " syntax highlighting or other changes to the MRU bufer.
"    setlocal filetype=mru
"    " Use fixed height for the MRU window
"    setlocal winfixheight
" 
" 
"    " Create mappings to select and edit a file from the MRU list
"    nnoremap <buffer> <silent> <CR>
"             \ :call <SID>MRU_Select_File_Cmd('edit,useopen')<CR>
"    vnoremap <buffer> <silent> <CR>
"             \ :call <SID>MRU_Select_File_Cmd('edit,useopen')<CR>
" 
"    "Filter the result"
"    ""let pattern = 'cpp'
"    ""filter(result,'stridx(v:val, pattern) != -1')
"    silent! 0put =a:results
" 
"    " Delete the empty line at the end of the buffer
"    silent! $delete _
" 
"    " Move the cursor to the beginning of the file
"    normal! gg
" 
" endfunction
" 
" " MRU_Select_File_Cmd                   {{{1
" " Open a file selected from the MRU window
" "
" "   'opt' has two values separated by comma. The first value specifies how to
" "   edit the file  and can be either 'edit' or 'view'. The second value
" "   specifies where to open the file. It can take one of the following values:
" "     'useopen' to open file in the previous window
" "     'newwin_horiz' to open the file in a new horizontal split window
" "     'newwin_vert' to open the file in a new vertical split window.
" "     'newtab' to open the file in a new tab.
" " If multiple file names are selected using visual mode, then open multiple
" " files (either in split windows or tabs)
" function! s:MRU_Select_File_Cmd(opt) range
"     let [edit_type, open_type] = split(a:opt, ',')
" 
"     let fnames = getline(a:firstline, a:lastline)
" 
"     if g:MRU_Auto_Close == 1 && g:MRU_Use_Current_Window == 0
"         " Automatically close the window if the file window is
"         " not used to display the MRU list.
"         silent! close
"     endif
" 
"     let multi = 0
" 
"     for f in fnames
"         if f == ''
"             continue
"         endif
" 
"         " The text in the MRU window contains the filename in parenthesis
"         ""let file = matchstr(f, g:MRU_Filename_Format.parser)
" 
"         ""call s:MRU_Window_Edit_File(file, multi, edit_type, open_type)
"         call s:MRU_Window_Edit_File(f, multi, edit_type, open_type)
" 
"         if a:firstline != a:lastline
"             " Opening multiple files
"             let multi = 1
"         endif
"     endfor
" endfunction
" 
" " MRU_Edit_File                         {{{1
" " Edit the specified file
" "   filename - Name of the file to edit
" "   sanitized - Specifies whether the filename is already escaped for special
" "   characters or not.
" function! s:MRU_Edit_File(filename, sanitized)
"     if !a:sanitized
" 	let esc_fname = s:MRU_escape_filename(a:filename)
"     else
" 	let esc_fname = a:filename
"     endif
" 
"     " If the user wants to always open the file in a tab, then open the file
"     " in a tab. If it is already opened in a tab, then the cursor will be
"     " moved to that tab.
"     if g:MRU_Open_File_Use_Tabs
" 	call s:MRU_Open_File_In_Tab(a:filename, esc_fname)
" 	return
"     endif
" 
"     " If the file is already open in one of the windows, jump to it
"     let winnum = bufwinnr('^' . a:filename . '$')
"     if winnum != -1
"         if winnum != winnr()
"             exe winnum . 'wincmd w'
"         endif
"     else
"         if !&hidden && (&modified || &buftype != '' || &previewwindow)
"             " Current buffer has unsaved changes or is a special buffer or is
"             " the preview window.  The 'hidden' option is also not set.
"             " So open the file in a new window.
"             exe 'split ' . esc_fname
"         else
"             " The current file can be replaced with the selected file.
"             exe 'edit ' . esc_fname
"         endif
"     endif
" endfunction
" " MRU_escape_filename                   {{{1
" " Escape special characters in a filename. Special characters in file names
" " that should be escaped (for security reasons)
" let s:esc_filename_chars = ' *?[{`$%#"|!<>();&' . "'\t\n"
" function! s:MRU_escape_filename(fname)
"     if exists("*fnameescape")
"         return fnameescape(a:fname)
"     else
"         return escape(a:fname, s:esc_filename_chars)
"     endif
" endfunction
" 
" " MRU_Window_Edit_File                  {{{1
" "   fname     : Name of the file to edit. May specify single or multiple
" "               files.
" "   edit_type : Specifies how to edit the file. Can be one of 'edit' or 'view'.
" "               'view' - Open the file as a read-only file
" "               'edit' - Edit the file as a regular file
" "   multi     : Specifies  whether a single file or multiple files need to be
" "               opened.
" "   open_type : Specifies where to open the file.
" "               useopen - If the file is already present in a window, then
" "                         jump to that window.  Otherwise, open the file in
" "                         the previous window.
" "               newwin_horiz - Open the file in a new horizontal window.
" "               newwin_vert - Open the file in a new vertical window.
" "               newtab  - Open the file in a new tab. If the file is already
" "                         opened in a tab, then jump to that tab.
" "               preview - Open the file in the preview window
" function! s:MRU_Window_Edit_File(fname, multi, edit_type, open_type)
"     let esc_fname = s:MRU_escape_filename(a:fname)
" 
"     " If the selected file is already open in one of the windows,
"     " jump to it
"     let winnum = bufwinnr('^' . a:fname . '$')
"     if winnum != -1
"        exe winnum . 'wincmd w'
"     else
"        if g:MRU_Auto_Close == 1 && g:MRU_Use_Current_Window == 0
"           " Jump to the window from which the MRU window was opened
"           if exists('s:MRU_last_buffer')
"              let last_winnr = bufwinnr(s:MRU_last_buffer)
"              if last_winnr != -1 && last_winnr != winnr()
"                 exe last_winnr . 'wincmd w'
"              endif
"           endif
"        else
"           if g:MRU_Use_Current_Window == 0
"              " Goto the previous window
"              " If MRU_Use_Current_Window is set to one, then the
"              " current window is used to open the file
"              wincmd p
"           endif
"        endif
" 
"        let split_window = 0
" 
"        if (!&hidden && (&modified || &previewwindow)) || a:multi
"           " Current buffer has unsaved changes or is the preview window
"           " or the user is opening multiple files
"           " So open the file in a new window
"           let split_window = 1
"        endif
" 
"        if &buftype != ''
"           " Current buffer is a special buffer (maybe used by a plugin)
"           if g:MRU_Use_Current_Window == 0 ||
"                    \ bufnr('%') != bufnr('__MRU_Files__')
"              let split_window = 1
"           endif
"        endif
" 
"        " Edit the file
"        if split_window
"           " Current buffer has unsaved changes or is a special buffer or
"           " is the preview window.  So open the file in a new window
"           if a:edit_type ==# 'edit'
"              exe 'split ' . esc_fname
"           else
"              exe 'sview ' . esc_fname
"           endif
"        else
"           if a:edit_type ==# 'edit'
"              exe 'edit ' . esc_fname
"           else
"              exe 'view ' . esc_fname
"           endif
"        endif
"     endif
" endfunction
" 
" command! -nargs=1 -complete=customlist,rtags#CompleteSymbols RtagsFindFile call rtags#FindFile(<q-args>)
" command! -complete=customlist,rtags#CompleteSymbols RtagsClassInfo call rtags#ClassInfo()
