"let g:ycm_filetype_whitelist = {'cpp': 1, 'c': 1, 'python': 1}
"autocmd FileType cpp let b:deoplete_disable_auto_complete = 1
"
" With the following setting YCM always populates vim location list
" with diagnostic data, and one can jump with :lnext :lprevious
" short is :lne :lp
"let g:ycm_always_populate_location_list = 1

let g:ycm_use_clangd = 0

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf_mw_20.py'
let g:ycm_confirm_extra_conf = 1
let g:ycm_max_diagnostics_to_display = 2000

"ycm log level debug, info, warning, error, critical
let g:ycm_log_level = 'critical'
let g:ycm_server_use_vim_stdout = 0
let g:ycm_server_keep_logfiles = 0

"let g:ycm_add_preview_to_completeopt = 1
"let g:ycm_autoclose_preview_window_after_completion = 0
"let g:ycm_autoclose_preview_window_after_insertion = 0


" Turn ycm on for these file types
let g:ycm_filetype_whitelist = { 'cpp': 1, 'c': 1, 'python' : 1}

" Turn ycm off for these file type
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'markdown' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1,
      \}

""Ycm debuging settings
"let g:ycm_log_level = 'debug'
"let g:ycm_server_log_level = 'debug'
"let g:ycm_server_use_vim_stdout = 1
"let g:ycm_server_keep_logfiles = 1
