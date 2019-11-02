" Settings and mappings for vim-perforce plugin
" See https://github.com/nfvs/vim-perforce
"
"Prompt to open the file for edit in Perforce when starting to modify a
"read-only file.
"g:perforce_open_on_change (default: 0)
"
"let g:perforce_open_on_change =1
"
"
"Restrict Perforce automatic operations (save/change read-only files) to a
"limited set of directories. Please note that on Windows backslashes need 
"to be escaped. Example:
"let g:perforce_auto_source_dirs = ['C:\\Users\\nfvs\\Perforce']
"
"g:perforce_auto_source_dirs (default: [])
"
"
"Send relative file paths to Perforce so it can automatically detect which root
"to use (useful when sharing a Perforce repository between Linux and Windows or
"when using Cygwin).
"
"g:perforce_use_relative_paths (default: 0)
"
"
"Whether to prompt the user when a file is open for edit
"(either on change or on save).
"
"g:perforce_prompt_on_open (default: 1)
