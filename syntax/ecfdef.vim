" Vim syntax file
" Language: Ecflow definition syntax
" Maintainer: Rostislav Kouznetsov
" Latest Revision: 18 Feb 2018

if exists("b:current_syntax")
  finish
endif

syn keyword defTodo contained TODO FIXME XXX NOTE
syn match defComment "#.*$" contains=defTodo
" Keywords

syn keyword defKeyword clock edit repeat time trigger cron


syn match defUnitHeader "\<suite\>"
syn match defUnitHeader "\<family\>"
syn match defUnitHeader "\<task\>"
syn match defUnitHeader "\<end\s*task\>"
syn match defUnitHeader "\<end\s*suite\>"
syn match defUnitHeader "\<end\s*family\>"
"" syn match defECvar "\<edit\s\+\([A-Z][A-Z0-9_]\+\)\>" " Does not exactly work


" Matches

"syn match syntaxElementMatch 'regexp' contains=syntaxElement1 nextgroup=syntaxElement2 skipwhite

"syntax match Key   /^[^=]\+/
"syntax match FooValue /[^=]\+$/



" Regions
syn region defFamily transparent fold keepend extend start="\(\<end\s\+\)\@<!\<family\(\s\+\a\|\s*$\)" skip="^\s*[!#].*$" excludenl end="\<end\s*family\>" contains=defComment,defUnitHeader,defFamily,defString,defECvar,defKeyword
syn region defSuite  fold transparent keepend extend  start="\(\<end\s\+\)\@<!\<suite\(\s\+\a\|\s*$\)" skip="^\s*[!#].*$" excludenl end="\<end\s*suite\>"  contains=defComment,defUnitHeader,defString,defECvar,defKeyword,defFamily
syn region defECvar  start=+%+ end=+%+ 
syn region defString  start=+"+ end=+"+ contains=defECvar
syn region defString  start=+'+ end=+'+ contains=defECvar




"syn region defString start='"' end='"' contained


let  b:current_syntax = "ecfdef"

hi def link defComment Comment
hi def link defTodo Todo
hi def link defKeyword Keyword
"hi def link defSuite Statement
hi def link defUnitHeader PreCondit
hi def link defECvar Identifier
"hi def link

"ihi def link simpleVar Identifier
"hi def link simpleAssignment Statement
"hi def link defDesc String
hi def link defString String
