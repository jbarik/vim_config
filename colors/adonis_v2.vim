" Vim color file

set bg=dark
hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "adonis_v2"

hi Normal	guifg=#DAD3A9 guibg=#2e2e2e
hi ErrorMsg	guifg=#ffffff guibg=#287eff

" Visual block
hi Visual       gui=NONE   guifg=#eeeeee   guibg=#4e4e8f
hi VisualNOS	guifg=#8080ff guibg=fg	gui=reverse,underline
hi Todo		guifg=#d14a14 guibg=#1248d1
hi Search	gui=BOLD guifg=#1e1e27 guibg=#D18BFF
hi IncSearch	guifg=#b0ffff guibg=#2050d0

hi SpecialKey	guifg=cyan
hi Directory	guifg=cyan
hi Title	guifg=magenta gui=none
hi WarningMsg	guifg=red
hi WildMenu	guifg=yellow guibg=black
hi ModeMsg	guifg=#22cce2
hi MoreMsg	ctermfg=darkgreen
hi Question	guifg=green gui=none
hi NonText	guifg=#0030ff

hi StatusLine	guifg=blue guibg=darkgray gui=none
hi StatusLineNC	guifg=black guibg=darkgray gui=none
hi VertSplit	guifg=black guibg=darkgray gui=none

hi Folded	guifg=#808080 guibg=#333431
hi FoldColumn	guifg=#808080 guibg=#333431
hi SignColumn	guifg=#808080 guibg=#2e2e2e

hi LineNr       gui=NONE   guifg=#8b8bcd   guibg=#333431

hi DiffAdd	guibg=darkblue
hi DiffChange	guibg=darkmagenta
hi DiffDelete	gui=bold guifg=Blue guibg=DarkCyan
hi DiffText	gui=bold guibg=Red

hi Cursor	guifg=black guibg=yellow
hi lCursor      gui=NONE   guifg=#404040   guibg=#8fff8b
hi CursorIM     gui=NONE   guifg=#404040   guibg=#8b8bff

hi MBENormal               guifg=#8ac5f3
hi MBEChanged              guifg=#eeeeee   guibg=#4e4e8f
hi MBEVisibleChanged       guifg=#eeeeee   guibg=#4e4e8f
" The file which is visible and active(the curosor is in)
hi MBEVisibleActiveNormal  gui=UNDERLINE guifg=#fa9e6e
" File is visible but not the active one
hi MBEVisibleNormal        gui=NONE guifg=#fa9e6e
" Changed and is the active window
hi MBEVisibleActiveChanged gui=UNDERLINE guifg=#f40808
""hi link MBEVisibleActiveChanged Error

hi Comment	guifg=#80a0ff
hi Constant	guifg=#ffa0a0
hi Special	guifg=Orange
hi Identifier	guifg=#40ffff cterm=none
hi Statement	none guifg=#EAEA0E gui=none
hi PreProc	guifg=#ff80ff gui=none cterm=none
hi type		guifg=#73D216 gui=none cterm=none
hi Underlined	cterm=underline term=underline
hi Ignore	guifg=bg

" Popup menu
hi Pmenu guifg=#eeeeee guibg=#42428f
hi PmenuSel guifg=#1e1e27 guibg=#D18BFF
hi PmenuSbar guifg=blue guibg=#AF89BA
hi PmenuThumb guifg=#c0c0c0

" Customization JP
hi ColorColumn ctermbg=235 guibg=#51534F

" Customization JP - with cpp-highlight
""syn match cOperator1	"\(<<\|>>\|[-+*/%&^|<>!=]\)="
""syn match cOperator1	"<<\|>>\|&&\|||\|++\|--\|->"
""syn match cOperator1	"[.!~*&%<>^|=,+-]"
""syn match cOperator1	"/[^/*=]"me=e-1
""syn match cOperator1	"/$"
""syn match cOperator1 "&&\|||"
""syn match cOperator1	"[][]"

""hi def link cOperator Operator

"""" Delimiters
""syn match cDelimiter    "[();\\]"
"""" foldmethod=syntax fix, courtesy of Ivan Freitas
""syn match cBraces display "[{}]"
""
""hi cDelimiter guifg=#D5C773
""hi cCustomFunc guifg=#dfcfe7

"" Form where is it coming
""hi jpSTL guifg=#FFCD8B

" JP : My old customization
"
"Contents of ~/.vim/after/syntax/c/c.vim
"syn match jpOper1 "||\|&&\|[-+.*]\|[<>]\|&"
"syn match jpOper1 "\(==\|!=\|>=\|<=\|=\~\|!\~\|>\|<\|=\)"
"
"syn match jpOper2 "(\|)"
"syn match jpOper2 "{\|}"
"syn match jpOper2 /\[/
"syn match jpOper2 /\]/
"
"syn match jpOper3 ",\|;\|:\|?"
"
"hi def link jpOper1     Operator
"
"" Highlight Class and Function names
"syn match    cCustomParen    "(" contains=cParen,cCppParen
"syn match    cCustomFunc     "\w\+\s*(" contains=cCustomParen
"
hi def link cCustomFunc  Function

hi ColorColumn ctermbg=235 guibg=#51534F
" jpOPer2 are | ] [ {
hi jpOPer2 guifg=#D5C773
" jpOPer3 are , ; : ?
hi jpOper3 guifg=#00BFFF
" jpSTL
hi jpSTL guifg=#FFCD8B
" .vim/after/syntax/cpp/c.vim for def or cCustomFun
""hi cCustomFunc guifg=#73d2FF
hi cCustomFunc guifg=#dfcfe7
