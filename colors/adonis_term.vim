" Vim color file

set bg=dark
hi clear
if exists("syntax_on")
	syntax reset
endif

let colors_name = "adonis"

hi Normal	ctermfg=#DAD3A9 ctermbg=#2e2e2e
hi ErrorMsg	ctermfg=#ffffff ctermbg=#287eff

" Visual block
hi Visual       gui=NONE   ctermfg=#eeeeee
hi VisualNOS	ctermfg=#8080ff ctermbg=fg cterm=reverse,underline
hi Todo		ctermfg=#d14a14 ctermbg=#1248d1
""hi Search	ctermfg=#2e2e2e ctermbg=#DAD3A9	ctermfg=white ctermbg=darkblue cterm=underline term=underline
hi Search	gui=BOLD ctermfg=#1e1e27 ctermbg=#D18BFF
hi IncSearch	ctermfg=#b0ffff ctermbg=#2050d0

hi SpecialKey	ctermfg=cyan
hi Directory	ctermfg=cyan
hi Title	ctermfg=magenta cterm=none 
hi WarningMsg	ctermfg=red
hi WildMenu	ctermfg=yellow ctermbg=black
hi ModeMsg	ctermfg=#22cce2	
hi MoreMsg	ctermfg=darkgreen
hi Question	ctermfg=green gui=none 
hi NonText	ctermfg=#0030ff	

hi StatusLine	ctermfg=blue ctermbg=darkgray cterm=none
hi StatusLineNC	ctermfg=black ctermbg=darkgray cterm=none
hi VertSplit	ctermfg=black ctermbg=darkgray cterm=none

hi Folded	ctermfg=#808080 ctermbg=#333431	ctermfg=darkgrey ctermbg=black cterm=bold term=bold
hi FoldColumn	ctermfg=#808080 ctermbg=#333431	ctermfg=darkgrey ctermbg=black cterm=bold term=bold
hi SignColumn	ctermfg=#808080 ctermbg=#2e2e2e	ctermfg=darkgrey ctermbg=black cterm=bold term=bold

hi LineNr       gui=NONE   ctermfg=#8b8bcd   ctermbg=#333431

hi DiffAdd	ctermbg=darkblue	ctermbg=darkblue term=none cterm=none
hi DiffChange	ctermbg=darkmagenta ctermbg=magenta cterm=none
hi DiffDelete	ctermfg=blue ctermbg=cyan gui=bold ctermfg=Blue ctermbg=DarkCyan
hi DiffText	cterm=bold ctermbg=red gui=bold ctermbg=Red

hi Cursor	ctermfg=black ctermbg=yellow ctermfg=black ctermbg=yellow
"hi Cursor         gui=NONE   ctermfg=#404040   ctermbg=#8b8bff
hi lCursor        gui=NONE   ctermfg=#404040   ctermbg=#8fff8b
hi CursorIM       gui=NONE   ctermfg=#404040   ctermbg=#8b8bff

""hi MBENormal               ctermfg=#80a0ff
hi MBENormal               ctermfg=#8ac5f3
hi MBEChanged              ctermfg=#eeeeee   ctermbg=#4e4e8f
hi MBEVisibleChanged       ctermfg=#eeeeee   ctermbg=#4e4e8f
" The file which is visible and active(the curosor is in)
hi MBEVisibleActiveNormal  gui=UNDERLINE ctermfg=#fa9e6e
" File is visible but not the active one
hi MBEVisibleNormal        gui=NONE ctermfg=#fa9e6e
" Changed and is the active window
hi MBEVisibleActiveChanged gui=UNDERLINE ctermfg=#f40808
""hi link MBEVisibleActiveChanged Error


hi Comment	ctermfg=#80a0ff ctermfg=darkred
hi Constant	ctermfg=magenta ctermfg=#ffa0a0 cterm=none
hi Special	ctermfg=brown ctermfg=Orange cterm=none gui=none
hi Identifier	ctermfg=cyan ctermfg=#40ffff cterm=none
hi Statement	ctermfg=yellow cterm=none ctermfg=#EAEA0E gui=none
hi PreProc	ctermfg=magenta ctermfg=#ff80ff gui=none cterm=none
hi type		ctermfg=green ctermfg=#73D216 gui=none cterm=none
hi Underlined	cterm=underline term=underline
hi Ignore	ctermfg=bg ctermfg=bg

" Popup menu
hi Pmenu ctermfg=#eeeeee ctermbg=#42428f
hi PmenuSel ctermfg=#1e1e27 ctermbg=#D18BFF
hi PmenuSbar ctermfg=blue ctermbg=#AF89BA
hi PmenuThumb ctermfg=#c0c0c0

" JP : My customization
hi ColorColumn ctermbg=235 ctermbg=#51534F
" jpOPer2 are | ] [ {
hi jpOPer2 ctermfg=#D5C773
" jpOPer3 are , ; : ?
hi jpOper3 ctermfg=#00BFFF
" jpSTL
""hi jpSTL ctermfg=#FFCD8B
" .vim/after/syntax/cpp/c.vim for def or cCustomFun
""hi cCustomFunc ctermfg=#73d2FF
hi cCustomFunc ctermfg=#dfcfe7
