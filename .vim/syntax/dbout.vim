&quot; Vim syntax file
&quot; &quot; Language: db output
&quot; &quot; Maintainer: Jason Munro
 
syn region Heading start=/^ \l/ end=/[-+]\+$/
syn match Border &quot;|&quot;
syn match IntVal &quot; \d\+\(\n\| \)&quot;
syn match NullVal &quot; NULL\(\n\| \)&quot;
syn match NegVal &quot; -\d\+\(\n\| \)&quot;
syn match FloatVal &quot; \d\+\.\d\+\(\n\| \)&quot;
syn match NegFloatVal &quot; -\d\+\.\d\+\(\\n\| \)&quot;
syn match DateTime &quot;\d\{4}-\d\{2}-\d\{2} \d\{2}:\d\{2}:\d\{2}\(\.\d\{1,}\|\)&quot;
syn match TrueVal &quot; t\(\n\| \)&quot;
syn match FalseVal &quot; f\(\n\| \)&quot;
 
hi def Heading ctermfg=246
hi def IntVal ctermfg=229
hi def FalseVal ctermfg=88
hi def NullVal ctermfg=242
hi def Border ctermfg=240
hi def NegFloatVal ctermfg=160
hi def FloatVal ctermfg=230
hi def NegVal ctermfg=160
hi def DateTime ctermfg=111
hi def TrueVal ctermfg=64
