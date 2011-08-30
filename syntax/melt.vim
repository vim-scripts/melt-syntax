" Vim Syntax File
"
" Language: MELT
" Maintainers: Pierre Vittet <pierre-vittet@pvittet.com>
" Created: 2010/09/23
" Changed: 2011/08/30:
" Remark: 
" Licence: GPL V3
" TODO:
 
" Setup
if version >= 600
	if exists("b:current_syntax")
		finish
	endif
else
	syntax clear
endif

"syn case match

syntax keyword MELTKEYWORD defun definstance instance return defclass let defprimitive defciterator defcmatcher comment match if defselector setq progn lambda forever exit return multicall letrec get_field unsafe_get_field put_fields list tuple instance defund defprimitive defiterator defcmatcher defunmatcher export_values export_macro export_class export_synonym debug_msg debugtree debuggimple assert_msg compile_warning cppif gccif cond export_value
"install_melt_gcc_pass debug_msg 

syntax include @C syntax/c.vim

syntax match GCCVAR /:[a-zA-Z0-9_]*/
syntax match MELTSTRING /".*"/

"Permit to colorize MELT var in a code_chunk
syntax match CMELTVAR /$[a-zA-Z0-9_#]*/
"Permit to get MELT var which are inside parenthesis (without this rules, a C region rules override CMELTVAR)
syntax region REGCPARENTHESIS matchgroup=CPARENT start=/(/ end=/)/ contains=CMELTVAR, CCLOSINGPARENTHESIS, REGCPARENTHESIS contained 
syntax region CODECHUNK matchgroup=MELTCODECHUNKSNIP start=/#{/ end=/}#/ keepend contains=@C, CMELTVAR,REGCPARENTHESIS

syntax match MELTCOMMENT /;.*/ 
syntax match COMMENTWITHMELTCOMMENTFUNCTION /"\*\*\*\_.\{-}\*\*\*"/


highlight link MELTKEYWORD keyword
highlight link CMELTVAR Identifier
highlight link CMELTVARPARENTCASE Identifier
highlight link MELTSTRING string
highlight link MELTCOMMENT comment
highlight link COMMENTWITHMELTCOMMENTFUNCTION comment
highlight link CODECHUNK Include
highlight link MELTCODECHUNKSNIP specialChar
highlight link MELTClASS type
highlight link GCCVAR Identifier
highlight link REGCPARENTHESIS Include
highlight link CPARENT Include

"so $VIMRUNTIME/syntax/lisp.vim 

let b:current_syntax = "melt"
